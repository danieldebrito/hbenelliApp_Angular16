import { Component, OnInit } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
// import { ArticulosFireService } from 'src/app/services/firebase/articulos.service';
import { Busqueda } from 'src/app/class/busqueda';
import { ArticulosService } from 'src/app/services/articulos.service';
@Component({
  selector: 'app-catalog-main',
  templateUrl: './catalog-main.component.html',
  styleUrls: ['./catalog-main.component.scss'],
})
export class CatalogMainComponent implements OnInit {
  public articulos: Articulo[] = [];
  public filteredArticulos: Articulo[] = [];

  public subrubros: String[] = [];
  public rubros: String[] = [];

  public busqueda: Busqueda = {};

  constructor(private articulosSv: ArticulosService) {}

  public getArticulos() {
    this.articulosSv.gets().subscribe((data) => {
      this.articulos = data;

      this.getRurbrosSubrubros(this.filteredArticulos);
      this.getInicialArticulos();

      console.log(this.articulos);
    });
  }

  filtrar(event: Busqueda) {
    this.busqueda = event;
    console.log(event);

    // Copiamos la lista completa de artículos
    let filteredArticulos = [...this.articulos];

    // Filtramos por rubro si está especificado
    if (event.rubro !== '') {
      filteredArticulos = filteredArticulos.filter(
        (art) => art.rubro === event.rubro
      );
    }

    // Filtramos por subrubro si está especificado
    if (event.subrubro !== '') {
      filteredArticulos = filteredArticulos.filter(
        (art) => art.subrubro === event.subrubro
      );
    }

    // Ordenar los artículos filtrados por rubro, subrubro y nombre
    this.filteredArticulos =
      this.articulosSv.ordenarArticulos(filteredArticulos);

    // Llamar a getRurbrosSubrubros pasando los artículos ya filtrados y ordenados
    this.getRurbrosSubrubros(this.filteredArticulos);
  }

  public getInicialArticulos() {
    let busqueda: Busqueda = {
      rubro: 'textil',
      subrubro: '',
    };

    this.filtrar(busqueda);

    this.getRurbrosSubrubros(this.articulos);
  }

  public getRurbrosSubrubros(filteredArticulos: Articulo[]) {
    this.rubros = [...new Set(this.articulos.map((x) => x.rubro || ''))].filter(
      (r) => r != ''
    ) as String[];
    this.subrubros = [
      ...new Set(
        this.articulos
          .filter((x) => x.rubro == this.busqueda.rubro || '')
          .map((sr) => sr.subrubro)
      ),
    ] as String[];
  }

  // Método para filtrar los artículos en función del término de búsqueda
  filtrarPorFrase(searchTerm: string) {

    console.log(searchTerm);

    const term = searchTerm.toLowerCase();

    // Filtra los artículos por cualquier criterio
    this.filteredArticulos = this.articulos.filter(
      (articulo) =>
        articulo.rubro?.toLowerCase().includes(term) ||
        articulo.subrubro?.toLowerCase().includes(term) ||
        articulo.nombre?.toLowerCase().includes(term) ||
        articulo.codigo?.toLowerCase().includes(term) ||
        articulo.observaciones?.toLowerCase().includes(term)
    );
  }

  ngOnInit(): void {
    this.getArticulos();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
}
