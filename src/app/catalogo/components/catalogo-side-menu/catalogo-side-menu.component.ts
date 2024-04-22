import { Component, EventEmitter, Input, Output, SimpleChanges } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Articulo } from 'src/app/class/articulo';
import { Subrubro } from 'src/app/class/subrubro';
import { Busqueda } from 'src/app/class/busqueda';

@Component({
  selector: 'app-catalogo-side-menu',
  templateUrl: './catalogo-side-menu.component.html',
  styleUrls: ['./catalogo-side-menu.component.scss']
})
export class CatalogoSideMenuComponent {

  @Output() busquedaSeleccionada = new EventEmitter();
  @Output() busquedaLimpiar = new EventEmitter();

  @Input() subrubros: String[] = [];
  @Input() rubros: String[] = [];

  public articulo: Articulo;

  public busqueda: Busqueda = {
    rubro: "textil",
    subrubro: "",
  }

  constructor(
    // private repuestosSv: repuestosService,
  ) {
    this.articulo = {};

    this.busqueda.rubro = "";
    this.busqueda.subrubro = "";
  }

  altaForm = new FormGroup({
    rubro: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(40),
    ]),
    subrubro: new FormControl('', [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(40),
    ]),
  });

  public reset() {
    this.busqueda.rubro = "textil";
    this.busqueda.subrubro = "";

    this.altaForm.setValue({
      rubro: "",
      subrubro: ""
    });
    this.busquedaSeleccionada.emit(this.busqueda);
  }

  public onSubmit() {
    this.busqueda.rubro = this.altaForm.getRawValue().rubro;
    this.busqueda.subrubro = this.altaForm.getRawValue().subrubro;
    this.busquedaSeleccionada.emit(this.busqueda);
  }
}
