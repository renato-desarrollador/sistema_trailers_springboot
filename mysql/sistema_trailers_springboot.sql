-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_trailers_springboot
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Acción'),(2,'Aventuras'),(3,'Comedia'),(4,'Drama'),(5,'Fantasía'),(6,'Documental'),(7,'Terror');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_pelicula`
--

DROP TABLE IF EXISTS `genero_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_pelicula` (
  `id_pelicula` int NOT NULL,
  `id_genero` int NOT NULL,
  KEY `FKnpb8vdeybu4p41dibnbawra2q` (`id_genero`),
  KEY `FK7rxwafj1id7f40i0mq446ivw6` (`id_pelicula`),
  CONSTRAINT `FK7rxwafj1id7f40i0mq446ivw6` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id_pelicula`),
  CONSTRAINT `FKnpb8vdeybu4p41dibnbawra2q` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_pelicula`
--

LOCK TABLES `genero_pelicula` WRITE;
/*!40000 ALTER TABLE `genero_pelicula` DISABLE KEYS */;
INSERT INTO `genero_pelicula` VALUES (2,2),(2,5),(3,2),(3,3),(3,5),(4,1),(4,5),(5,1),(5,4),(6,1),(6,2),(6,5),(7,1),(7,4),(8,1),(8,2),(8,5),(8,7),(9,1),(9,4),(10,1),(10,2),(10,3),(10,5),(11,1),(11,2),(12,2),(12,5),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,2),(16,3),(16,5),(17,1),(17,2),(17,5),(18,2),(18,3),(18,5),(19,1),(19,4),(19,5),(20,2),(20,3);
/*!40000 ALTER TABLE `genero_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `fecha_estreno` date NOT NULL,
  `ruta_portada` varchar(255) DEFAULT NULL,
  `sinopsis` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `youtube_trailer_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (2,'2023-12-22','aquaman.jpg','Arthur se ve obligado a sacar de prisión a su hermanastro, Orm, para que lo ayude a detener a Kane, quien ha atacado Atlantis tras encontrar un tridente negro que lo posee y le da la fuerza para vengar la muerte de su padre.','Aquaman y el reino perdido','M8W_y0mmJEc'),(3,'2023-07-21','barbie.jpg','Después de ser expulsada de Barbieland por no ser una muñeca de aspecto perfecto, Barbie parte hacia el mundo humano para encontrar la verdadera felicidad.','Barbie','zh4KhVSMwtQ'),(4,'2023-08-18','blue.jpg','El Escarabajo, una antigua reliquia extraterrestre, elige al estudiante Jaime Reyes como el huésped simbiótico en cuyo cuerpo resguardarse. A partir de ese momento, Jaime desarrolla una armadura que le otorga poderes increíbles e impredecibles.','Blue Beetle','-PEODBVHCgU'),(5,'2023-03-03','creed.jpg','Adonis Creed, aún dominando el mundo del boxeo, prospera en su carrera y en su vida familiar, pero un amigo de la infancia y antiguo prodigio del boxeo reaparece tras salir de la cárcel y está ansioso por demostrar que merece otra oportunidad.','Creed III','4BPmCjgji_8'),(6,'2024-07-26','deadpool.jpg','Lobezno se recupera de sus heridas cuando se cruza con el bocazas, Deadpool, que ha viajado en el tiempo para curarlo con la esperanza de hacerse amigos y formar un equipo para acabar con un enemigo común.','Deadpool and Wolverine','UzFZR2dRsSY'),(7,'2023-12-14','ferrari.jpg','Durante el verano de 1957, la quiebra se cierne sobre la empresa que Enzo Ferrari y su esposa Laura levantaron diez años antes. Desesperado, Enzo se juega el futuro profesional en Mille Miglia, una emblemática carrera que atraviesa Italia.','Ferrari','3t2R-5Apj-A'),(8,'2023-10-27','freddy.jpg','Five Nights at Freddy\'s es un videojuego de terror y supervivencia independiente del género «point-and-click» desarrollado y publicado por Scott Cawthon, siendo la primera entrega de la serie de videojuegos del mismo nombre.','Five Nights At Freddy\'s','UQaMx3S0dUo'),(9,'2023-05-19','furiosos.jpg','Dom Toretto y sus familias se enfrentan al peor enemigo imaginable, uno llegado desde el pasado con sed de venganza, dispuesto a cualquier cosa con tal de destruir todo aquello que Dom ama.','Rápidos y furiosos 10','32RAq6JzY-w'),(10,'2023-05-05','galaxy.jpg','Aunque sigue afectado por la pérdida de Gamora, Peter Quill debe reunir a su equipo para defender el universo de una nueva amenaza o, en caso de fracasar, será el final de los Guardianes.','Guardians of the Galaxy Vol. 3','sinstLBy9l8'),(11,'2023-06-30','jones.jpg','En 1969, un Indiana Jones envejecido y derrotado por la vida regresa a la acción para evitar que la hija de uno de sus amigos venda un artilugio que permite viajar en el tiempo a unos nazis que pretenden alterar el curso de la Segunda Guerra Mundial.','Indiana Jones y el llamado del destino','PR299S5zAnU'),(12,'2024-02-14','madame-web.jpg','Una paramédica de Manhattan que se ve obligada a enfrentarse a revelaciones sobre su pasado forja una relación con tres jóvenes destinadas a tener un futuro poderoso, si consiguen sobrevivir a un presente mortal.','Madame Web','0QYCYZjKGQg'),(13,'2023-11-22','napoleon.jpg','La carrera militar y política de Napoleón Bonaparte desde sus inicios en la época revolucionaria hasta la derrota del imperio con el que conquistó Europa. La figura del estratega corso se exhibe a través de su relación con Josefina.','Napoleón','NjMJwewmcfA'),(14,'2023-12-15','nieve.jpg','En 1972, un vuelo procedente de Uruguay se estrella en un glaciar en los Andes. Solo 29 de sus 45 pasajeros sobreviven al accidente. Atrapados en uno de los entornos más hostiles del planeta, se ven obligados a luchar por sus vidas.','La sociedad de la nieve','l9tP4M8URhQ'),(15,'2023-07-21','oppenheimer.jpg','Durante la Segunda Guerra Mundial, el teniente general Leslie Groves designa al físico J. Robert Oppenheimer para un grupo de trabajo que está desarrollando el Proyecto Manhattan, cuyo objetivo consiste en fabricar la primera bomba atómica.','Oppenheimer','gMPEbJQun68'),(16,'2023-03-17','shazam.jpg','Billy Batson y sus hermanos adoptivos Freddy, Mary, Pedro, Eugene y Darla, también dotados de superpoderes, tienen que enfrentarse a las tres hijas de Atlas: Hespera, Calipso y Anthea.','Shazam! Fury of the Gods','Q__dO3pEYDU'),(17,'2023-06-02','spider-man.jpg','Después de reunirse con Gwen Stacy, el amigable vecino de tiempo completo de Brooklyn Spiderman, es lanzado a través del multiverso, donde se encuentra a un equipo de gente araña encomendada con proteger su mera existencia.','Spider-Man: A través del Spider-Verso','oBmazlyP220'),(18,'2023-11-10','the-marvels.jpg','La guerra civil de los kree provoca una alteración en el espacio-tiempo. La Capitana Marvel va a investigar qué ha sucedido, pero la alteración cuántica hace que sus poderes se entremezclen con los de otras dos superheroínas.','The Marvels','itm8efx8k8U'),(19,'2023-06-09','transformers.jpg','Durante la década de 1990, los Maximals, Predacons y Terrorcons se unen a la batalla existente en la Tierra entre Autobots y Decepticons.','Transformers: el despertar de las bestias','NjBGzJ5FFmI'),(20,'2023-12-08','wonka.jpg','Armado únicamente con muchos sueños y ganas de aventura, el joven chocolatero Willy Wonka conoce a los oompa-loompas y se dispone a cambiar el mundo.','Wonka','LiILH5WOAAk');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 11:10:38
