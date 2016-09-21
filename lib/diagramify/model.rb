require 'byebug'

class Model
  attr_reader :name, :columns

  def initialize(rails_model)
    @name = rails_model.name
    @columns = rails_model.columns
    @rails_model = rails_model
  end

  def to_div
    columns = @columns.map do |c|
      "<li>#{c.name} (#{c.sql_type})</li>"
    end

    methods = public_methods.map do |pm|
      "<li>#{pm}</li>"
    end

    methods = methods.concat(private_methods.map do |pm|
      "<li>#{pm} (private)</li>"
    end)

    assoc_list = []
    associations.each do |assoc_name, type|
      assoc_list.push("<li>#{type}: #{assoc_name}</li>")
    end

    return (
      "<div class=\"model\">
        <h1>#{@name}</h1>
        <div class=\"model-details\">
          <ul>SQL Columns
          #{columns.join("")}
          </ul>
          <ul>Methods
          #{methods.join("")}
          </ul>
          <ul>Associations
          #{assoc_list.join("")}
          </ul>
        </div>
      </div>"
    )
  end

  def source(model, method)
    m = method.to_sym
    @rails_model.new.method(m).source_location
  end

  def public_methods
    filename = "#{@name.underscore}.rb"
    result = [];

    @rails_model.new.public_methods(false).each do |pm|
      result.push(pm) if @rails_model.new.method(pm).source_location[0].include?(filename)
    end

    result
  end

  def private_methods
    filename = "#{@name.underscore}.rb"
    result = [];

    @rails_model.new.private_methods(false).each do |pm|
      result.push(pm) if @rails_model.new.method(pm).source_location[0].include?(filename)
    end

    result
  end

  def associations
    assoc = {}
    @rails_model.reflections.each do |name, association|
      if association.class.name.include?("HasManyReflection")
        type = "has_many"
      elsif association.class.name.include?("HasOneReflection")
        type = "has_one"
      elsif association.class.name.include?("BelongsToReflection")
        type = "belongs_to"
      else
        type = "other"
      end
      assoc[association.name.to_s] = type

    end
    assoc
  end


end
