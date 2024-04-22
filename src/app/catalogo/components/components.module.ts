import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CatalogCardsGridComponent } from './catalog-cards-grid/catalog-cards-grid.component';
import { CatalogoSideMenuComponent } from './catalogo-side-menu/catalogo-side-menu.component';
import { ReactiveFormsModule } from '@angular/forms';
import { NgxPaginationModule } from 'ngx-pagination';
import { CardComponent } from './card/card.component';


@NgModule({
  declarations: [
    CatalogCardsGridComponent,
    CatalogoSideMenuComponent,
    CardComponent,
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    NgxPaginationModule
  ],
  exports: [
    CatalogCardsGridComponent,
    CatalogoSideMenuComponent,
  ]
})
export class ComponentsModule { }
