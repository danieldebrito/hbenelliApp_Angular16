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

  // GET all
  getAll(): Observable<Subrubro[]> {
    return this.baseService.get(this.baseUrl).pipe(
      map((data: Object) => data as Subrubro[])
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
}