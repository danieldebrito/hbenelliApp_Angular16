import { Component, OnInit } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
import { Subrubro } from 'src/app/class/subrubro';
import { ArticulosService } from 'src/app/services/articulos.service';
import { SubrubrosService } from 'src/app/services/subrubros.service';
import * as XLSX from 'xlsx';
import { Router } from '@angular/router';

@Component({
  selector: 'app-catalog-list',
  templateUrl: './catalog-list.component.html',
  styleUrls: ['./catalog-list.component.scss']
})
export class CatalogListComponent implements OnInit {
  p = 1;
  itemsPerPage = 15;
  articulos: Articulo[] = [];
  subrubros: Subrubro[] = [];

  constructor(
    private articulosService: ArticulosService,
    private subrubrosService: SubrubrosService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadArticulos();
    this.loadSubrubros();
  }

  loadArticulos() {
    this.articulosService.gets().subscribe((data) => {
      this.articulos = data;
    });
  }

  loadSubrubros() {
    this.subrubrosService.getAll().subscribe((data) => {
      this.subrubros = data;
    });
  }

  getSubrubroNombre(subrubroId: number): string {
    const subrubro = this.subrubros.find(s => s.id === subrubroId);
    return subrubro ? subrubro.subrubro : 'Desconocido';
  }

  exportToExcel() {
    const ws: XLSX.WorkSheet = XLSX.utils.json_to_sheet(this.articulos);
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Artículos');
    XLSX.writeFile(wb, 'articulos.xlsx');
  }

  get paginatedArticulos(): Articulo[] {
    const startIndex = (this.p - 1) * this.itemsPerPage;
    return this.articulos.slice(startIndex, startIndex + this.itemsPerPage);
  }

  navigateToAdd() {
    this.router.navigate(['catalogoadmin/add']);
  }

  editArticulo(articulo: Articulo) {
    this.router.navigate(['catalogoadmin/edit/', articulo.id]);
  }

  deleteArticulo(id: any) {
    if (confirm('¿Está seguro de que desea eliminar este artículo?')) {
      this.articulosService.delete(id).subscribe(() => {
        this.loadArticulos();
      });
    }
  }
}
