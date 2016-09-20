module Diagramify


  class Model

    def initialize(rails_model)
      @name = rails_model.name
      @columns = rails_model
    end

  end
end
