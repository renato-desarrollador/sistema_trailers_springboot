package com.sistema.trailers.servicio;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.annotation.PostConstruct;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;

import com.sistema.trailers.excepciones.AlmacenExcepcion;
import com.sistema.trailers.excepciones.FileNotFoundException;

@Service
public class AlmacenServicioImpl implements AlmacenServicio{
	//Implementamos todos nuestros metodos de la interface AlmacenServicio
	@Value("${storage.location}")//Inyecta el valor de la propiedad storage.location desde un archivo de propiedades de Spring
	private String storageLocation;
	
	//Marca un método que debe ser ejecutado después de que la construcción de un bean haya sido completada por el contenedor de Spring
	@PostConstruct
	@Override
	public void iniciarAlmacenDeArchivos() {
		//Excepcion try catch
		try {
			//Indicamos donde vamos almacenar nuestras fotos -> storageLocation
			Files.createDirectories(Paths.get(storageLocation));
		}catch(IOException excepcion) {
			throw new AlmacenExcepcion("Error al inicializar la ubicación en el almacen de archivos");
		}
	}

	@Override
	public String almacenarArchivo(MultipartFile archivo) {
		String nombreArchivo = archivo.getOriginalFilename();
		//Validación if
		if(archivo.isEmpty()) {
			throw new AlmacenExcepcion("No se puede almacenar un archivo vacío");
		}
		//Excepcion try catch
		try {
			InputStream inputStream = archivo.getInputStream();//StandardCopyOption.REPLACE_EXISTING) Sirve para reempalzar si existen archivos con el mismo nombre 
			Files.copy(inputStream, Paths.get(storageLocation).resolve(nombreArchivo), StandardCopyOption.REPLACE_EXISTING);
		}catch(IOException excepcion){
			throw new AlmacenExcepcion("Error al almacenar el archivo " + nombreArchivo,excepcion);
		}
		
		
		return nombreArchivo;

	}
	
	@Override
	public Path cargarArchivo(String nombreArchivo) {
		return Paths.get(storageLocation).resolve(nombreArchivo);
	}

	@Override
	public Resource cargarComoRecurso(String nombreArchivo) {
		//Excepcion try catch
		try {
			Path archivo = cargarArchivo(nombreArchivo);
			Resource recurso = new UrlResource(archivo.toUri());
			
			//Validacion if
			if(recurso.exists() || recurso.isReadable()) {
				return recurso;
			}else {
				throw new FileNotFoundException("No se pudo encontrar el archivo " + nombreArchivo);
			}
		}catch(MalformedURLException excepcion){
			throw new FileNotFoundException("No se pudo encontrar el archivo " + nombreArchivo,excepcion);
		}
	}

	@Override
	public void eliminarArchivo(String nombreArchivo) {
		//Se declara una variable llamada 'archivo' de tipo 'Path' y se le asigna el resultado
		//de llamar al método 'cargarArchivo' con el argumento 'nombreArchivo'.
		Path archivo = cargarArchivo(nombreArchivo);
		
		//Excepcion try catch
		try {
			FileSystemUtils.deleteRecursively(archivo);
		}catch(Exception excepcion) {
			System.out.println(excepcion);
		}
	}
	
}
