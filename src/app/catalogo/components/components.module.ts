import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CatalogCardsGridComponent } from './catalog-cards-grid/catalog-cards-grid.component';
import { CatalogoSideMenuComponent } from './catalogo-side-menu/catalogo-side-menu.component';
import { ReactiveFormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';
import { CardComponent } from './card/card.component';
import { CatalogListComponent } from './catalog-list/catalog-list.component';
import { CatalogItemComponent } from './catalog-item/catalog-item.component';
import { AdminNavbarComponent } from './admin-navbar/admin-navbar.component';
import { RouterModule } from '@angular/router';
import { CatalogFormComponent } from './catalog-form/catalog-form.component';

@NgModule({
  declarations: [
    CatalogCardsGridComponent,
    CatalogoSideMenuComponent,
    CardComponent,
    CatalogListComponent,
    CatalogItemComponent,
    AdminNavbarComponent,
    CatalogFormComponent,
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    NgxPaginationModule,
    RouterModule
  ],
  exports: [
    CatalogCardsGridComponent,
    CatalogoSideMenuComponent,
    CardComponent,
    CatalogListComponent,
    CatalogItemComponent,
    AdminNavbarComponent,
    CatalogFormComponent,
  ],
})
export class ComponentsModule { }
