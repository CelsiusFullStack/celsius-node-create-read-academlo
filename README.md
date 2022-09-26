nota: 

- los cursos en esta logica de negocio implementada pueden tener 1 o varios videos asociados, con un peso en horas , cada mas estaa informacion
  no es la que se toma para indicar el % de completado que conlleva el reto a manera de hacerlo mas simplo se uso mas bien los videos visto por es
  estudiante.
- users_courses_master esta la tabla pivote con la cual relaciono informacion de estudiantes, cursos, videos , review de cursos, y % de avance
- la tabla users_courses_details, posee el detalle de los cursso y vdeo del estudiante , tiene un campo llamado iscomplete (true/false) el cual 
  me indicado cuales videos ha completado el estudiante,
  modificando estos valores podran obtener el porcentaje de avance del curso.

# celsius-node-create-read-academlo
![academlo_fisical_model](https://user-images.githubusercontent.com/107906374/192191110-6a968616-080e-495c-8a1b-498405086891.png)
