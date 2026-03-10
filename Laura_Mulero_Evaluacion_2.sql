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

SELECT title             		       
	FROM film                            
	WHERE rating NOT IN( "R", "PG-13");
    
/* EJERCICIO 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la
clasificación junto con el recuento. */


SELECT rating, COUNT(*) AS total_peliculas      /* utilizo un count * para que me cuente el total de las peliculas*/
	FROM film
	GROUP BY rating;                   /* hago la agrupacion (group by) para que me devuleva la cladificacion ( rating) junto con el recuento de peliculas */


/* EJERCICIO 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
nombre y apellido junto con la cantidad de películas alquiladas. **/


SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS cantidad_peliculas_alquiladas /*con el count contamos los alquileres del cliente*/
	FROM customer AS c
	INNER JOIN rental AS r    /*con join conecto las tablas alquileres y clientes para que me diga los clientes que tienen peliculas alquiladas*/
		ON c.customer_id = r.customer_id
	GROUP BY c.customer_id, c.first_name, c.last_name;       /* agrupo el resultado de id, nombre, apellido y peliculas, No pongo r.rental porque tiene una funcion */ 
	

/* EJERCICIO 11.Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
junto con el recuento de alquileres.*/


SELECT c.name AS categoria, COUNT(r.rental_id) AS recuento_alquileres   /* contamos alquileres con count */
	FROM category AS c
	INNER JOIN film_category AS fc                  /* conecto las tablas de  film categoria--> film --> inventario-->alquiler*/
		ON c.category_id = fc.category_id
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i 
		ON fc.film_id = i.film_id
	INNER JOIN rental AS r 
		ON i.inventory_id = r.inventory_id
	GROUP BY c.name;   													/* agrupamos por la categoria */
    
    
/* EJERCICIO 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y
muestra la clasificación junto con el promedio de duración.*/

SELECT rating, AVG(length) AS promedio_duracion
	FROM film
	GROUP BY rating;
    
    /* EJERCICIO 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love". */

SELECT first_name,last_name                        
	FROM actor AS a
	INNER JOIN film_actor AS fi                      /* union de tablas de actor --> film_actor--> film */
		ON a.actor_id = fi.actor_id
	INNER JOIN film AS f
		ON fi.film_id = f.film_id
	WHERE f.title = 'Indian Love';
    
    /* EJERCICIO 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción*/
    
SELECT title, description                         
	FROM film
	WHERE description LIKE "%DOD%" OR description LIKE "%CAT%";
        

	