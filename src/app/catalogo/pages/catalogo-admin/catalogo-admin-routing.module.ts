import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CatalogoAdminComponent } from './catalogo-admin.component';
import { CatalogListComponent } from '../../components/catalog-list/catalog-list.component';
import { CatalogFormComponent } from '../../components/catalog-form/catalog-form.component';

const routes: Routes = [
  { path: '', component: CatalogoAdminComponent, children: [
    { path: '', component: CatalogListComponent }, // Vista por defecto
    { path: 'list', component: CatalogListComponent },
    { path: 'add', component: CatalogFormComponent },
    { path: 'edit/:id', component: CatalogFormComponent }
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogoAdminRoutingModule { }
