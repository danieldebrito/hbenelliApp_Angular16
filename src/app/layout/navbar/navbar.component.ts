import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/auth/class/usuario';
import { AuthService } from 'src/app/auth/services/auth.service';


@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements OnInit {
  public currentUser: Usuario | null = null;
  public isAdmin: boolean = false;

  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.authService.getCurrentUser().subscribe((user) => {
      this.currentUser = user;
      this.isAdmin = user?.role === 'administrador';
    });
  }
}
