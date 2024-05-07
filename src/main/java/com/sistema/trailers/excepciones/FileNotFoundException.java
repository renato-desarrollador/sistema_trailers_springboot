package com.sistema.trailers.excepciones;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

//Anotación que devuelve el código de estado HTTP como respuesta
@ResponseStatus(code = HttpStatus.NOT_FOUND)//En este caso indicamos el código de estado 404 (NOT FOUND)
public class FileNotFoundException extends RuntimeException{
	/*
	Se utiliza en clases serializables en Java para proporcionar un número de versión único 
	para controlar la compatibilidad durante la serialización y la deserialización de objetos.
	 */
	private static final long serialVersionUID = 1L;
	
	//Creamos los constructores(Sin Lombok)
	public FileNotFoundException(String mensaje) {
		super(mensaje);
	}
	
	public FileNotFoundException(String mensaje, Throwable excepcion) {
		super(mensaje,excepcion);
	}
}
