import { Component, EventEmitter, Input, Output, SimpleChanges } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Articulo } from 'src/app/class/articulo';
import { categoria } from 'src/app/class/categoria';
import { Busqueda } from 'src/app/class/busqueda';

@Component({
  selector: 'app-catalogo-side-menu',
  templateUrl: './catalogo-side-menu.component.html',
  styleUrls: ['./catalogo-side-menu.component.scss']
})
export class CatalogoSideMenuComponent {

  @Output() busquedaSeleccionada = new EventEmitter();
  @Output() busquedaLimpiar = new EventEmitter();
  @Output() searchTermthrow = new EventEmitter();

  @Input() categorias: String[] = [];
  @Input() rubros: String[] = [];

  @Input() articulos: Articulo[] = [];

  public articulo: Articulo;

  public busqueda: Busqueda = {
    rubro: "textil",
    categoria: "",
    searchTerm: '',
  }

  constructor(
    // private repuestosSv: repuestosService,
  ) {
    this.articulo = {};

    this.busqueda.rubro = "";
    this.busqueda.categoria = "";
  }

  altaForm = new FormGroup({
    rubro: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(40),
    ]),
    categoria: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(40),
    ]),
    searchTerm: new FormControl('', Validators.required)
  });

  public reset() {
    this.busqueda.rubro = "textil";
    this.busqueda.categoria = "";

    this.altaForm.setValue({
      rubro: '',
      categoria: '',
      searchTerm: ''
    });
    this.busquedaSeleccionada.emit(this.busqueda);
  }

  public filtraRubro() {
    this.busqueda.rubro = this.altaForm.getRawValue().rubro;
    this.busqueda.categoria = '';
    this.busquedaSeleccionada.emit(this.busqueda);
  }

  public filtracategoria() {
    this.busqueda.rubro = this.altaForm.getRawValue().rubro;
    this.busqueda.categoria = this.altaForm.getRawValue().categoria;

    
    this.busquedaSeleccionada.emit(this.busqueda);
  }


  public filterArticulos() {
    this.searchTermthrow.emit(this.altaForm.getRawValue().searchTerm);
  }
}
