require "diagramify/version"
require "diagramify/model"
require "rails"

class Diagramify

  def self.abs_models
    if Rails.application
      Rails.application.eager_load!
      return ActiveRecord::Base.descendants.map do |rails_model|
        Diagramify::Model.new(rails_model)
      end
    else
      return []
    end
  end

  def self.hello
    puts 'hello'
  end



end
