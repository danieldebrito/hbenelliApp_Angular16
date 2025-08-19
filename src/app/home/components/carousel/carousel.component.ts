import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-carousel',
  templateUrl: './carousel.component.html',
  styleUrls: ['./carousel.component.scss'],
})
export class CarouselComponent {
  constructor(private router: Router) {}

  navegar(arg0: string) {
    this.router.navigate([arg0]);
  }
}
