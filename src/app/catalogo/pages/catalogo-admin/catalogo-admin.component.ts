import { Component, OnInit } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
import { Subrubro } from 'src/app/class/subrubro';
import { ArticulosService } from 'src/app/services/articulos.service';
import { SubrubrosService } from 'src/app/services/subrubros.service';

@Component({
  selector: 'app-catalogo-admin',
  templateUrl: './catalogo-admin.component.html',
  styleUrls: ['./catalogo-admin.component.scss'],
})
export class CatalogoAdminComponent implements OnInit {
  articulos: Articulo[] = [];
  filteredArticulos: Articulo[] = []; // Lista de artículos filtrados
  subrubros: Subrubro[] = [];
  isListView: boolean = true; // Controla el modo de vista: lista o cards

  constructor(
    private articulosService: ArticulosService,
    private subrubrosService: SubrubrosService
  ) {}

  ngOnInit(): void {
    this.loadArticulos();
    this.loadSubrubros();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  loadArticulos() {
    this.articulosService.gets().subscribe((data) => {
      this.articulos = data;
      this.filteredArticulos = this.articulos; // Inicialmente, sin filtro
    });
  }

  loadSubrubros() {
    this.subrubrosService.getAll().subscribe((data) => {
      this.subrubros = data;
    });
  }



  // Cambia el modo de vista
  toggleViewMode() {
    this.isListView = !this.isListView;
  }
}
