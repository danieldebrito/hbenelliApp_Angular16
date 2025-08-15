import { Injectable, NgZone } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/compat/firestore';
import { Router } from '@angular/router';
import { Observable, Subject, of, throwError } from 'rxjs';
import { catchError, map, switchMap } from 'rxjs/operators';
import Swal from 'sweetalert2';
import { ERole, Usuario } from '../class/usuario';
import { LogUserService } from './log-user.service';
import { UsuariosService } from './usuarios.service';

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

 get userLoggedOut$(): Observable<void> {
  return this._userLoggedOutSubject.asObservable();
 }

 public getCurrentUser(): Observable<Usuario | null> {
  return this.afAuth.authState.pipe(
   switchMap(user => {
    if (user) {
     return this.usuariosSv.getItemByUid(user.uid) as Observable<Usuario>;
    } else {
     return of(null);
    }
   })
  );
 }

async SignIn(credentials: { email: string; password: string }): Promise<void> {
  try {
    const result = await this.afAuth.signInWithEmailAndPassword(
      credentials.email,
      credentials.password
    );

    if (!result.user) {
      throw new Error('No se pudo autenticar el usuario');
    }

    // Obtener datos del usuario desde Firestore
    const userDoc = await this.usuariosSv.getItemByUid(result.user.uid).toPromise();
    const usuario = userDoc as Usuario;

    if (!usuario) {
      await this.afAuth.signOut();
      throw { 
        code: 'auth/user-not-registered', 
        message: 'Usuario no registrado en el sistema' 
      };
    }

    if (!usuario.habilitado) {
      await this.afAuth.signOut();
      throw { 
        code: 'auth/account-not-enabled', 
        message: 'Cuenta deshabilitada' 
      };
    }

    if (!result.user.emailVerified) {
      await this.SendVerificationMail();
      throw { 
        code: 'auth/email-not-verified', 
        message: 'Email no verificado' 
      };
    }

    // Actualizar datos de usuario
    this.currentUser = usuario;
    localStorage.setItem('user', JSON.stringify(usuario));

    // Guardar log de acceso
    const log = {
      usuario: usuario,
      fechaIngreso: new Date(),
    };
    this.logService.addItem(log);

    // Navegar a la página principal
    this.ngZone.run(() => {
      this.router.navigate(['/home']);
    });
    
  } catch (error: any) {
    console.error('Error en inicio de sesión:', error);
    
    // Propagamos el código de error original
    if (error.code) {
      throw { 
        code: error.code, 
        message: error.message 
      };
    }
    
    // Para errores de Firebase, mantenemos la estructura
    if (error?.code?.startsWith('auth/')) {
      throw error;
    }
    
    // Para otros errores, creamos una estructura consistente
    throw { 
      code: 'auth/general-error', 
      message: error.message || 'Error de autenticación' 
    };
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

 isAdmin(): Observable<boolean> {
  return this.afAuth.authState.pipe(
   switchMap((user) => {
    if (user) {
     return this.afsA.doc<Usuario>(`usuarios/${user.uid}`).valueChanges();
    }
    return of(null);
   }),
   map((usuario) => {
    return !!usuario && usuario.role === ERole.administrador;
   }),
   catchError((error) => {
    console.error('Error al verificar rol:', error);
    return of(false);
   })
  );
 }
}