import { Component, OnInit } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
// import { ArticulosFireService } from 'src/app/services/firebase/articulos.service';
import { Busqueda } from 'src/app/class/busqueda';
import { ArticulosService } from 'src/app/services/articulos.service'
@Component({
  selector: 'app-catalog-main',
  templateUrl: './catalog-main.component.html',
  styleUrls: ['./catalog-main.component.scss']
})
export class CatalogMainComponent implements OnInit {

  public articulos: Articulo[] = [];
  public filterArticulos: Articulo[] = [];

  public subrubros: String[] = [];
  public rubros: String[] = [];
  public productos: String[] = [];

  constructor(
    private articulosSv: ArticulosService
  ) { }

  public getArticulos() {

      this.articulosSv.getAll().subscribe(data => {
      this.articulos = data;

      this.getRurbrosSubrubros(this.filterArticulos);
      this.getInicialArticulos();
    });

  }

  filtrar(event: Busqueda) {
    let filteredArticulos = [...this.articulos];

    if (event.rubro !== '') {
      filteredArticulos = [...filteredArticulos.filter(art => art.rubro === event.rubro)];
    }
    if (event.subrubro !== '') {
      filteredArticulos = filteredArticulos.filter(art => art.subrubro === event.subrubro);
    }

    this.filterArticulos = filteredArticulos;
    this.getRurbrosSubrubros(this.filterArticulos)
  }

  public getInicialArticulos(){

    let busqueda: Busqueda = {
      rubro: 'textil',
      subrubro: ''
    }
    this.filtrar(busqueda);
    this.getRurbrosSubrubros(this.articulos)
  }

  public getRurbrosSubrubros(filterArticulos: Articulo[]) {
    this.subrubros = [...new Set(filterArticulos.map(x => x.subrubro || ''))] as String[];
    this.rubros = [...new Set(filterArticulos.map(x => x.rubro || ''))] as String[];
  }

  ngOnInit(): void {
    this.getArticulos();
  }
}
