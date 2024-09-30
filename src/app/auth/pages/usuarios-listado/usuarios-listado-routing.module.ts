import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { UsuariosListadoComponent } from './usuarios-listado.component';

const routes: Routes = [{ path: '', component: UsuariosListadoComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsuariosListadoRoutingModule { }
