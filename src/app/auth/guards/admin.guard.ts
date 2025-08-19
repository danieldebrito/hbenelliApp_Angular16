import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';
import { Observable, of } from 'rxjs';
import { switchMap, take } from 'rxjs/operators';
import {  ERole, EStatus } from '../class/usuario';

@Injectable({
  providedIn: 'root',
})
export class AdminGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): Observable<boolean> {
    return this.authService.getCurrentUser().pipe(
      switchMap((user) => {
        if (!user || !user.email) {
          this.router.navigate(['/accessdenied']);
          return of(false);
        }
        
        if (user.status !== EStatus.activo) {
          this.router.navigate(['/accessdenied']);
          return of(false);
        }
        
        const isAdmin = user.role === ERole.ADMIN;
        
        if (!isAdmin) {
          console.warn('Usuario no es admin. Rol actual:', user.role);
          this.router.navigate(['/accessdenied']);
          return of(false);
        }
        
        return of(true);
      }),
      take(1)
    );
  }
}