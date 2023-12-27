import { Injectable } from '@angular/core';
import { BaseService } from './_base.service';

@Injectable({
  providedIn: 'root'
})
export class IngredientesService {
  private baseUrl = 'ingredientes';

  constructor(private baseService: BaseService) { }

  // GET all articles
  getAll() {
    return this.baseService.get(this.baseUrl);
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