## Complejidad de la clase
Las clases no deben tener más allá de 200 líneas (a excepción de los modelos).

## Complejidad de los métodos 

Un método no puede tener más de 60 líneas de código. En caso de tener más se debe extraer en métodos que pueden ir en la clase o en módulos.

## Patrón decorator
Las clases deben incluir módulos que permitan extender sus funcionalidades. El nombre de los módulos deben ser Adjetivos que describan lo que hace. Por ejemplo `Filterable | Queryable | Recordable | Exportable`
Los módulos no solo deben implementar métodos reutilizables. Tienen que implementar métodos que deben tener coherencia y responder a un conjunto de actividades que permitan definir un scope funcional del módulo, lo que permite decorar el funcionamiento de la clase.

## Query 
Las query para obtener datos deben ser implementadas en los modelos. Estas pueden ser **métodos de clase** o **métodos de instancia**

## Especificaciones específicas.
* [Elementos generales](https://github.com/Rankmi/api/wiki/C%C3%B3digo-Base)
* [Clases exportables](https://github.com/Rankmi/api/wiki/Clases-exportables)

## Naming de elementos
Se debe seguir la guía [Ruby best practices](https://github.com/bbatsov/ruby-style-guide)

## Authorización de usuarios
La autorización de usuarios esta implementado utilizando Policies
* [Consideraciones generales](https://github.com/Rankmi/api/wiki/Autorizaci%C3%B3n-de-usuarios-(Policies))

## Definición de métodos
Los métodos serán definidos de la siguiente manera 
```ruby
def write(file:, data:, mode: "ascii")
end
```
El llamado será 
```ruby
write(data: 123, file: "test.txt")
```
Referencia:  [http://www.rubyguides.com/2018/06/rubys-method-arguments/](http://www.rubyguides.com/2018/06/rubys-method-arguments/)
## Import masivo via excel

Referencia [Ver importación](https://github.com/Rankmi/api/wiki/importacion-via-excel)

