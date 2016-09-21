# require "diagramify/version"
require "diagramify/templates"
require "diagramify/model"

class Diagramify

  def self.abs_models
    if Rails.application
      Rails.application.eager_load!
      return ActiveRecord::Base.descendants.map do |rails_model|
        Model.new(rails_model)
      end
    else
      return []
    end
  end

  def self.print_models
    models = []
    Diagramify.abs_models.each { |m| models << m.to_div }
    body = models.join("")

    File.open("output.html", 'w+') do |file|
      file.write(Diagramify.html(body))
    end

    File.open("application.css", "w+") do |file|
      file.write(Diagramify.css)
    end

    return nil
  end







end
