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

  public categorias: String[] = [];
  public rubros: String[] = [];

  public busqueda: Busqueda = {};

  constructor(private articulosSv: ArticulosService) {}

  public getArticulos() {
    this.articulosSv.gets().subscribe((data) => {
      this.articulos = data;

      this.getRurbroscategorias(this.filteredArticulos);
      this.getInicialArticulos();

    });
  }

  filtrar(event: Busqueda) {
    this.busqueda = event;

    // Copiamos la lista completa de artículos
    let filteredArticulos = [...this.articulos];

    // Filtramos por rubro si está especificado
    if (event.rubro !== '') {
      filteredArticulos = filteredArticulos.filter(
        (art) => art.rubro === event.rubro
      );
    }

    // Filtramos por categoria si está especificado
    if (event.categoria !== '') {
      filteredArticulos = filteredArticulos.filter(
        (art) => art.categoria === event.categoria
      );
    }

    // Ordenar los artículos filtrados por rubro, categoria y nombre
    this.filteredArticulos =
      this.articulosSv.ordenarArticulos(filteredArticulos);

    // Llamar a getRurbroscategorias pasando los artículos ya filtrados y ordenados
    this.getRurbroscategorias(this.filteredArticulos);
  }

  public getInicialArticulos() {
    let busqueda: Busqueda = {
      rubro: 'textil',
      categoria: '',
    };

    this.filtrar(busqueda);

    this.getRurbroscategorias(this.articulos);
  }

  public getRurbroscategorias(filteredArticulos: Articulo[]) {
    this.rubros = [...new Set(this.articulos.map((x) => x.rubro || ''))].filter(
      (r) => r != ''
    ) as String[];
    this.categorias = [
      ...new Set(
        this.articulos
          .filter((x) => x.rubro == this.busqueda.rubro || '')
          .map((sr) => sr.categoria)
      ),
    ] as String[];
  }

  // Método para filtrar los artículos en función del término de búsqueda
  filtrarPorFrase(searchTerm: string) {


    const term = searchTerm.toLowerCase();

    // Filtra los artículos por cualquier criterio
    this.filteredArticulos = this.articulos.filter(
      (articulo) =>
        articulo.rubro?.toLowerCase().includes(term) ||
        articulo.categoria?.toLowerCase().includes(term) ||
        articulo.nombre?.toLowerCase().includes(term) ||
        articulo.codigo?.toLowerCase().includes(term) ||
        articulo.observaciones?.toLowerCase().includes(term) ||
        articulo.categoria?.toLowerCase().includes(term)
    );
  }

  ngOnInit(): void {
    this.getArticulos();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }
}
