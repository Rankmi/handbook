# Git

## Comandos útiles

### Historial descriptivo con --graph

Si queremos ver la estructura de nuestro historial de commits podemos utilizar la opción `--graph` de git log.

    git log --graph

### Squashing commits con rebase

Squashing se refiere a unir varios commits pequeños en commits más grandes. 

Por ejemplo, si voy corrigiendo errores en mi rama no es raro que nuestro historial de commits quede como:

    $ git log --graph
    * commit b755aaca0e004dae6faedd37b001deec5f1e72d0 (HEAD -> master)
    | Author: efredz <efredzb@gmail.com>
    | Date:   Mon Jun 3 12:01:48 2019 -0400
    |
    |     Fixed null pointer exception
    |
    * commit a88c566838965973c99e89bad365c6ef135c7a0b
    | Author: efredz <efredzb@gmail.com>
    | Date:   Mon Jun 3 11:58:13 2019 -0400
    |
    |     Added spanish translations
    |
    * commit 2589c52acd0fa13a2925356b1593b3330249e6dc
    | Author: efredz <efredzb@gmail.com>
    | Date:   Mon Jun 3 11:57:55 2019 -0400
    |
    |     Fixed missing colon
    |

Para mantener el orden de nuestro proyecto, agruparemos todos los commits en uno solo (porque corresponden todo a una sola funcionalidad). Para esto squashearemos todos los commits en uno utilizando el rebase interactivo, cuya sintaxis es:

    git rebase -i $COMMIT_HASH

Por ejemplo, en nuestro caso queremos hacer squash de los 3 últimos commits, por lo que usamos el siguiente comando:

    git rebase -i HEAD~3

En caso de que queramos hacer squash desde un hash en específico, podemos pasarle ese hash como parámetro:

    git rebase -i cebfa9a2b889d303b0654f0639b1967bf0ec7a55

Al ingresar el comando para inicializar el rebase interactivo, se abrirá nuestro editor de texto configurado (vim por defecto) y se verá algo así:

    pick 2589c52 Fixed missing colon
    pick a88c566 Added spanish translations
    pick b755aac Fixed null pointer exception

Si queremos agrupar todos los commits en uno solo, debemos dejar en pick uno solo de los commits y en `squash` o `s` el resto.

    pick 2589c52 Fixed missing colon
    s a88c566 Added spanish translations
    s b755aac Fixed null pointer exception

Guardamos, cerramos y se abrirá nuevamente nuestro editor de texto donde podemos seleccionar el mensaje que queramos dejar para el commit resultante.

**Nota:** Cuando hacemos rebase en una rama que ya existe en github, debemos hacer push con -f para forzar el squash:

    $ git push -f

### Corregir commits con amend

Ammend nos permite corregir un commit en caso de nos haya faltado hacer un cambio, nos hayamos equivocado en escribir el mensaje del commit, etc.

Supongamos que agregamos nuestro commit y nos equivocamos en el mensaje:

    $ git commit -m "Fixed issue 13242"

Una vez hecho el commit, nos damos cuenta de que la tarea en realidad es la 13243, así que usamos amend para corregir el mensaje

    $ git commit --amend -m "Fixed issue 13243"


En el caso que queramos corregir un commit porque se nos olvidó realizar un cambio y no queremos generar un nuevo commit sólo para ese cambio también podemos utilizar amend para solucionar este problema.

    $ git log --graph
    * commit 24d21e09412b76032f33d4fa5a092dca3a0eaf88 (HEAD -> master)
    | Author: efredz <efredzb@gmail.com>
    | Date:   Mon Jun 3 12:20:57 2019 -0400
    |
    |     Replaced string interpolation with regular print
    |

    # Realizamos nuestros cambios y los añadimos
    $ git add .

    # Ahora, para evitar generar un nuevo commit, utilizamos amend con no-edit
    $ git commit --amend --no-edit

    # Después del commit, se mantiene un sólo commit y no tenemos que 
    # volver a escribir un mensaje
    $ git log --graph
    * commit 3a818276fbdba4799c4a456bc14a31bef4007c53 (HEAD -> master)
    | Author: efredz <efredzb@gmail.com>
    | Date:   Mon Jun 3 12:23:00 2019 -0400
    |
    |     Replaced string interpolation with regular print
    |

