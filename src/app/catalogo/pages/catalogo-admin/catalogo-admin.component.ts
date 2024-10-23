import { Component, OnInit } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
import { categoria } from 'src/app/class/categoria';
import { ArticulosService } from 'src/app/services/articulos.service';
import { categoriasService } from 'src/app/services/categorias.service';

@Component({
  selector: 'app-catalogo-admin',
  templateUrl: './catalogo-admin.component.html',
  styleUrls: ['./catalogo-admin.component.scss'],
})
export class CatalogoAdminComponent implements OnInit {
  articulos: Articulo[] = [];
  filteredArticulos: Articulo[] = []; // Lista de artículos filtrados
  categorias: categoria[] = [];
  isListView: boolean = true; // Controla el modo de vista: lista o cards

  constructor(
    private articulosService: ArticulosService,
    private categoriasService: categoriasService
  ) {}

  ngOnInit(): void {
    this.loadArticulos();
    this.loadcategorias();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  loadArticulos() {
    this.articulosService.gets().subscribe((data) => {
      this.articulos = data;
      this.filteredArticulos = this.articulos; // Inicialmente, sin filtro
    });
  }

  loadcategorias() {
    this.categoriasService.getAll().subscribe((data) => {
      this.categorias = data;
    });
  }



  // Cambia el modo de vista
  toggleViewMode() {
    this.isListView = !this.isListView;
  }
}
