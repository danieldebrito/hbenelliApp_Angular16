import { Injectable, NgZone } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { Router } from '@angular/router';
import { Observable, Subject, of } from 'rxjs';
import { catchError, map, switchMap, tap } from 'rxjs/operators';
import { ERole, Usuario } from '../class/usuario';
import { LogUserService } from './log-user.service';
import { UsuariosService } from './usuarios.service';
import { firstValueFrom } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  public currentUser: Usuario | null = null;
  private _userLoggedOutSubject = new Subject<void>();

  constructor(
    private usuariosSv: UsuariosService,
    private logService: LogUserService,
    public afsA: AngularFirestore,
    public afAuth: AngularFireAuth,
    public router: Router,
    public ngZone: NgZone
  ) {
    this.afAuth.authState.subscribe((user) => {
      if (user) {
        this.usuariosSv.getItemByUid(user.uid).subscribe((userData) => {
          this.currentUser = userData as Usuario;
          localStorage.setItem('user', JSON.stringify(this.currentUser));
        });
      } else {
        this.currentUser = null;
        localStorage.removeItem('user');
      }
    });
  }

  getCurrentUserValue(): Usuario | null {
    return this.currentUser;
  }

  isAdmin(): boolean {
    return this.currentUser?.role === ERole.administrador;
  }

  get userLoggedOut$(): Observable<void> {
    return this._userLoggedOutSubject.asObservable();
  }

  public getCurrentUser(): Observable<Usuario | null> {
    return this.afAuth.authState.pipe(
      switchMap(user => {
        if (user) {
          if (this.currentUser && this.currentUser.uid === user.uid) {
            return of(this.currentUser);
          }
          return this.usuariosSv.getItemByUid(user.uid).pipe(
            tap(usuario => {
              this.currentUser = usuario as Usuario;
              localStorage.setItem('user', JSON.stringify(this.currentUser));
            })
          );
        } else {
          return of(null);
        }
      }),
      catchError(error => {
        console.error('Error obteniendo usuario:', error);
        return of(null);
      })
    );
  }


async SignIn(credentials: { email: string; password: string }): Promise<Usuario> {
  try {
    const result = await this.afAuth.signInWithEmailAndPassword(
      credentials.email,
      credentials.password
    );

    if (!result.user) {
      throw { code: 'auth/no-user', message: 'No se pudo autenticar el usuario' };
    }

    // Traer usuario desde Firestore
    const userDoc = await firstValueFrom(this.usuariosSv.getItemByUid(result.user.uid));
    const usuario = userDoc as Usuario;

    if (!usuario) {
      await this.afAuth.signOut();
      throw { code: 'auth/user-not-registered', message: 'Usuario no registrado en el sistema' };
    }

    if (!usuario.habilitado) {
      await this.afAuth.signOut();
      throw { code: 'auth/account-not-enabled', message: 'Cuenta deshabilitada' };
    }

    /*
    if (!result.user.emailVerified) {
      await this.SendVerificationMail();
      await this.afAuth.signOut();
      throw { code: 'auth/email-not-verified', message: 'Email no verificado' };
    }*/

    // Si pasó todas las validaciones
    this.currentUser = usuario;
    localStorage.setItem('user', JSON.stringify(usuario));
    this.router.navigate(['/home']);

    // Log acceso
    this.logService.addItem({
      usuario: usuario,
      fechaIngreso: new Date(),
    });

    return usuario; // 👈 devolvemos el usuario y no navegamos acá

  } catch (error: any) {
    console.error('Error en inicio de sesión:', error);
    throw error;
  }
}


  async SignUp(newUser: Usuario): Promise<any> {
    return this.afAuth.createUserWithEmailAndPassword(newUser.email, newUser.password);
  }

  async SignOut(): Promise<void> {
    await this.afAuth.signOut();
    this.router.navigate(['/sign-in']);
    this._userLoggedOutSubject.next();
  }

  async SendVerificationMail(): Promise<void> {
    const user = await this.afAuth.currentUser;
    if (user) {
      await user.sendEmailVerification();
      this.router.navigate(['/verify-email']);
    }
  }
}