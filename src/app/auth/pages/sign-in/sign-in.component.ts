import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AuthService } from 'src/app/auth/services/auth.service';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss'],
})
export class SignInComponent {
  loading = false;
  mostrarPass = false;
  errorMessage: string | null = null;

  loginForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required, Validators.minLength(6)])
  });

  constructor(
    private auth: AuthService,
    private router: Router
  ) {}

  get email() {
    return this.loginForm.get('email')!;
  }

  get password() {
    return this.loginForm.get('password')!;
  }

  verOcultarPass() {
    this.mostrarPass = !this.mostrarPass;
  }

  async onLogin() {
    if (this.loginForm.invalid) return;

    this.loading = true;
    this.errorMessage = null;
    
    const { email, password } = this.loginForm.value;

    try {
      // Usar el método SignIn del AuthService
      await this.auth.SignIn({ email: email!, password: password! });
      
      // Redirigir después de autenticación exitosa
      this.router.navigate(['/home']);
    } catch (error: any) {
      console.error('Login error:', error);
      this.errorMessage = this.getFriendlyErrorMessage(error);
      
      // Mostrar alerta de SweetAlert2 para errores importantes
      if (error.code === 'auth/account-not-enabled' || 
          error.code === 'auth/email-not-verified') {
        Swal.fire({
          icon: 'error',
          title: 'Error de autenticación',
          text: this.errorMessage,
          confirmButtonText: 'Entendido'
        });
      }
    } finally {
      this.loading = false;
    }
  }

  private getFriendlyErrorMessage(error: any): string {
    // Manejar errores específicos de Firebase
    if (error?.code) {
      switch (error.code) {
        case 'auth/invalid-credential':
        case 'auth/wrong-password':
        case 'auth/user-not-found':
          return 'Credenciales inválidas. Verifique su email y contraseña';
        case 'auth/too-many-requests':
          return 'Demasiados intentos fallidos. Intente más tarde';
        case 'auth/user-disabled':
          return 'Cuenta deshabilitada. Contacte al administrador';
        case 'auth/email-not-verified':
          return 'Por favor verifique su correo electrónico';
        case 'auth/account-not-enabled':
          return 'Su cuenta no está habilitada. Contacte al administrador';
        default:
          return 'Error en la autenticación. Intente nuevamente';
      }
    }
    
    // Manejar errores personalizados del servicio
    return error?.message || 'Error desconocido al iniciar sesión';
  }
}