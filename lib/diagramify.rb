require "diagramify/version"
require "diagramify/model"

# Rails.application.eager_load!

module Diagramify
  models = ActiveRecord::Base.descendants
end
