import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ContactoFireService } from '../services/firebase/contacto.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss'],
})
export class ContactComponent {
  contactForm = new FormGroup({
    name: new FormControl('', Validators.required),
    email: new FormControl('', [Validators.required, Validators.email]),
    subject: new FormControl('', Validators.required),
    message: new FormControl('', Validators.required),
  });

  constructor( private contactoSv: ContactoFireService ){}

  errorMessage: string | null = null;

  submitForm() {
    if (this.contactForm.valid) {
      const formData = {
        // Prepare form data object
        name: this.contactForm.get('name').value,
        email: this.contactForm.get('email').value,
        subject: this.contactForm.get('subject').value,
        message: this.contactForm.get('message').value,
      };

      // Replace with your actual backend API endpoint and handle errors

      this.contactoSv.addItem(formData);

    } else {
      this.errorMessage = 'Por favor, completa todos los campos correctamente.';
    }
  }
}
