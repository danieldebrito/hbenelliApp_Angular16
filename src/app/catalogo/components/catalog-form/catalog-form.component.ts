import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ArticulosService } from 'src/app/services/articulos.service';
import { StorageService } from 'src/app/services/firebase/File/storage.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Articulo } from 'src/app/class/articulo';

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
<<<<<<< HEAD
=======
  loading = false;
  imageLoading = false;
  rubros: string[] = [
    'Herramientas',
    'Electricidad',
    'Fontanería',
    'Ferretería General',
  ];
  categorias: { [key: string]: string[] } = {
    Herramientas: ['Manuales', 'Eléctricas', 'Jardinería'],
    Electricidad: ['Cables', 'Iluminación', 'Interruptores'],
    Fontanería: ['Tuberías', 'Accesorios', 'Grifería'],
    'Ferretería General': ['Tornillería', 'Sujeción', 'Selladores'],
  };
  filteredCategorias: string[] = [];
>>>>>>> 684457f0de0233ce1cc837b0bdad1925d4d2ffb4

  constructor(
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private articulosService: ArticulosService,
    private storageService: StorageService
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
                  type: 'image/png', // Asegurar PNG
                });
                this.imageUrl = URL.createObjectURL(this.imageFile); // Previsualización
                this.articuloForm.get('urlPhoto')?.setValue(this.imageFile); // Actualizar formulario
              }
            },
            'image/png', // Formato PNG
            1 // Calidad completa
          );
        };
      };
    }
<<<<<<< HEAD
=======

    if (file.size > 5 * 1024 * 1024) {
      this.snackBar.open('La imagen es demasiado grande (máx. 5MB)', 'Cerrar', {
        duration: 3000,
      });
      return;
    }

    this.imageFile = file;
    this.imageLoading = true;
    
    const reader = new FileReader();
    reader.readAsDataURL(file);
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
              this.imageFile = new File([blob], file.name, {
                type: 'image/png',
              });
              this.imageUrl = URL.createObjectURL(this.imageFile);
              this.articuloForm.get('urlPhoto')?.setValue(this.imageFile);
            }
            this.imageLoading = false;
          },
          'image/png',
          1
        );
      };

      img.onerror = () => {
        this.imageLoading = false;
        this.snackBar.open('Error al procesar la imagen', 'Cerrar', { duration: 3000 });
      };
    };

    reader.onerror = () => {
      this.imageLoading = false;
      this.snackBar.open('Error al leer la imagen', 'Cerrar', { duration: 3000 });
    };
>>>>>>> 684457f0de0233ce1cc837b0bdad1925d4d2ffb4
  }

  async submitForm() {
    if (this.articuloForm.valid) {
      const formData = new FormData();
      Object.keys(this.articuloForm.controls).forEach((key) => {
        formData.append(key, this.articuloForm.get(key)?.value);
      });

      if (this.imageFile) {
        try {
          const downloadURL = await this.storageService.uploadFile(this.imageFile);
          formData.set('urlPhoto', downloadURL); // Reemplazar la URL de la foto
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
    }
  }
}