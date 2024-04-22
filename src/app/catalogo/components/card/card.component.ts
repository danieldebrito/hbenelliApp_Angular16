import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Articulo } from 'src/app/class/articulo';

@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.scss']
})
export class CardComponent {

  @Input() articulo: Articulo = {};
  @Output() lanzaCompra = new EventEmitter();

  constructor() { }


}
