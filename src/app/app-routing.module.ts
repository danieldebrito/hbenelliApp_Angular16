import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminGuard } from './auth/guards/admin.guard';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then((m) => m.HomeModule),
  },
  {
    path: 'login',
    loadChildren: () =>
      import('./auth/pages/sign-in/sign-in.module').then((m) => m.SignInModule),
    data: { animation: 'sign-in' },
  },
  {
    path: 'register',
    loadChildren: () =>
      import('./auth/pages/sign-up/sign-up.module').then((m) => m.SignUpModule),
    data: { animation: 'sign-in' },
  },
  {
    path: 'createadmin',
    loadChildren: () =>
      import('./auth/pages/create-admin/create-admin.module').then((m) => m.CreateAdminModule),
    data: { animation: 'sign-in' },
  },
  {
    path: 'admin',
    loadChildren: () =>
      import('./auth/pages/usuarios-listado/usuarios-listado.module').then((m) => m.UsuariosListadoModule),
    data: { animation: 'sign-in' },
  },
  {
    path: 'catalogo',
    loadChildren: () =>
      import('./catalogo/pages/catalogo-main/catalog-main.module').then(
        (m) => m.CatalogMainModule
      ),
  },
  {
    path: 'nosotros',
    loadChildren: () =>
      import('./nosotros/nosotros.module').then((m) => m.NosotrosModule),
  },
  {
    path: 'contacto',
    loadChildren: () =>
      import('./contacto/contact.module').then((m) => m.ContactModule),
  },
  {
    path: 'dashboard',
    loadChildren: () =>
      import('./admin/pages/dashboard/dashboard.module').then(
        (m) => m.DashboardModule
      ),
  },
  {
    path: 'catalogoadmin',
    loadChildren: () => import('./catalogo/pages/catalogo-admin/catalogo-admin.module').then(m => m.CatalogoAdminModule),
    canActivate: [AdminGuard]
  },
  {
    path: 'dashboard',
    loadChildren: () => import('./admin/pages/dashboard/dashboard.module').then(m => m.DashboardModule),
    canActivate: [AdminGuard]
  },
  {
    path: 'sign-up',
    loadChildren: () =>
      import('./auth/pages/sign-up/sign-up.module').then((m) => m.SignUpModule),
  },
  { path: 'createadmin', loadChildren: () => import('./auth/pages/create-admin/create-admin.module').then(m => m.CreateAdminModule) },
  { path: 'usuarioslistado', loadChildren: () => import('./auth/pages/usuarios-listado/usuarios-listado.module').then(m => m.UsuariosListadoModule) },

  // { path: '**', loadChildren: () => import('./pages/page-not-found/page-not-found.module').then(m => m.PageNotFoundModule) }
];

@NgModule({
  imports: [CommonModule, RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule],
})
export class AppRoutingModule {}
