USE sakila;

/* EJERCICIO 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados. */

SELECT DISTINCT title                 -- Distinct para evitar los duplicados
	FROM film;                         

/* EJERCICIO 2.Muestra los nombres de todas las películas que tengan una clasificación de "PG-13". */
 
SELECT title, rating             		/* query comprobacion pongo aqui tambien el rating para realmente ver que me da el resultado*/
	FROM film                            
	WHERE rating = "PG-13";
    
    /* query final */
    
    SELECT title             		
	FROM film                            
	WHERE rating = "PG-13";

/* EJERCICIO 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción */
  
             -- utilizo like %% para poder buscar la palabra que nos piden ya que se usa para buscar texto junto con el simbolo %  
             
SELECT title, description                         
	FROM film
	WHERE description LIKE "%amazing%";
    

/* EJERCICIO 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos. */

SELECT title, length                         
	FROM film
	WHERE length > 120;
    
/* EJERCICIO 5. Recupera los nombres de todos los actores. */

SELECT first_name         
	FROM actor;

-- otra opcion para ver el nombre del actor con su apellido en una columna 

SELECT CONCAT (first_name, ' ', last_name) AS nombre_actor      
	FROM actor;

/* EJERCICIO 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido */

SELECT first_name,last_name                        
	FROM actor
	WHERE last_name LIKE "%Gibson%";
    
    /* EJERCICIO 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20. */
    
SELECT first_name, actor_id                   /* query comprobacion */
	FROM actor
	WHERE actor_id BETWEEN 10 AND 20;         -- EL BETWEEN nos permite seleccionar un rango de valores
    
    /* query final */
    
    SELECT first_name,                  
	FROM actor
	WHERE actor_id BETWEEN 10 AND 20;
    
    /* EJERCICIO 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
clasificación. */

SELECT title, rating             		       /* query comprobacion pongo aqui tambien el rating para realmente ver que me da el resultado*/
	FROM film                            
	WHERE rating NOT IN( "R", "PG-13");

/* query final */

SELECT title             		       /* query comprobacion pongo aqui tambien el rating para realmente ver que me da el resultado*/
	FROM film                            
	WHERE rating NOT IN( "R", "PG-13");
    
    