import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AuthService } from 'src/app/auth/services/auth.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { UsuariosService } from 'src/app/auth/services/usuarios.service';
import { ERole, Usuario } from 'src/app/auth/class/usuario';
import { EStatus } from '../../class/user';

@Component({
 selector: 'app-create-admin',
 templateUrl: './sign-in.component.html',
 styleUrls: ['./sign-in.component.scss'],
})
export class SignInComponent implements OnInit {
onLogin() {
throw new Error('Method not implemented.');
}
 public loading = false;
 public form: FormGroup;
loginForm: any;
email: any;
mostrarPass: any;
password: any;
error: any;
usuariosAccesoRapido: any;

 constructor(
  private authService: AuthService,
  private usuariosService: UsuariosService,
  private router: Router
 ) {
  this.form = new FormGroup({
   nombre: new FormControl('', [Validators.required]),
   apellido: new FormControl('', [Validators.required]),
   edad: new FormControl('', [Validators.required, Validators.min(18), Validators.max(99)]),
   dni: new FormControl('', [Validators.required, Validators.pattern('^[0-9]*$')]),
   email: new FormControl('', [Validators.required, Validators.email]),
   password: new FormControl('', [Validators.required, Validators.minLength(6)]),
  });
 }

 ngOnInit(): void {}

 public async onSignUp() {
  if (this.form.invalid) {
   return;
  }

  this.loading = true;

  const newUser = this.form.value;

  try {
   const userCredential = await this.authService.SignUp(newUser);

   if (userCredential?.user) {
    const firebaseUser = userCredential.user;
    
    // Crear el objeto de usuario para Firestore
    const usuario: Usuario = {
     uid: firebaseUser.uid,
     nombre: newUser.nombre,
     apellido: newUser.apellido,
     edad: newUser.edad,
     dni: newUser.dni,
     email: firebaseUser.email,
     password: newUser.password,
     role: ERole.administrador,
     habilitado: true,
     status: EStatus.ACTIVE,
     emailVerified: firebaseUser.emailVerified
    };

    // Guardar el usuario en Firestore
    this.usuariosService.addItem(usuario);

    Swal.fire('Registro exitoso', 'El nuevo administrador ha sido creado.', 'success');
    this.router.navigate(['/admin/dashboard']);
   }
  } catch (error: any) {
   Swal.fire('Error', error.message, 'error');
  } finally {
   this.loading = false;
  }
 }
}