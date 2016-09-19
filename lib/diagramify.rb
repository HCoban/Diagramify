require "diagramify/version"
require "diagramify/model"

module Diagramify
  Rails.application.eager_load!
  models = ActiveRecord::Base.descendants
end
