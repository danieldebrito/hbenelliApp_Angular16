import { Injectable } from '@angular/core';
import { catchError, map, Observable, throwError } from 'rxjs';
//import { Articulo } from '../class/articulo';
import { BaseService } from './_base.service';
import { HttpClient } from '@angular/common/http';
import { Articulo } from '../class/articulo';



@Injectable({
  providedIn: 'root'
})
export class ArticulosService {
  API_URI = '';


  private baseUrl = 'articulos';

  constructor(
    private http: HttpClient,
    private baseService: BaseService) {
    //this.API_URI = this.base.getURL();
    //this.API_URI = 'http://makerds.com/api/public/api';
    this.API_URI = this.baseService.getURL() + this.baseUrl;
  }

 

  gets(): Observable<any> {
    return this.http.get<Articulo[]>(`${this.API_URI}`)
      .pipe(
        map(articulos => this.ordenarArticulos(articulos)),
        catchError(error => {
          console.error('Error al obtener los artículos', error);
          return throwError(error);
        })
      );
  }
  

  getById(id: number): Observable<any> {
    return this.http.get(`${this.API_URI}/${id}`);
  }

  delete(id: string) {
    return this.http.delete(`${this.API_URI}/${id}`);
  }

  save(element: any) {
    return this.http.post(`${this.API_URI}`, element);
  }

  update(id: string | number, updated: any): Observable<any> {
    return this.http.post(`${this.API_URI}/${id}`, updated);
  }

  ordenarArticulos(articulos: Articulo[]): Articulo[] {
    return articulos.sort((a, b) => {
      // Comparar por rubro
      if (a.rubro && b.rubro) {
        const rubroComparison = a.rubro.localeCompare(b.rubro);
        if (rubroComparison !== 0) {
          return rubroComparison;
        }
      }
  
      // Comparar por subrubro
      if (a.subrubro && b.subrubro) {
        const subrubroComparison = a.subrubro.localeCompare(b.subrubro);
        if (subrubroComparison !== 0) {
          return subrubroComparison;
        }
      }
  
      // Comparar por nombre
      if (a.nombre && b.nombre) {
        return a.nombre.localeCompare(b.nombre);
      }
  
      return 0; // Si no hay diferencias en rubro, subrubro y nombre, son iguales
    });
  }

}
