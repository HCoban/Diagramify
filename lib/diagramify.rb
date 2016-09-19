require "diagramify/version"
require "diagramify/model"
require "rails"
require "active_support"
require "rubygems"
require "active_record"

debugger

# Rails.application.eager_load!

module Diagramify
  models = ActiveRecord::Base.descendants
end
