import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthService } from '../../../auth/services/auth.service';
import { UsuariosService } from '../../../auth/services/usuarios.service';
import { Usuario, ERole } from '../../../auth/class/usuario';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {

  public captchaHabilitado = true;
  public photoSelected: string = 'assets/images/placeholder-user.png';
  public urlPhotoPath = '';
  public error = false;
  public role: ERole = ERole.administrador;
  public createForm: FormGroup;

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
      nombre: new FormControl('', [Validators.required, Validators.minLength(2)]),
      apellido: new FormControl('', [Validators.required, Validators.minLength(2)]),
      sexo: new FormControl('', [Validators.required, Validators.minLength(1)]),
      dni: new FormControl('', [Validators.required, Validators.minLength(7)]),
      edad: new FormControl('', [Validators.required, Validators.min(18)]),
      fechaNacimiento: new FormControl('', [Validators.required]),
      captchaHabilitado: new FormControl(true),
    });
  }

  // Método para crear el usuario
  public async createUser(): Promise<void> {
    if (this.createForm.valid) {
      const newUser: Usuario = {
        ...this.createForm.value,
        role: this.role,
        habilitado: false,
        photoURL: this.urlPhotoPath
      };

      try {
        // Llamar al método SignUp del servicio AuthService para registrar al usuario
        const userFirebase = await this.authService.SignUp(newUser);

        // Mostrar mensaje de éxito si el registro fue exitoso
        Swal.fire({
          icon: 'success',
          title: 'Usuario registrado exitosamente',
          text: 'Por favor verifica tu correo electrónico para completar el registro.'
        });

        console.log('Usuario creado:', newUser);
      } catch (error) {
        // Manejar errores durante el registro
        console.error('Error al registrar el usuario:', error);
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Hubo un problema al registrar el usuario.',
        });
      }
    } else {
      // Mostrar un error si el formulario no es válido
      console.error("El formulario no es válido.");
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Por favor, completa todos los campos requeridos.',
      });
    }
  }

  ngOnInit(): void {
    this.role = ERole.administrador;
  }
}
