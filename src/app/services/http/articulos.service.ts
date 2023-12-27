import { Injectable } from '@angular/core';
import { catchError, map, Observable, throwError } from 'rxjs';
import { Articulo } from '../class/articulo';
import { BaseService } from './_base.service';



@Injectable({
  providedIn: 'root'
})
export class ArticulosService {

  private baseUrl = 'articulos';

  constructor(private baseService: BaseService) { }

  // GET all
  getAll(): Observable<Articulo[]> {
    return this.baseService.get(this.baseUrl).pipe(
      map((data: Object) => data as Articulo[])
    );
  }

  // GET one article by ID
  getById(id: number) {
    return this.baseService.get(`${this.baseUrl}${id}/`);
  }

  // POST (create) a new article
  create(data: any) {
    return this.baseService.post(this.baseUrl, data);
  }

  // PUT (update) an existing article
  update(id: number, data: any) {
    return this.baseService.put(`${this.baseUrl}${id}/`, data);
  }

  // DELETE an existing article
  delete(id: number) {
    return this.baseService.delete(`${this.baseUrl}${id}/`);
  }


  handleError(error: any) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      errorMessage = `Error: ${error.error.message}`;
    } else {
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    return throwError(() => new Error(errorMessage));
  }

}