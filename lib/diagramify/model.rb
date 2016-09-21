class Model
  attr_reader :name, :columns

  def initialize(rails_model)
    @name = rails_model.name
    @columns = rails_model
  end

  def to_div
    return (
      "<div class=\"model\">
        <ul>
          #{@name}
        </ul>
      </div>"
    )
  end

end
