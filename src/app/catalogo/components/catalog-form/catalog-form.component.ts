// catalog-form.component.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ArticulosService } from 'src/app/services/articulos.service';
import { StorageService } from 'src/app/services/firebase/File/storage.service';
import { ActivatedRoute } from '@angular/router';

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
  uploadProgress: number | null = null;
  isSubmitting = false;
  showPhotoError = false;

  // Form control getters
  get nombre() { return this.articuloForm.get('nombre'); }
  get descripcion() { return this.articuloForm.get('descripcion'); }
  get codigo() { return this.articuloForm.get('codigo'); }
  get peso() { return this.articuloForm.get('peso'); }
  get unidad() { return this.articuloForm.get('unidad'); }
  get precioLista() { return this.articuloForm.get('precioLista'); }
  get precioNeto() { return this.articuloForm.get('precioNeto'); }
  get rubro() { return this.articuloForm.get('rubro'); }
  get categoria() { return this.articuloForm.get('categoria'); }

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private articulosService: ArticulosService,
    private storageService: StorageService
  ) {
    this.articuloForm = this.fb.group({
      nombre: ['', [Validators.required, Validators.minLength(3)]],
      descripcion: ['', [Validators.required, Validators.minLength(10)]],
      codigo: ['', Validators.required],
      peso: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      unidad: ['', Validators.required],
      precioLista: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      precioNeto: ['', [Validators.required, Validators.pattern(/^\d+(\.\d{1,2})?$/)]],
      rubro: ['', Validators.required],
      categoria: ['', Validators.required],
      observaciones: [''],
      urlPhoto: ['']
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
      reader.onload = (e: any) => {
        const img = new Image();
        img.src = e.target.result;

        img.onload = () => {
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');

          // Definir tamaño objetivo exacto
          const TARGET_WIDTH = 432;
          const TARGET_HEIGHT = 288;

          // Redimensionar el canvas al tamaño deseado
          canvas.width = TARGET_WIDTH;
          canvas.height = TARGET_HEIGHT;

          // Dibujar la imagen en el canvas con el tamaño forzado
          ctx?.drawImage(img, 0, 0, TARGET_WIDTH, TARGET_HEIGHT);

          // Convertir el canvas a Blob (archivo PNG de 32 bits)
          canvas.toBlob(
            (blob) => {
              if (blob) {
                this.imageFile = new File([blob], this.imageFile!.name, {
                  type: 'image/png',
                });
                this.imageUrl = URL.createObjectURL(this.imageFile);
                this.showPhotoError = false;
              }
            },
            'image/png',
            1
          );
        };
      };
    }
  }

  async submitForm() {
    // Reset error states
    this.showPhotoError = false;
    Object.values(this.articuloForm.controls).forEach(control => {
      control.markAsTouched();
    });

    // Photo validation
    if (!this.imageFile && !this.imageUrl) {
      this.showPhotoError = true;
      return;
    }

    // Form validation
    if (this.articuloForm.invalid) {
      return;
    }

    this.isSubmitting = true;
    let downloadURL = this.imageUrl as string;

    try {
      // Upload new image if selected
      if (this.imageFile) {
        this.uploadProgress = 0;
        downloadURL = await this.storageService.uploadFile(
          this.imageFile, 
          (progress) => this.uploadProgress = progress
        );
      }

      // Prepare form data
      const formData = {
        ...this.articuloForm.value,
        urlPhoto: downloadURL
      };

      // Save or update
      if (this.isEditMode) {
        await this.articulosService.update(this.articuloId!, formData).toPromise();
        alert('Artículo actualizado con éxito');
      } else {
        await this.articulosService.save(formData).toPromise();
        alert('Artículo agregado con éxito');
        this.articuloForm.reset();
        this.imageUrl = null;
        this.imageFile = null;
      }
    } catch (error) {
      console.error('Error:', error);
      alert('Ocurrió un error. Por favor intente nuevamente');
    } finally {
      this.isSubmitting = false;
      this.uploadProgress = null;
    }
  }
}