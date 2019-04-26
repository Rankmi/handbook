## Consideraciones generales.

En términos generales, las consideraciones para programar en Rankmi son las siguientes:

Nuestra estructura está asentada basado en servicios, policies, skinny controllers además de un conjunto de concerns que se encargan de validar parámetros y generar objetos para los servicios.


### Métodos

Los métodos en nuestra aplicación están construidos con *named parameters*. Esto nos permite que el llamado al método quede mejor explicado además de que el orden de los parámetros realmente no importe.

```ruby

def some_method(object1:nil, object2:nil)

end

# Uso => 
object.some_method(object1:[], object2:{})

```

### Constantes

Las constantes no deben ser strings o numéricos usados directamente en algún método. Siempre deben estar definidos como constantes, generalmente en los modelos.

```ruby
class Account < ActiveRecord::Base

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

end
# Uso => 
Account::VALID_EMAIL_REGEX

```
