class Model
  attr_reader :name, :columns

  def initialize(rails_model)
    @name = rails_model.name
    @columns = rails_model.columns
  end

  def to_div
    columns = @columns.map do |c|
      "<li>#{c.name} (#{c.sql_type})</li>"
    end

    return (
      "<div class=\"model\">
        <h1>#{@name}</h1>
        <ul>Columns
          #{columns.join("")}
        </ul>
      </div>"
    )
  end

end
