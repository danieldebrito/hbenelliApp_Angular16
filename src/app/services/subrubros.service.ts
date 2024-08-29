import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { Subrubro } from 'src/app/class/subrubro';
import { BaseService } from './_base.service';

@Injectable({
  providedIn: 'root'
})
export class SubrubrosService {
  private baseUrl = 'subrubros';

  constructor(private baseService: BaseService) { }

  getAll(): Observable<Subrubro[]> {
    return this.baseService.get(this.baseUrl).pipe(
      map((data: Object) => data as Subrubro[])
    );
  }

  getById(id: number) {
    return this.baseService.get(`${this.baseUrl}/${id}/`);
  }

  create(data: any) {
    return this.baseService.post(this.baseUrl, data);
  }

  update(id: number, data: any) {
    return this.baseService.put(`${this.baseUrl}/${id}/`, data);
  }

  delete(id: number) {
    return this.baseService.delete(`${this.baseUrl}/${id}/`);
  }

  uploadImage(imageFile: File): Observable<any> {
    const formData = new FormData();
    formData.append('urlPhoto', imageFile);
    return this.baseService.post(`${this.baseUrl}/upload-image`, formData);
  }
}
