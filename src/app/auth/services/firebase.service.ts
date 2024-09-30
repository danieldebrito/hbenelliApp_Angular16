import { Injectable } from '@angular/core';
import { collection, collectionData, doc, Firestore, setDoc, query } from '@angular/fire/firestore';
import { Storage, getDownloadURL, ref, uploadBytes } from '@angular/fire/storage';

@Injectable({
  providedIn: 'root',
})
export class FirebaseService {
  constructor(
    private firestore: Firestore,
    private storage: Storage
  ) {}

  // ABM Firestore
  async guardarEnFirebase(elemento: any, coleccion: string): Promise<any> {
    const docRef = doc(this.firestore, `${coleccion}/${elemento.uid}`);
    return setDoc(docRef, Object.assign({}, elemento), { merge: true });
  }

  traerColeccionTodos(coleccion: string) {
    const colRef = collection(this.firestore, coleccion);
    const q = query(colRef);
    return collectionData(q);
  }

  generateUniqueFirestoreId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let autoId = '';
    for (let i = 0; i < 20; i++) {
      autoId += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return autoId;
  }

  // Storage
  async subirImagenes(file: any, folder: string, nombre: string) {
    const path = `${folder}/${nombre}`;
    const imageRef = ref(this.storage, path);
    return await uploadBytes(imageRef, file);
  }

  async traerImagen(folder: string, nombre: string) {
    const path = `${folder}/${nombre}`;
    const imageRef = ref(this.storage, path);
    return await getDownloadURL(imageRef);
  }


  async readAsBase64(foto: any) {
    const response = await fetch(foto.webPath!);
    return (await response.blob()) as File;
  }
}
