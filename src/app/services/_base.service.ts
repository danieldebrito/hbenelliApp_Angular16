import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class BaseService {

    // private baseUrl = 'http://127.0.0.1:8000/api/';
    private baseUrl = 'https://api.hbenelli.com.ar/public/api/';
    
    constructor(private http: HttpClient) { }

    public getURL(){
      return this.baseUrl;
    }
  
  
    // GET request
    get(url: string) {
      return this.http.get(`${this.baseUrl}${url}`);
    }
  
    // POST request
    post(url: string, data: any) {
      return this.http.post(`${this.baseUrl}${url}`, data);
    }
  
    // PUT request
    put(url: string, data: any) {
      return this.http.put(`${this.baseUrl}${url}`, data);
    }
  
    // DELETE request
    delete(url: string) {
      return this.http.delete(`${this.baseUrl}${url}`);
    }
  }