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

    # Por ejemplo:
    git hf feature start RKMB-1342

*¿Quién lo debe hacer?* El developer

donde XXXX corresponde al código de la tarea asignada en youtrack.

Los pasos que el **QA** debe realizar para finalizar un feature son los siguientes
* Se debe hacer rebase de la rama contra development
* Si existen conflictos se debe cancelar el rebase y se le avisa al **Developer** que solucione los conflictos.
* Hacer merge del PR.
* Se debe finalizar el feature `git hf feature finish XXXX`.  Por ejemplo para la rama/tarea RKMB-1342: `git hf feature finish RKMB-1342`


#### Hotfix

El hotfix es una tarea que no debiera tomar más de un día, por lo que deben evitar abrir una rama de hotfix si es que el arreglo va a ser demoroso. Dicho de otra forma sólo los `ShowStopper` o `Blocker` deben ser hotfix.

Para inicializar un hotfix, ejecutan el siguiente comando:

    git hf hotfix start x.y.z


*¿Quién lo debe hacer?* **El developer**

donde x.y.z se refiere a la versión que corresponde de nuestro proyecto. Un hotfix solo modifica el valor z, donde z corresponde al código de la tarea que, por ejemplo si la última versión de la app es `3.1.0` y nuestra tarea tiene código `RKMB-1432`, nuestra hotfix debe ir con la versión `3.1.1432`.

Una vez que hayamos abierto un PR a master, hayan corrido exitosamente los tests y tengamos la tarea aprobada, debemos verificar cuál es la versión más reciente de la aplicación:

    git fetch --tags && git tag --sort=-createordate

Si es que el major(X) o el minor(Y)  de la aplicación cambió, debemos cambiar el nombre de la rama remota y local (puedes ocupar este [comando git](https://github.com/efredz/custom-git-commands/blob/master/git-rename-branch)) para reflejar el cambio. Si es que la versión del branch es 3.16.4323, y el último tag es 3.17.0, debemos modificar el nombre de nuestra rama a 3.17.4323.

Si es que no ha cambiado la versión, podemos proceder a cerrar el feature (sin hacer merge desde github):

    $ git hf hotfix finish x.y.z

    # Ejemplo, para el hotfix 3.1.1432
    $ git hf hotfix finish 3.1.1432

*¿Quién lo debe hacer?* **El QA**

#### Múltiples Hotfixes

En el caso de que haya un hotfix ya abierto, la aplicación nos retorna el siguiente mensaje:

    $ git hf hotfix start 1.0.6232
    Extrayendo origin
    There is an existing hotfix branch (hotfix/1.0.5). Finish that one first

Para poder seguir trabajando, podemos crear la rama hotfix manualmente:

    $ git checkout -b hotfix/1.0.6232
    # Realizamos los cambios
    $ git push --set-upstream origin hotfix/1.0.6232
    # Abrimos el PR, esperamos el CR y la aprobación del QA y finalizamos el hotfix como siempre
    $ git hf hotfix finish 1.0.6232

#### Release

El release es un lanzamiento para producción. Se debe realizar solo por los **Team Leaders** o el **CTO**.
Para preparar un release debe ejecutarse el comando siguiente:

    git hf release start X.Y.Z
    # Ejemplo:
    git hf release start 3.18.0

El criterio para aumentar el X o Y debe ser:

Si hay tareas menores, correcciones de errores se debe aumentar el **Y**. Si las tareas son break changes, tareas épicas, o actualizaciones mayores de librerías, módulos o refactor de códigos vitales para la plataforma se debe aumentar el X.

Es importante antes de hacer un lanzamiento realizar un `git fetch --all` y posteriormente un `git tag` para identificar los tags que están y revisar cuál es el último que está registrado para tomar la versión apropiada.


### Utilidades GIT

`git log --graph`
`git commit --amend --no-edit`


Más utilidades en la carpeta **Utils**
