import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
  { path: 'catalogo', loadChildren: () => import('./catalogo/pages/catalogo-main/catalog-main.module').then(m => m.CatalogMainModule) },
  { path: 'nosotros', loadChildren: () => import('./nosotros/nosotros.module').then(m => m.NosotrosModule) },
  { path: 'contacto', loadChildren: () => import('./contacto/contact.module').then(m => m.ContactModule) },
  { path: 'dashboard', loadChildren: () => import('./admin/pages/dashboard/dashboard.module').then(m => m.DashboardModule) },
  { path: 'catalogoadmin', loadChildren: () => import('./catalogo/pages/catalogo-admin/catalogo-admin.module').then(m => m.CatalogoAdminModule) },

  // { path: '**', loadChildren: () => import('./pages/page-not-found/page-not-found.module').then(m => m.PageNotFoundModule) }
];

@NgModule({
  imports: [CommonModule, RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
  })
  
  export class AppRoutingModule { }
