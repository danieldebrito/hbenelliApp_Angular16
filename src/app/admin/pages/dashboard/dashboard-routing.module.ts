import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { AdminGuard } from 'src/app/auth/guards/admin.guard';

const routes: Routes = [
  {
    path: '',
    component: DashboardComponent,
    canActivate: [AdminGuard],
    children: [
      {
        path: 'usuarioslistado',
        loadChildren: () =>
          import('./../../../auth/pages/usuarios-abm/usuarios-listado.module').then(
            (m) => m.UsuariosListadoModule
          ),
      },
      {
        path: 'catalogoadmin',
        loadChildren: () =>
          import('../../../catalogo/pages/catalogo-admin/catalogo-admin.module').then(
            (m) => m.CatalogoAdminModule
          ),
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class DashboardRoutingModule {}
