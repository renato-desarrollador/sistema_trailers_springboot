package com.sistema.trailers.modelo;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

@Entity
public class Pelicula {
	//Atributos
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_pelicula")
	private Integer id;
	
	@NotBlank//Para no permitir espacios en blanco
	private String titulo;
	@NotBlank
	private String sinopsis;
	
	@NotNull//Indica que el campo anotado no puede ser nulo.
	@DateTimeFormat(iso = ISO.DATE)//Para especificar el formato de fecha y hora que se espera en un campo de tipo Date o LocalDate.
	private LocalDate fechaEstreno;
	
	@NotBlank
	private String youtubeTrailerId;
	
	private String rutaPortada;
	
	//Indica que el elemento anotado no debe ser nulo ni estar vacío.
	@NotEmpty
	//Para establecer una relación muchos a muchos entre dos entidades.
	@ManyToMany(fetch = FetchType.LAZY)//Para que se carge cuando lo necesitemos
	@JoinTable(name = "genero_pelicula", 
	          joinColumns = @JoinColumn(name = "id_pelicula"), 
			  inverseJoinColumns = @JoinColumn(name = "id_genero"))
	private List<Genero> generos;
	
	@Transient//Dicta que los elementos ingresados no se van a guardar a la base de datos (temporal)
	private MultipartFile portada;
	
	
	//Generamos los getters and setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getSinopsis() {
		return sinopsis;
	}

	public void setSinopsis(String sinopsis) {
		this.sinopsis = sinopsis;
	}

	public LocalDate getFechaEstreno() {
		return fechaEstreno;
	}

	public void setFechaEstreno(LocalDate fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}

	public String getYoutubeTrailerId() {
		return youtubeTrailerId;
	}

	public void setYoutubeTrailerId(String youtubeTrailerId) {
		this.youtubeTrailerId = youtubeTrailerId;
	}

	public String getRutaPortada() {
		return rutaPortada;
	}

	public void setRutaPortada(String rutaPortada) {
		this.rutaPortada = rutaPortada;
	}

	public List<Genero> getGeneros() {
		return generos;
	}

	public void setGeneros(List<Genero> generos) {
		this.generos = generos;
	}

	public MultipartFile getPortada() {
		return portada;
	}

	public void setPortada(MultipartFile portada) {
		this.portada = portada;
	}
	
	
	//Generamos los constructores (Sin Lombok)
	public Pelicula() {
		super();
	}

	public Pelicula(Integer id, @NotBlank String titulo, @NotBlank String sinopsis, @NotNull LocalDate fechaEstreno,
			@NotBlank String youtubeTrailerId, String rutaPortada, @NotEmpty List<Genero> generos,
			MultipartFile portada) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.sinopsis = sinopsis;
		this.fechaEstreno = fechaEstreno;
		this.youtubeTrailerId = youtubeTrailerId;
		this.rutaPortada = rutaPortada;
		this.generos = generos;
		this.portada = portada;
	}

	public Pelicula(@NotBlank String titulo, @NotBlank String sinopsis, @NotNull LocalDate fechaEstreno,
			@NotBlank String youtubeTrailerId, String rutaPortada, @NotEmpty List<Genero> generos,
			MultipartFile portada) {
		super();
		this.titulo = titulo;
		this.sinopsis = sinopsis;
		this.fechaEstreno = fechaEstreno;
		this.youtubeTrailerId = youtubeTrailerId;
		this.rutaPortada = rutaPortada;
		this.generos = generos;
		this.portada = portada;
	}
	
}
