import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CatalogoAdminRoutingModule } from './catalogo-admin-routing.module';
import { CatalogoAdminComponent } from './catalogo-admin.component';
import { ComponentsModule } from '../../components/components.module';

@NgModule({
  declarations: [
    CatalogoAdminComponent
  ],
  imports: [
    CommonModule,
    CatalogoAdminRoutingModule,
    ComponentsModule
  ]
})
export class CatalogoAdminModule { }
