## Servicios

Un servicio en Rankmi es una clase que se encarga de la lógica de negocios. Debe tener responsabilidades claras, unicas y su código debe ser conciso... si, es verdad, en Rankmi no todo sigue esta filosofía pero lo intentamos.

```ruby 
module ActiveMenu
  class Buildatable
    attr_reader :items, :rkm_module, :type

    def initialize(rkm_module:, type:)
      @items = []
      @rkm_module = rkm_module
      @type = type
    end

    def build 
      
    end

    private

    def load_yml

    end
  end
end

# Uso => 
ActiveMenu.new(rkm_module:RankmiModule.find(2), type:Menu::GENERAL_MENU).build

```

