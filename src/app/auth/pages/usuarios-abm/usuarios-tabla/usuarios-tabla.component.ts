import { Component, EventEmitter, Input, Output } from '@angular/core';
import { EStatus, User } from "src/app/auth/class/user";

@Component({
  selector: 'app-usuarios-tabla',
  templateUrl: './usuarios-tabla.component.html',
  styleUrls: ['./usuarios-tabla.component.scss'],
})
export class UsuariosTablaComponent {

  @Input() usuarios: User[] = [];
  @Output() lanzaUser  = new EventEmitter();

  public x: number;

  public update(admin: User, status: EStatus){

    admin.status = status;
    this.lanzaUser.emit(admin);
  }

}
