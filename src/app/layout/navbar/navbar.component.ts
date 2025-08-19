import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/auth/class/usuario';
import { AuthService } from 'src/app/auth/services/auth.service';
import { Router } from '@angular/router';
import { faSignOutAlt } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {
  public currentUser: Usuario | null = null;
  public isAdmin: boolean = false;
  public isLoggingOut = false; // Indicador de logout en curso

  faSignOutAlt = faSignOutAlt;

  constructor(private authService: AuthService, private router: Router) {}


  ngOnInit(): void {
    this.authService.getCurrentUser().subscribe((user) => {
      this.currentUser = user;

      console.table(this.currentUser);

      this.isAdmin = user?.role === 'administrador';
    });
  }


  logout(): void {
    this.isLoggingOut = true; // Mostrar indicador de carga
    this.authService.SignOut().then(() => {
      this.currentUser = null;
      this.isAdmin = false;
      this.router.navigate(['/login']);
      this.isLoggingOut = false; // Ocultar indicador de carga
    }).catch(error => {
      console.error('Error al hacer logout:', error);
      this.isLoggingOut = false; // Ocultar indicador de carga
    });
  }
}