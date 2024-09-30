import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { CreateAdminRoutingModule } from './create-admin-routing.module';
import { CreateAdminComponent } from './create-admin.component';


@NgModule({
  declarations: [
    CreateAdminComponent
  ],
  imports: [
    CommonModule,
    CreateAdminRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class CreateAdminModule { }
