## Migraciones y consideraciones generales. 

Las migraciones son una de las mejores cosas que pueden existir, pero a medida que el tráfico crece y el uso de la base de datos se convierte en un problema, las migraciones estructurales deben realizarse con cuidado. 

### Tablas prohibidas

* `enterprise_processes`
* `users`
* `accounts`
* `evaluation_user_dimensions`
* `process_dimensions`
* `process_dimensions`
* `user_enterprise_processes`
* `dimensions`
* `process_dimensions`
* `enterprise_areas`
* `user_dimensions`

La prohibición en general se basa en tamaño de la tabla (cantidad de registros) además de la cantidad de transacciones que existen hacia cada una de estas tablas.

## ¿Cómo proceder?

Nuestros amigos de desempeño llegaron a la conclusión de que no era posible seguir añadiendo parámetros a la tabla `enterprise_processes` para controlar estados del proceso. 
Es por eso que crearon una clase que tiene la siguiente estructura

``` ruby
module PerformanceConfiguration
  def self.table_name_prefix
    'performance_configuration_'
  end
end
```
Los atributos de la nueva clase performance_configuration_calibration pueden estar disponibles en enterprise_processes a traves de un delegate 

``` ruby 
delegate :configuration_with!, :assessments_by, to: :performance_configuration_calibration
```

Luego, cuando quieren crear una configuración simplemente se crea un modelo, por ejemplo `performance_configuration_calibration` que se encarga de tener las configuraciones propias de un proceso.

En general, se debe comenzar a desacoplar las opciones y atributos normalizando las relaciones.