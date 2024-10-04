import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthService } from '../../../auth/services/auth.service';
import Swal from 'sweetalert2';
import { ERole, User } from '../../class/user';

@Component({
  selector: 'app-create-admin',
  templateUrl: './create-admin.component.html',
  styleUrls: ['./create-admin.component.scss']
})
export class CreateAdminComponent {

  public createForm: FormGroup;
  public role: ERole = ERole.ADMIN;

  constructor(
    private authService: AuthService) {
    this.createForm = this.buildForm();
  }

  // Método para construir el formulario reactivo
  private buildForm(): FormGroup {
    return new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email, Validators.minLength(6)]),
      password: new FormControl('', [Validators.required, Validators.minLength(6)]),
      displayName: new FormControl('', [Validators.required, Validators.minLength(2)]),
    });
  }

  // Método para crear el usuario
  public async createUser(): Promise<void> {
    if (this.createForm.valid) {
      const newUser: User = {
        ...this.createForm.value,
        role: this.role,
        habilitado: false,
        photoURL: 'assets/images/placeholder-user.png'
      };

      try {
        const userFirebase = await this.authService.SignUp(newUser);

        Swal.fire({
          icon: 'success',
          title: 'Usuario registrado exitosamente',
          text: 'Por favor verifica tu correo electrónico para completar el registro.'
        });

        console.log('Usuario creado:', newUser);
      } catch (error) {
        console.error('Error al registrar el usuario:', error);
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Hubo un problema al registrar el usuario.',
        });
      }
    } else {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Por favor, completa todos los campos requeridos.',
      });
    }
  }
}
