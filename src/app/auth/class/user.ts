// Enum para roles
export enum ERole {
    ADMIN = 'Admin',
    USER = 'User',
    MODERATOR = 'Moderator',
    GUEST = 'Guest'
}

// Enum para estatus
export enum EStatus {
    ACTIVE = 'Active',
    INACTIVE = 'Inactive',
    SUSPENDED = 'Suspended',
    PENDING = 'Pending'
}

// Interfaz del usuario
export interface User {
    uid: string;
    email: string;
    displayName: string;
    photoURL: string;
    emailVerified: boolean;
    role: ERole;
    status: EStatus;
    createdAt: Date;   // Fecha de creación del usuario
    updatedAt: Date;   // Fecha de la última actualización del perfil
    lastLogin: Date;   // Fecha del último inicio de sesión
}
