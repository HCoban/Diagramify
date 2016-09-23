# require "diagramify/version"
require "diagramify/templates"
require "diagramify/model"
require "launchy"

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
    superclasses = {}
    Diagramify.abs_models.each do |m|
      if superclasses[m.super_class]
        superclasses[m.super_class] += m.to_div
      else
        superclasses[m.super_class] = m.to_div
      end
    end

    body = ""
    superclasses.each do |superclass, model_div|
      body += "<div class=\"superclass\">#{superclass}
        #{model_div}
      </div>"
    end

    File.open("output.html", 'w+') do |file|
      file.write(Diagramify.html(body))
    end

    File.open("application.css", "w+") do |file|
      file.write(Diagramify.css)
    end

    puts "output.html created at root folder"
    Launchy.open("./output.html")
    return nil
  end







end
