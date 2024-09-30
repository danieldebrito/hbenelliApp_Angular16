import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsuariosListadoRoutingModule } from './usuarios-listado-routing.module';
import { UsuariosListadoComponent } from './usuarios-listado.component';


@NgModule({
  declarations: [
    UsuariosListadoComponent
  ],
  imports: [
    CommonModule,
    UsuariosListadoRoutingModule
  ]
})
export class UsuariosListadoModule { }
