# require "diagramify/version"
require "diagramify/css_template"
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

    start = "<!DOCTYPE html>
    <html>
      <head>
        <meta charset=\"utf-8\">
        <title>Diagramify</title>
        <link rel=\"stylesheet\" media=\"all\" href=\"./application.css\">
      </head>
      <body>"

    finish = "</body> </html>"
    body = models.join("")


    File.open("output.html", 'w+') do |file|
      file.write(start+body+finish)
    end

    File.open("application.css", "w+") do |file|
      file.write(CSS)
    end

    return nil
  end







end
