require "rails_model_visualizer/version"
require "rails_model_visualizer/templates"
require "rails_model_visualizer/model"
require "launchy"
require "fileutils"

class RMVisualizer

  def self.import_models
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
    RMVisualizer.import_models.each do |m|
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


    dirname = File.dirname("docs/RMVisualizer")
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

    File.open("docs/RMVisualizer/output.html", 'w+') do |file|
      file.write(RMVisualizer.html(body))
    end

    File.open("docs/RMVisualizer/application.css", "w+") do |file|
      file.write(RMVisualizer.css)
    end

    puts "output.html created at docs/RMVisualizer folder"
    Launchy.open("docs/RMVisualizer/output.html")
    return nil
  end







end
