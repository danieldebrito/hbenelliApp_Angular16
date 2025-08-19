import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../class/usuario';
import { UsuariosService } from '../../services/usuarios.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-usuarios-listado',
  templateUrl: './usuarios-listado.component.html',
  styleUrls: ['./usuarios-listado.component.scss'],
})
export class UsuariosListadoComponent implements OnInit {


  usuarios: Usuario[] = [];

  constructor( 
    private usuariosSvc: UsuariosService,
    public router: Router,
  ){}

  public updateUser(user: any){

    this.usuariosSvc.update(user);
  }

  navegar(arg0: string) {
    this.router.navigate([arg0]);
    }

  ngOnInit(): void {
    this.usuariosSvc.getItems().subscribe( res => {
      this.usuarios = res;
    } );
  }
  
}
