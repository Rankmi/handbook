En rankmi tenemos un conjunto de funcionalidades que permiten exportar data.

Estas clases deben ir dentro de 

`app/services/export_services/engagement | app/services/export_services/performance`

Además, cada clase debe implementar una clase interna llamada Exportable. Esto dado que se puede agregar compatiblidad con background jobs a discreción
```ruby
    class SurveyExportResults

        def initialize(survey_id, user_id)
          @survey_id = survey_id
          @user_id = user_id
        end
        def perform(domain_id, area_id, filters, result_type)
          @area_id = area_id
          @survey = Survey.where(id: @survey_id).first
          Exportable.new(@survey_id, @user_id).delay.export(domain_id, area_id, filters, result_type)
          ImmutableStruct.new(:exported).new(exported: true)
        end

        def area_with_access
          @area_with_access ||= ManageUserAccess::GetAreasWithAccess.new(@user_id, @area_id)
        end

        class Exportable

           include Concerns::RankmiHelper

           def initialize(survey_id, user_id)
            
           end

           def export(domain_id, area_id, filters, result_type)
      
           end
        end
    end
```