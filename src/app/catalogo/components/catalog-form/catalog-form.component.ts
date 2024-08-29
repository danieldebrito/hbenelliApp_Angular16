import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ArticulosService } from 'src/app/services/articulos.service';
import { StorageService } from 'src/app/services/firebase/File/storage.service';

@Component({
  selector: 'app-catalog-form',
  templateUrl: './catalog-form.component.html',
  styleUrls: ['./catalog-form.component.scss'],
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
    private articulosService: ArticulosService,
    private storageService: StorageService // Inyección del servicio
  ) {
    this.articuloForm = this.fb.group({
      nombre: ['', Validators.required],
      descripcion: ['', Validators.required],
      codigo: ['', Validators.required],
      peso: ['', Validators.required],
      unidad: ['', Validators.required],
      precioLista: [
        '',
        [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)],
      ],
      precioNeto: [
        '',
        [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)],
      ],
      rubro: ['', Validators.required],
      subrubro: ['', Validators.required],
      observaciones: [''],
      urlPhoto: ['', Validators.required],
    });
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      this.articuloId = +params.get('id')!;
      if (this.articuloId) {
        this.isEditMode = true;
        this.loadArticulo();
      }
    });
  }

  loadArticulo() {
    if (this.articuloId) {
      this.articulosService.getById(this.articuloId).subscribe((articulo) => {
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
        this.articuloForm.get('urlPhoto')?.setValue(this.imageFile); // Update form control value
      };
    }
  }

  async submitForm() {
    if (this.articuloForm.valid) {
      console.log('Formulario válido'); // Añadir este log para verificar el estado del formulario

      const formData = new FormData();
      Object.keys(this.articuloForm.controls).forEach((key) => {
        formData.append(key, this.articuloForm.get(key)?.value);
      });

      if (this.imageFile) {
        try {
          const downloadURL = await this.storageService.uploadFile(this.imageFile);
          formData.set('urlPhoto', downloadURL); // Use set to replace existing value
        } catch (error) {
          console.error('Error al subir la imagen:', error);
          return;
        }
      }

      if (this.isEditMode) {
        this.articulosService.update(this.articuloId!, formData).subscribe(
          () => {
            alert('Artículo actualizado con éxito');
          },
          (error) => {
            console.error('Error al actualizar el artículo:', error);
          }
        );
      } else {
        this.articulosService.create(formData).subscribe(
          () => {
            alert('Artículo agregado con éxito');
            this.articuloForm.reset();
            this.imageUrl = null;
          },
          (error) => {
            console.error('Error al agregar el artículo:', error);
          }
        );
      }
    } else {
      console.log('Formulario inválido'); // Añadir este log para verificar el estado del formulario
    }
  }
}
