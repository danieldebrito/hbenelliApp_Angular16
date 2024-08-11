import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SignUpRoutingModule } from './sign-up-routing.module';
import { SignUpComponent } from './sign-up.component';

@NgModule({
  declarations: [
    SignUpComponent
  ],
  imports: [
    FormsModule,
    ReactiveFormsModule,
    CommonModule,
    SignUpRoutingModule
  ]
})
export class SignUpModule { }
