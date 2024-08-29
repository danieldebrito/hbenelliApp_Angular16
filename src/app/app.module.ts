import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { initializeApp, provideFirebaseApp } from '@angular/fire/app';
import { getAuth, provideAuth } from '@angular/fire/auth';
import { getFirestore, provideFirestore } from '@angular/fire/firestore';
import { getDatabase, provideDatabase } from '@angular/fire/database';
import { LayoutModule } from './layout/layout.module';
import { HttpClientModule, provideHttpClient, withFetch } from '@angular/common/http';
import { AngularFireModule, FIREBASE_OPTIONS } from '@angular/fire/compat';

// Importa environment para usar la configuración de Firebase
import { environment } from '../environments/environment';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    HttpClientModule, // Importa HttpClientModule
    provideFirebaseApp(() => initializeApp(environment.firebase)), // Utiliza la configuración de environment
    AngularFireModule.initializeApp(environment.firebase), // Utiliza la configuración de environment
    provideAuth(() => getAuth()),
    provideFirestore(() => getFirestore()),
    provideDatabase(() => getDatabase()),
  ],
  providers: [
    provideClientHydration(),
    provideHttpClient(withFetch()),
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
