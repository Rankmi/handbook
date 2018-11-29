# Gestión de las tareas

## Cómo completar una tarea
Las tareas deben ser reportadas siguiendo las siguientes reglas:

* Descripción de la tarea general. 
* Caso de uso en el caso de que la complejidad sea superior a 2
* Descripción de los planes de prueba que se deben seguir.
* Listado de PR tanto de app como de API según corresponda.
* tags que permitan identificarlo (Si no la tiene nosotros debemos agregarlo).

## Gestión del flujo  en Youtrack.

En youtrack existen 9 columnas
* Por hacer
* En curso
* Para CodeReview
* [CR Cambios solicitados](https://github.com/Rankmi/api/wiki/Code-Review)
* Pendiente de QA
* En review
* Rechazado
* Aceptado
* Producción.

### Flujo de tareas (Task) 

El siguiente flujo se aplica de la siguiente manera:

1. Las tareas que se deben abordar están en la columna **Por hacer**. Para tomar una tarea se debe conversar los plazos y prioridades con el project manager correspondiente. A las tareas se les debe asignar la **complejidad**
2. Una vez definida la tarea que hay que tomar se debe crear una rama que nace desde development. En este punto, para las tareas de complejidad > 2 se debe generar un caso de uso [(Plantilla caso de uso)](https://docs.google.com/document/d/1yTu6NZrQKXBL6oUsSJNfA9hZtPwD8gP9BkEzDVyPz9k/edit). El caso de uso debe ser revisado en conjunto con el project manager y debe ser incluido en la tarea.
3. Posteriormente se debe crear una rama que nace desde development. El nombre de la rama debe partir con el identificador único de la tarea, normalmente el formato es **RKM-XXX-descripción-breve-de-la-tarea**
4. Cuando la tarea está en curso se debe desarrollar
5. Una vez finalizada se crea un **Pull Request** que debe apuntar a **development** y el card se debe pasar a la columna **Listo**. En esta columna se le debe asignar un code reviwer en la sección correspondiente.
6. En caso de que se soliciten cambios se debe borrar el tag y se pasa nuevamente a **En curso**. Se repite el proceso de pasar la tarea a **Listo** cuando se ha terminado de hacer los cambios y el **Code review** se vuelve a realizar
6. Cuando el code review se ha realizado y aprobado se debe pasar la tarea a **Pendiente de QA**.
7. El Analista QA tomará la tarea y la pasará a review.
8. En caso de que la tarea sea aceptada se debe pasar a la columna **Aceptado**
9. En caso contrario se especificará en el **Pull Request** por que ha fallado adjuntando evidencia.
10. Si la tarea está en **Aceptado** puede pasar a producción en cualquier momento.

## Manejo de bugs.

Un bug siempre tiene prioridad por sobre las tareas y a partir de eso se debe priorizar cada bug en función de lo crítico que ha sido reportado.
El manejo del flujo es igual al de una tarea, solo que el **Pull request** asociado no sale de **development** sino que sale directamente de **master**

## Complejidad de las tareas.

Las tareas tienen distintos niveles de complejidad y es esta complejidad que define la cantidad de horas de desarrollo y prueba que una tarea debe tener. 
La complejidad es definida en conjunto con el project manager y en función del alcance. Algunos ejemplos a continuación:

* 1: Tareas que involucran cambio de texto, correcciones de estilo de botones
* 2: Mejoras a estilos visuales que involucren diseños nuevos.
* 3: Realizar paginaciones en tablas. 
* 4: Funcionalidades nuevas, flujos de acceso y botones con condicionales dado roles, permisos y/o estados del proceso.
* 5: Funcionalidades que involucran manipulación de resultados o toma de datos (evaluación, encuestas).


