import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';
import { Subrubro } from 'src/app/class/subrubro';

@Component({
  selector: 'app-catalog-cards-grid',
  templateUrl: './catalog-cards-grid.component.html',
  styleUrls: ['./catalog-cards-grid.component.scss']
})
export class CatalogCardsGridComponent implements OnChanges {

  p = 1;

  @Input() articulos: Articulo[] = [];
  @Input() subrubros: Subrubro[] = [];
 
  ngOnChanges(changes: SimpleChanges) {
    if (changes['articulos']) {
      this.articulos = changes['articulos'].currentValue;
    }
  }
}