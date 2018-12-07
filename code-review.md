El code review es una actividad central en el proceso de desarrollo. 

El proceso es el siguiente:

1. Una vez una tarea ha sido finalizada se debe pasar a la columna **Listo**.
2. Se debe asignar, tanto en la tarea como en el PR, la persona que debe revisar.
3. En caso de existir solicitudes de cambio se debe agregar el tag **Code changes requested** y mover a la columna **CR cambios solicitados**.
4. Cuando se aprueben los cambios se debe quitar el tag anterior y colocar **Code review approved** y se debe mover a la columna **Pendiente de QA**
5. Una vez esté en la columna **Pendiente de QA** el analista QA debe hacer merge desde la rama origen hacia la rama del PR.
6. En caso de haber conflictos se debe pedir al developer que lo revise.


Para el caso de las tareas, el code review debe tener en cuenta las buenas practicas de código detalladas en el Home de la wiki.
