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
  articuloId: string | null = null;
  imageUrl: string | ArrayBuffer | null = null;
  imageFile: File | null = null;
  loading = false;
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

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: FormBuilder,
    private articulosService: ArticulosService,
    private storageService: StorageService,
    private snackBar: MatSnackBar
  ) {
    this.articuloForm = this.fb.group({
      nombre: ['', [Validators.required, Validators.maxLength(100)]],
      descripcion: ['', [Validators.required, Validators.maxLength(500)]],
      codigo: ['', [Validators.required, Validators.pattern(/^[A-Z0-9-]+$/)]],
      peso: ['', [Validators.required, Validators.min(0.01)]],
      unidad: ['kg', Validators.required],
      precioLista: ['', [Validators.required, Validators.min(0.01)]],
      precioNeto: ['', [Validators.required, Validators.min(0.01)]],
      rubro: ['', Validators.required],
      categoria: ['', Validators.required],
      observaciones: ['', Validators.maxLength(1000)],
      urlPhoto: [null, this.isEditMode ? [] : [Validators.required]],
    });
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe((params) => {
      this.articuloId = params.get('id');
      if (this.articuloId) {
        this.isEditMode = true;
        this.articuloForm.get('urlPhoto')?.clearValidators();
        this.articuloForm.get('urlPhoto')?.updateValueAndValidity();
        this.loadArticulo();
      }
    });

    this.articuloForm.get('rubro')?.valueChanges.subscribe((rubro) => {
      this.filteredCategorias = this.categorias[rubro] || [];
      this.articuloForm.get('categoria')?.setValue('');
    });
  }

  loadArticulo() {
    if (this.articuloId) {
      this.loading = true;
      this.articulosService.getById(Number(this.articuloId)).subscribe({
        next: (articulo) => {
          this.articuloForm.patchValue(articulo);
          this.imageUrl = articulo.urlPhoto;
          this.loading = false;
        },
        error: (error) => {
          console.error('Error cargando artículo:', error);
          this.snackBar.open('Error al cargar el artículo', 'Cerrar', {
            duration: 3000,
          });
          this.loading = false;
        },
      });
    }
  }

  goToCatalogo() {
    this.router.navigate(['/catalogo']);
  }

  onDrop(event: DragEvent): void {
    event.preventDefault();
    if (event.dataTransfer && event.dataTransfer.files.length > 0) {
      const file = event.dataTransfer.files[0];
      this.onFileChange({ target: { files: [file] } });
    }
  }

  onDragOver(event: DragEvent): void {
    event.preventDefault();
    event.stopPropagation();
  }

  onFileChange(event: any) {
    const file = event.target.files[0];
    if (!file) return;

    const validTypes = ['image/jpeg', 'image/png', 'image/webp'];
    if (!validTypes.includes(file.type)) {
      this.snackBar.open(
        'Formato de imagen no válido. Use JPEG, PNG o WebP',
        'Cerrar',
        { duration: 3000 }
      );
      return;
    }

    if (file.size > 5 * 1024 * 1024) {
      this.snackBar.open('La imagen es demasiado grande (máx. 5MB)', 'Cerrar', {
        duration: 3000,
      });
      return;
    }

    this.imageFile = file;
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      this.imageUrl = reader.result;
      this.articuloForm.get('urlPhoto')?.setValue(file);
    };
  }

  async submitForm() {
    if (this.articuloForm.invalid || this.loading) return;

    this.loading = true;
    const formValue = this.articuloForm.value;
    let downloadURL = formValue.urlPhoto;

    try {
      // Subir nueva imagen si existe
      if (this.imageFile && typeof downloadURL !== 'string') {
        downloadURL = await this.storageService.uploadFile(this.imageFile);
      }

      const articuloData: Articulo = {
        ...formValue,
        urlPhoto: downloadURL,
        fechaActualizacion: new Date().toISOString(),
      };

      if (this.isEditMode && this.articuloId) {
        await this.articulosService.update(this.articuloId, articuloData);
        this.snackBar.open('Artículo actualizado con éxito', 'Cerrar', {
          duration: 3000,
        });
      } else {
        articuloData.created_at = new Date().toISOString();
        await this.articulosService.save(articuloData);
        this.snackBar.open('Artículo creado con éxito', 'Cerrar', {
          duration: 3000,
        });
        this.router.navigate(['/catalogo']);
      }
    } catch (error) {
      console.error('Error guardando artículo:', error);
      this.snackBar.open('Error al guardar el artículo', 'Cerrar', {
        duration: 3000,
      });
    } finally {
      this.loading = false;
    }
  }
}
