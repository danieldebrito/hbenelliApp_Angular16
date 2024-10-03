import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-nosotros',
  templateUrl: './nosotros.component.html',
  styleUrls: ['./nosotros.component.scss']
})
export class NosotrosComponent implements OnInit {

  // Implementa ngOnInit para hacer scroll al inicio
  ngOnInit(): void {
    // Scroll automático a la parte superior de la página al entrar al componente
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

}