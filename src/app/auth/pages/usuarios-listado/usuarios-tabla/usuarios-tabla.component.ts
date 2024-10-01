import { Component, OnInit } from '@angular/core';
import { FirebaseService } from 'src/app/auth/services/firebase.service';

@Component({
  selector: 'app-usuarios-tabla',
  templateUrl: './usuarios-tabla.component.html',
  styleUrls: ['./usuarios-tabla.component.scss'],
})
export class UsuariosTablaComponent implements OnInit {
  public x: number;
  usuarios: any;

  constructor( private firebaseSv: FirebaseService ) {}



  ngOnInit(): void {
    this.firebaseSv.traerColeccionTodos('usuarios').subscribe( res => {
      this.usuarios = res;

      console.log(this.usuarios);
    } );
  }
}
