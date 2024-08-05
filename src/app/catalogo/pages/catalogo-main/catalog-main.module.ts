import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CatalogMainRoutingModule } from './catalog-main-routing.module';
import { CatalogMainComponent } from './catalog-main.component';
import { ComponentsModule } from '../../components/components.module';


@NgModule({
  declarations: [
    CatalogMainComponent
  ],
  imports: [
    CommonModule,
    CatalogMainRoutingModule,
    ComponentsModule
  ]
})
export class CatalogMainModule { }
