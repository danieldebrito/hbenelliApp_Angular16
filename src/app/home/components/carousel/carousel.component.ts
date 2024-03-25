import { Component, OnInit, OnDestroy } from '@angular/core';

@Component({
  selector: 'app-carousel',
  templateUrl: './carousel.component.html',
  styleUrls: ['./carousel.component.scss']
})
export class CarouselComponent implements OnInit, OnDestroy {
  intervalId: any;

  ngOnInit() {
    this.intervalId = setInterval(() => {
     // this.myCarousel.next(); // Assuming you have a reference to the carousel element
    }, 5000); // Change 5000 to your desired interval in milliseconds
  }

  ngOnDestroy() {
    clearInterval(this.intervalId); // Stop the timer on component destruction
  }
}