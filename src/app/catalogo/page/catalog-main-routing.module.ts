import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CatalogMainComponent } from './catalog-main.component';

const routes: Routes = [
  { path: '', component: CatalogMainComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogMainRoutingModule { }
