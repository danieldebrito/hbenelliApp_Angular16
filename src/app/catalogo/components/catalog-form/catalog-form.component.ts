// catalog-form.component.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ArticulosService } from 'src/app/services/articulos.service';
import { StorageService } from 'src/app/services/firebase/File/storage.service';
import { ActivatedRoute } from '@angular/router';
import { Articulo } from 'src/app/class/articulo';
import Swal from 'sweetalert2';

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
  isUploading = false;
  
  // Arrays para selects
  rubros: string[] = [];
  categorias: string[] = [];
  categoriasFiltradas: string[] = [];
  
  // Relación entre rubros y categorías
  rubroCategoriaMap: { [key: string]: string[] } = {};

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
    
    this.loadRubrosYCategorias();
  }

  // Cargar rubros y categorías desde el servicio
  loadRubrosYCategorias() {
    this.articulosService.gets().subscribe(articulos => {
      this.processArticulosForRubrosAndCategorias(articulos);
    });
  }

  // Procesar artículos para extraer rubros y categorías
  private processArticulosForRubrosAndCategorias(articulos: Articulo[]): void {
    // Extraer rubros únicos
    this.rubros = Array.from(new Set(articulos
      .map(a => a.rubro)
      .filter(r => r != null && r !== ''))) as string[];
    
    // Extraer categorías únicas
    this.categorias = Array.from(new Set(articulos
      .map(a => a.categoria)
      .filter(c => c != null && c !== ''))) as string[];
    
    // Crear mapa de rubro a categorías
    this.rubroCategoriaMap = {};
    articulos.forEach(articulo => {
      if (articulo.rubro && articulo.categoria) {
        if (!this.rubroCategoriaMap[articulo.rubro]) {
          this.rubroCategoriaMap[articulo.rubro] = [];
        }
        if (!this.rubroCategoriaMap[articulo.rubro].includes(articulo.categoria)) {
          this.rubroCategoriaMap[articulo.rubro].push(articulo.categoria);
        }
      }
    });
    
    this.categoriasFiltradas = [...this.categorias];
    
    // Si estamos en modo edición, actualizar las categorías filtradas
    if (this.isEditMode && this.articuloForm.value.rubro) {
      this.onRubroChange();
    }
  }

  // Cuando cambia el rubro, filtrar las categorías
  onRubroChange() {
    const selectedRubro = this.rubro?.value;
    if (selectedRubro && this.rubroCategoriaMap[selectedRubro]) {
      this.categoriasFiltradas = this.rubroCategoriaMap[selectedRubro];
    } else {
      this.categoriasFiltradas = [...this.categorias];
    }
    
    // Resetear la categoría si ya no está disponible para el rubro seleccionado
    if (this.categoria?.value && !this.categoriasFiltradas.includes(this.categoria.value)) {
      this.categoria.setValue('');
    }
  }

  loadArticulo() {
    if (this.articuloId) {
      this.articulosService.getById(this.articuloId).subscribe((articulo) => {
        this.articuloForm.patchValue(articulo);
        this.imageUrl = articulo.urlPhoto;
        
        // Si estamos en modo edición, cargar las categorías apropiadas para el rubro
        if (articulo.rubro) {
          this.onRubroChange();
        }
      });
    }
  }

  onFileChange(event: any) {
    if (event.target.files.length > 0) {
      this.imageFile = event.target.files[0];
      const reader = new FileReader();

      // Mostrar spinner de carga
      this.isUploading = true;
      
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
                
                // Ocultar spinner después de procesar la imagen
                this.isUploading = false;
              }
            },
            'image/png',
            1
          );
        };
        
        img.onerror = () => {
          this.isUploading = false;
        };
      };
      
      reader.onerror = () => {
        this.isUploading = false;
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
          (progress) => {
            this.uploadProgress = progress;
          }
        );
      }

      // Prepare form data
      const formData: Articulo = {
        ...this.articuloForm.value,
        urlPhoto: downloadURL
      };

      // Save or update
      if (this.isEditMode) {
        await this.articulosService.update(this.articuloId!, formData).toPromise();
        Swal.fire({
          title: '¡Éxito!',
          text: 'Artículo actualizado con éxito',
          icon: 'success',
          confirmButtonText: 'Aceptar'
        });
      } else {
        await this.articulosService.save(formData).toPromise();
        Swal.fire({
          title: '¡Éxito!',
          text: 'Artículo agregado con éxito',
          icon: 'success',
          confirmButtonText: 'Aceptar'
        }).then(() => {
          this.articuloForm.reset();
          this.imageUrl = null;
          this.imageFile = null;
        });
      }
    } catch (error) {
      console.error('Error:', error);
      Swal.fire({
        title: 'Error',
        text: 'Ocurrió un error. Por favor intente nuevamente',
        icon: 'error',
        confirmButtonText: 'Aceptar'
      });
    } finally {
      this.isSubmitting = false;
      this.uploadProgress = null;
    }
  }
}