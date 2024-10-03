import { Component, EventEmitter, Input, Output } from '@angular/core';
import { EStatus, User } from "src/app/auth/class/user";  // Importa EStatus

@Component({
  selector: 'app-usuarios-tabla',
  templateUrl: './usuarios-tabla.component.html',
  styleUrls: ['./usuarios-tabla.component.scss'],
})
export class UsuariosTablaComponent {

  @Input() usuarios: User[] = [];
  @Output() lanzaUser = new EventEmitter<User>();

  public x: number;

  // Exponer el enum EStatus para utilizarlo en el HTML
  public EStatus = EStatus;

  // Función para actualizar el estado del usuario
  public update(admin: User, newStatus: EStatus): void {
    admin.status = newStatus;
    this.lanzaUser.emit(admin);  // Emitir el cambio del usuario
  }

  // Función para eliminar el usuario (ejemplo básico)
  public deleteAdmin(admin: User): void {
    console.log('Eliminar admin:', admin);
    // Aquí puedes agregar la lógica para eliminar al usuario
  }
}
