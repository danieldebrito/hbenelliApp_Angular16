export enum ERole {
  publico = 'publico',
  paciente = 'paciente',
  especialista = 'especialista',
  administrador = 'administrador',
  ADMIN = "ADMIN",
}

export interface Usuario {
  [x: string]: any;
  id?: string;
  uid?: string;
  email?: string;
  password?: string;
  displayName?: string;
  photoURL?: string;
  nombre?: string;
  apellido?: string;
  sexo?: string;
  dni?: string;
  edad?: number;
  fechaNacimiento?: string;
  role?: ERole;
  habilitado?: boolean;
}
