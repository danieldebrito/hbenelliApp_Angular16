import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Observable, of } from 'rxjs';
import { map, take, switchMap } from 'rxjs/operators';
import { EStatus } from '../class/user'; // Asegúrate de que importas correctamente el enum

@Injectable({
  providedIn: 'root',
})
export class AdminGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): Observable<boolean> {
    return this.authService.getCurrentUser().pipe(
      switchMap((user) => {
        if (!user || !user.email) {
          // Si el usuario no está logueado, redirigir a /accessdenied
          this.router.navigate(['/accessdenied']);
          return of(false);
        }
        // Verificar si el usuario está habilitado (status = Active)
        if (user.status !== EStatus.ACTIVE) {
          // Si el usuario no está activo, redirigir a /accessdenied
          this.router.navigate(['/accessdenied']);
          return of(false);
        }
        // Si el usuario está logueado y activo, verificamos si es admin
        return this.authService.isAdmin().pipe(
          map((isAdmin: boolean) => {
            if (!isAdmin) {
              // Si el usuario no es admin, redirigir a /accessdenied
              this.router.navigate(['/accessdenied']);
              return false;
            }
            // Si el usuario es admin y está activo, permitir acceso
            return true;
          })
        );
      }),
      take(1)
    );
  }
}

