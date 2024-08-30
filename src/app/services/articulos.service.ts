import { Injectable } from '@angular/core';
import { catchError, map, Observable, throwError } from 'rxjs';
//import { Articulo } from '../class/articulo';
import { BaseService } from './_base.service';
import { HttpClient } from '@angular/common/http';



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
    return this.http.get(`${this.API_URI}`);
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

}
