import { Injectable } from '@angular/core';
import { collection, collectionData, deleteDoc, doc, docData, Firestore, orderBy, query, setDoc, updateDoc } from '@angular/fire/firestore';
import { catchError, map, Observable, throwError } from 'rxjs';
import { Articulo } from 'src/app/class/articulo';

@Injectable({
  providedIn: 'root'
})
export class ArticulosFireService {
  constructor(private firestore: Firestore) { }

  public addItem(item: Articulo) {
    const col = collection(this.firestore, 'articulos');
    const newDoc = doc(col);

    item.id = newDoc.id; // guardo el id del documento que crea firebase
    setDoc(newDoc, item);
  }

  public getItems(): Observable<Articulo[]> {
    const col = collection(this.firestore, 'articulos');
    const queryObservable = query(col, orderBy('nombre')); // ordenar por nombre
    const observable = collectionData(queryObservable).pipe(
      map(res => {
        return res as Articulo[];
      }),
      catchError(err => {
        console.error('Error obteniendo datos:', err);
        return throwError(() => err);
      })
    );
    return observable;
  }

  public getItemById(id: string): Observable<Articulo> {
    const col = collection(this.firestore, 'articulos');
    const documento = doc(col, id);

    const observable = docData(documento).pipe(
      map(res => {
        return res as Articulo;
      }),
      catchError(err => {
        console.error('Error obteniendo el documento:', err);
        return throwError(() => err);
      })
    );
    return observable;
  }

  public update(id: string, Item: any) {
    const col = collection(this.firestore, 'articulos');
    const documento = doc(col, id);

    updateDoc(documento, Item);
  }

  public delete(id: string) {
    const col = collection(this.firestore, 'articulos');
    const documento = doc(col, id);

    deleteDoc(documento);
  }
}


