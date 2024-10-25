import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UsuariosListadoRoutingModule } from './usuarios-listado-routing.module';
import { UsuariosListadoComponent } from './usuarios-listado.component';
import { UsuariosTablaComponent } from './usuarios-tabla/components/usuarios-tabla.component';
import { NgxPaginationModule } from 'ngx-pagination';


@NgModule({
  declarations: [
    UsuariosListadoComponent,
    UsuariosTablaComponent
  ],
  imports: [
    CommonModule,
    UsuariosListadoRoutingModule,
    NgxPaginationModule
  ],
  exports: [
      UsuariosListadoComponent,
      UsuariosTablaComponent
    ],
})
export class UsuariosListadoModule { }
