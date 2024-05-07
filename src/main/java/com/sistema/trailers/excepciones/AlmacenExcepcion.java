package com.sistema.trailers.excepciones;

public class AlmacenExcepcion extends RuntimeException{
	/*
	Se utiliza en clases serializables en Java para proporcionar un número de versión único 
	para controlar la compatibilidad durante la serialización y la deserialización de objetos.
	 */
	private static final long serialVersionUID = 1L;
	
	//Creamos los constructores(Sin Lombok)
	public AlmacenExcepcion(String mensaje) {
		super(mensaje);
	}
	
	public AlmacenExcepcion(String mensaje, Throwable excepcion) {
		super(mensaje,excepcion);
	}
}
