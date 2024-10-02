import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../class/usuario';
import { UsuariosService } from '../../services/usuarios.service';

@Component({
  selector: 'app-usuarios-listado',
  templateUrl: './usuarios-listado.component.html',
  styleUrls: ['./usuarios-listado.component.scss'],
})
export class UsuariosListadoComponent implements OnInit {

  usuarios: Usuario[] = [];

  constructor( 
    private usuariosSvc: UsuariosService
  ){}


  ngOnInit(): void {
    this.usuariosSvc.getItems().subscribe( res => {
      this.usuarios = res;
    } );
  }
  
}
