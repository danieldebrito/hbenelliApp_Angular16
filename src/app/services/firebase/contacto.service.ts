import { Injectable } from '@angular/core';
import { collection, collectionData, deleteDoc, doc, docData, Firestore, orderBy, query, setDoc, updateDoc } from '@angular/fire/firestore';
import { catchError, map, Observable, throwError } from 'rxjs';
import { Contacto } from 'src/app/class/contacto';

@Injectable({
  providedIn: 'root'
})
export class ContactoFireService {
  constructor(private firestore: Firestore) { }

  public addItem(item: Contacto) {
    const col = collection(this.firestore, 'contactos');
    const newDoc = doc(col);

    item.id = newDoc.id; // guardo el id del documento que crea firebase
    setDoc(newDoc, item);
  }

  public getItems(): Observable<Contacto[]> {
    const col = collection(this.firestore, 'contactos');
    const queryObservable = query(col, orderBy('nombre')); // ordenar por nombre
    const observable = collectionData(queryObservable).pipe(
      map(res => {
        return res as Contacto[];
      }),
      catchError(err => {
        console.error('Error obteniendo datos:', err);
        return throwError(() => err);
      })
    );
    return observable;
  }

  public getItemById(id: string): Observable<Contacto> {
    const col = collection(this.firestore, 'contactos');
    const documento = doc(col, id);

    const observable = docData(documento).pipe(
      map(res => {
        return res as Contacto;
      }),
      catchError(err => {
        console.error('Error obteniendo el documento:', err);
        return throwError(() => err);
      })
    );
    return observable;
  }

  public update(id: string, Item: any) {
    const col = collection(this.firestore, 'contactos');
    const documento = doc(col, id);

    updateDoc(documento, Item);
  }

  public delete(id: string) {
    const col = collection(this.firestore, 'contactos');
    const documento = doc(col, id);

    deleteDoc(documento);
  }
}


