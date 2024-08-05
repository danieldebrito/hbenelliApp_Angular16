import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Articulo } from 'src/app/class/articulo';
import { ArticulosService } from 'src/app/services/articulos.service';

@Component({
  selector: 'app-catalog-form',
  templateUrl: './catalog-form.component.html',
  styleUrls: ['./catalog-form.component.scss']
})
export class CatalogFormComponent implements OnInit {
  articuloForm: FormGroup;
  isEditMode = false;
  articuloId: number | null = null;
  imageUrl: string | ArrayBuffer | null = null;
  imageFile: File | null = null;

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private articulosService: ArticulosService
  ) {
    this.articuloForm = this.fb.group({
      nombre: ['', Validators.required],
      descripcion: ['', Validators.required],
      codigo: ['', Validators.required],
      peso: ['', Validators.required],
      unidad: ['', Validators.required],
      precioLista: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      precioNeto: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      rubro: ['', Validators.required],
      subrubro: ['', Validators.required],
      observaciones: [''],
      urlPhoto: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.articuloId = +params.get('id')!;
      if (this.articuloId) {
        this.isEditMode = true;
        this.loadArticulo();
      }
    });
  }

  loadArticulo() {
    if (this.articuloId) {
      this.articulosService.getById(this.articuloId).subscribe((articulo: Articulo) => {
        this.articuloForm.patchValue(articulo);
        this.imageUrl = articulo.urlPhoto;
      });
    }
  }

  onFileChange(event: any) {
    if (event.target.files.length > 0) {
      this.imageFile = event.target.files[0];
      const reader = new FileReader();
      reader.readAsDataURL(this.imageFile);
      reader.onload = () => {
        this.imageUrl = reader.result as string;
        this.articuloForm.patchValue({ urlPhoto: this.imageUrl });
      };
    }
  }

  submitForm() {
    if (this.articuloForm.valid) {
      const articuloData: Articulo = this.articuloForm.value;
      if (this.isEditMode) {
        this.articulosService.update(this.articuloId!, articuloData).subscribe(() => {
          alert('Artículo actualizado con éxito');
        });
      } else {
        this.articulosService.create(articuloData).subscribe(() => {
          alert('Artículo agregado con éxito');
          this.articuloForm.reset();
          this.imageUrl = null;
        });
      }
    }
  }
}
