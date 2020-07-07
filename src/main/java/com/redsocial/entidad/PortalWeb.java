package com.redsocial.entidad;

public class PortalWeb {

	private int idPortal;
	private String nombre;
	private String ruta;
	private String pais;
	private String fechaLanzamiento;
	private int inscriptores;
	private String idioma;

	private Categoria categoria;

	public int getIdPortal() {
		return idPortal;
	}

	public void setIdPortal(int idPortal) {
		this.idPortal = idPortal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRuta() {
		return ruta;
	}

	public void setRuta(String ruta) {
		this.ruta = ruta;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getFechaLanzamiento() {
		return fechaLanzamiento;
	}

	public void setFechaLanzamiento(String fechaLanzamiento) {
		this.fechaLanzamiento = fechaLanzamiento;
	}

	public int getInscriptores() {
		return inscriptores;
	}

	public void setInscriptores(int inscriptores) {
		this.inscriptores = inscriptores;
	}

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	

	

}
