## Git Flow Rankmi

### Instalación

    git clone https://github.com/datasift/gitflow
    cd gitflow
    sudo ./install.sh

### Uso

#### Inicialización

Antes de poder utilizar gitflow tenemos que posicionarnos en nuestra proyecto, por ejemplo:

    # en el caso de la app
    cd ~/dev/app 
    # 
    cd ~/dev/api

Una vez ahí, inicializamos hub flow. Lo único que hay que cambiar es la rama de 'next release' donde debemos ingresar 'development, al resto hay que darle enter:
    
    git hf init -a
    Branch name for production releases: [master]
    Branch name for "next release" development: [develop] development

    How to name your supporting branch prefixes?
    Feature branches? [feature/]
    Release branches? [release/]
    Hotfix branches? [hotfix/]
    Support branches? [support/]
    Version tag prefix? []

En el caso de que se cometa una equivocación al ingresar estos datos, pueden volver a inicializar este prompt con:

    git hf init -a -f

#### Feature

Para inicializar un feature utilizamos el siguiente comando:

    git hf feature start XXXX

*¿Quién lo debe hacer?* El developer

donde XXXX corresponde al código de la tarea asignada en youtrack.

Los pasos que el **QA** debe realizar para finalizar un feature son los siguientes
* Se debe hacer rebase de la rama contra development
* Si existen conflictos se debe cancelar el rebase y se le avisa al **Developer** que solucione los conflictos.
* Hacer merge del PR.
* Se debe finalizar el feature `git hf feature finish XXXX`. 


#### Hotfix

El hotfix es una tarea que no debiera tomar más de un día, por lo que deben evitar abrir una rama de hotfix si es que el arreglo va a ser demoroso. Dicho de otra forma sólo los `Critical`, `ShowStopper` o `Blocker` deben ser hotfix.

Para inicializar un hotfix, ejecutan el siguiente comando:

    git hf hotfix start x.y.z


*¿Quién lo debe hacer?* **El developer**

donde x.y.z se refiere a la versión que corresponde de nuestro proyecto. En el caso de un hotfix, **y** siempre será el id de la tarea en youtrack. El id es el número que viene después de la sigla RKM-XXXX.

Una vez que hayamos abierto un PR a master, hayan corrido exitosamente los tests y tengamos la tarea aprobada, se ejecuta el siguiente comando:

    git hf hotfix finish x.y.z

*¿Quién lo debe hacer?* **El QA**

#### Múltiples Hotfixes

En el caso de que haya un hotfix ya abierto, la aplicación nos retorna el siguiente mensaje:

    $ git hf hotfix start 1.0.6
    Extrayendo origin
    There is an existing hotfix branch (hotfix/1.0.5). Finish that one first

Para poder seguir trabajando, podemos crear la rama hotfix manualmente:

    $ git checkout -b hotfix/1.0.6
    # Realizamos los cambios
    $ git push --set-upstream origin hotfix/1.0.6
    # Abrimos el PR, esperamos el CR y la aprobación del QA y finalizamos el hotfix como siempre
    $ git hf hotfix finish 1.0.6

#### Release

El release es un lanzamiento para producción. Se debe realizar solo por los **Team Leaders** o el **CTO**.
Para preparar un release debe ejecutarse el comando siguiente:

    git hf release start X.Y.Z

    # Ejemplo:
    git hf release start 3.19.0

El criterio para aumentar el X o Y debe ser:

Si hay tareas menores, correcciones de errores se debe aumentar el **Y**. Si las tareas son break changes, tareas épicas, o actualizaciones mayores de librerías, módulos o refactor de códigos vitales para la plataforma se debe aumentar el X. Z siempre debe resetearse a 0 cuando se hace un release.

Es importante antes de hacer un lanzamiento realizar un `git fetch --all` y posteriormente un `git tag` para identificar los tags que están y revisar cuál es el último que está registrado para tomar la versión apropiada.

Una vez que se hayan hecho las modificaciones necesarias (bump de la versión en nuestro proyecto), debemos hacer un finish al release:

    git hf release finish X.Y.Z

    # Ejemplo:
    git hf release finish 3.19.0
