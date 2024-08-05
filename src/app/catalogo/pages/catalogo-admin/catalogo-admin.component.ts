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
  subrubros: Subrubro[] = [];

  constructor(private articulosService: ArticulosService, private subrubrosService: SubrubrosService) {}

  ngOnInit(): void {
    this.loadArticulos();
    this.loadSubrubros();
  }

  loadArticulos() {
    this.articulosService.getAll().subscribe((data) => {
      this.articulos = data;
    });
  }

  loadSubrubros() {
    this.subrubrosService.getAll().subscribe((data) => {
      this.subrubros = data;
    });
  }
}
