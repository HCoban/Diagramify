require "diagramify/version"
require "diagramify/model"


module Diagramify

  attr_reader :models

  Rails.application.eager_load!
  @models = ActiveRecord::Base.descendants.map do |rails_model|
    Diagramify::Model.new(rails_model)
  end




end
