
export class Articulo {
  constructor(
    public id?: string,
    public rubro?: string,
    public categoria?: string,
    public idDetalle?: number,
    public codigo?: string,
    public nombre?: string,
    public observaciones?: string,
    public peso?: string,
    public unidad?: string,
    public precioLista?: number,
    public precioNeto?: number,
    public urlPhoto?: string,
    public updated_at?: string,
    public created_at?: string
  ) { }
}
