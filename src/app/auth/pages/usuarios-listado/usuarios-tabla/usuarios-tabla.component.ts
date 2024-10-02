import { Component, Input } from '@angular/core';
import { User } from 'src/app/auth/class/user';

@Component({
  selector: 'app-usuarios-tabla',
  templateUrl: './usuarios-tabla.component.html',
  styleUrls: ['./usuarios-tabla.component.scss'],
})
export class UsuariosTablaComponent {

  @Input() usuarios: User[] = [];

  public x: number;

}
