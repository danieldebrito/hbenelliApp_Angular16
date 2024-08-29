import { Injectable } from '@angular/core';
import { getStorage, ref, uploadBytesResumable, getDownloadURL } from 'firebase/storage';

@Injectable({
  providedIn: 'root'
})
export class StorageService {

  constructor() { }

  async uploadFile(file: File): Promise<string> {
    const storage = getStorage();
    const filePath = `imagenes/registro/${file.name}`;
    const storageRef = ref(storage, filePath);
    const uploadTask = uploadBytesResumable(storageRef, file);

    return new Promise((resolve, reject) => {
      uploadTask.on('state_changed',
        null,
        (error) => {
          console.error('Error durante la carga:', error); // Agregar un log para errores durante la carga
          reject(error);
        },
        async () => {
          try {
            const downloadURL = await getDownloadURL(uploadTask.snapshot.ref);
            resolve(downloadURL);
          } catch (error) {
            console.error('Error al obtener la URL de descarga:', error);
            reject(error);
          }
        }
      );
    });
  }
}
