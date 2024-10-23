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
      categoria: ['', Validators.required],
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
      reader.onload = (e: any) => {
        const img = new Image();
        img.src = e.target.result;
  
        img.onload = () => {
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          
          // Definir el nuevo tamaño de la imagen (por ejemplo, 810x546)
          const MAX_WIDTH = 810;
          const MAX_HEIGHT = 546;
  
          // Obtener las dimensiones originales de la imagen
          const originalWidth = img.width;
          const originalHeight = img.height;
  
          // Calcular las nuevas dimensiones manteniendo la relación de aspecto
          let newWidth = originalWidth;
          let newHeight = originalHeight;
  
          if (originalWidth > MAX_WIDTH || originalHeight > MAX_HEIGHT) {
            const aspectRatio = originalWidth / originalHeight;
  
            if (originalWidth > originalHeight) {
              newWidth = MAX_WIDTH;
              newHeight = MAX_WIDTH / aspectRatio;
            } else {
              newHeight = MAX_HEIGHT;
              newWidth = MAX_HEIGHT * aspectRatio;
            }
          }
  
          // Ajustar el tamaño del canvas y redibujar la imagen
          canvas.width = newWidth;
          canvas.height = newHeight;
          ctx?.drawImage(img, 0, 0, newWidth, newHeight);
  
          // Convertir el canvas a Blob (archivo de imagen)
          canvas.toBlob((blob) => {
            if (blob) {
              this.imageFile = new File([blob], this.imageFile!.name, { type: this.imageFile!.type });
              this.imageUrl = URL.createObjectURL(this.imageFile); // Mostrar la imagen redimensionada
              this.articuloForm.get('urlPhoto')?.setValue(this.imageFile); // Actualizar el valor del formulario
            }
          }, this.imageFile!.type);
        };
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
        this.articulosService.save(formData).subscribe(
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
