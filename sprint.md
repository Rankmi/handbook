## Cómo gestionamos nuestros Sprints

Nuestros sprint tienen, y siempre tendrán, nombres de superhéroes. Normalmente están relacionados con la película del mes. 
La duración de nuestros sprint es de aproximadamente 1 mes empezando siempre el primer lunes de cada mes. 

Cada sprint tiene, para cada [tribu](teams.md) 2 o 3 objetivos principales que serán el foco de todo el trabajo.

## Gestión de las tareas

### Cómo completar una tarea
Las tareas deben ser reportadas siguiendo las siguientes reglas:

* Descripción de la tarea general. 
* Descripción de la matriz de prueba que se deben seguir.
* Listado de PR tanto de app como de API según corresponda.
* tags que permitan identificarlo (Si no la tiene nosotros debemos agregarlo).

### Gestión del flujo  en Youtrack.

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

### Flujo de tareas y bugs

El siguiente flujo se aplica de la siguiente manera:

1. Las tareas que se deben abordar están en la columna **Por hacer**. Para tomar una tarea se debe conversar los plazos y prioridades con el project manager correspondiente. A las tareas se les debe asignar la **complejidad**
2. Una vez definida la tarea que hay que se debe inicializar una tarea según el flujo de [hubflow](hubflow.md). El caso de uso debe ser revisado en conjunto con el project manager y debe ser incluido en la tarea.
3. Posteriormente se debe crear una rama que nace desde development. El nombre de la rama debe partir con el identificador único de la tarea, normalmente el formato es **RKM-XXX-descripción-breve-de-la-tarea**
4. Cuando la tarea está en curso se debe desarrollar. Durante esta etapa, se debe escribir y actualizar los casos de prueba que se han realizado para completar el desarrollo además de los casos de prueba que QA debería tomar en consideración para la correcta revisión.
5. Una vez finalizada se crea un **Pull Request** que debe apuntar a **development** (en el caso de un feature) o **master** en el caso de un **hotfix** y el card se debe pasar a la columna **Para Codereview**. En esta columna se le debe asignar un code reviwer en la sección correspondiente.
6. En caso de que se soliciten cambios y se pasa nuevamente a **En curso**. Se repite el proceso de pasar la tarea a **Para Codereview** cuando se ha terminado de hacer los cambios el **Code review** se vuelve a realizar.
6. Cuando el code review se ha realizado y aprobado se debe pasar la tarea a **Pendiente de QA**.
7. El Analista QA tomará la tarea y la pasará a **En review**.
8. En caso de que la tarea sea aceptada se debe pasar a la columna **Aceptado**
9. En caso contrario se especificará en el **Pull Request** por que ha fallado adjuntando evidencia.
10. Si la tarea está en **Aceptado** puede pasar a producción en cualquier momento.

### Criticidad 
[Show-stopper](https://www.notion.so/061602a5ebca49328f2685ff7bd67541)

[Blocker](https://www.notion.so/1a7367a4d016490ba7bd87b5f4ee07c4)

[Critical](https://www.notion.so/ccb8906b2e1242f2b6051cb6d236d331)

[Major](https://www.notion.so/7e070f45044c4f6995efd1e63d97aeb2)

[Normal](https://www.notion.so/abc89e8046d14fdd8c60d44c097bcfb1)

[Minor](https://www.notion.so/cd2c4892f70c4f5d9ec9c61d58ac17f7)

### Complejidad de las tareas.

Las tareas tienen distintos niveles de complejidad y es esta complejidad que define la cantidad de horas de desarrollo y prueba que una tarea debe tener. 
La complejidad es definida en conjunto con el project manager y en función del alcance. Algunos ejemplos a continuación:

* 1: Tareas que involucran cambio de texto, correcciones de estilo de botones
* 2: Mejoras a estilos visuales que involucren diseños nuevos.
* 3: Realizar paginaciones en tablas. 
* 4: Funcionalidades nuevas, flujos de acceso y botones con condicionales dado roles, permisos y/o estados del proceso.
* 5: Funcionalidades que involucran manipulación de resultados o toma de datos (evaluación, encuestas).

### Tiempo de pruebas

Un aspecto fundamental es entender el tiempo de prueba de cada tarea. Si bien es cierto nuestro enfoque es lograr automatizar gran parte de la tarea de un QA la visión y prueba humana siempre es parte fundamental de nuestro trabajo.
Es por eso que registramos la cantidad de horas que se le destinó la prueba de cada tarea.


### Flujo de tareas en relación a [Hubflow](hubflow.md)

El flujo de como pasar una tarea en términos de código a las siguientes etapas es la siguiente 

1. Se abre un feature o hotfix según corresponda [Más detalles acá](hubflow.md)
2. Al momento de pasar la tarea a CodeReview se debea hacer rebase `git rebase <ORIGIN>`
3. AL pasar la tarea a **Pendiente de QA** se debe entregar un solo commit `git rebase -i HEAD~NUMERO-COMMITS`
4. El qa, deberá probar la tarea, luego de la prueba, en caso de rechazo pasará al estado Rechazado. SI la tarea esa aceptada el QA, en caso de que no hayan conflictos podrá hacer primero un rebase de la tarea contra *origin* y posteriormente hacer un merge. En caso contrario deberá comunicarse con el developer para que solucione los conflictos y finalize la tarea. Al momento de finalizar se hace `got hf finish feature RKM-XXXX`
5. Si la tarea ha sido rechazada, se debe informar al programador, este deberá corregir y realizar un commit, la idea es que en este punto **no** se haga `squash`dado que para poder hacer el Codereview es necesario ver solo el último commit.
6. En caso de ser aceptado se sigue el flujo del punto 4


