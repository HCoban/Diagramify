# RailsModelVisualizer

RailsModelVisualizer is a ruby gem which improves documentation of rails
apps by generating an html output visualizing rails models.

![main_image](/docs/wireframes/general.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_model_visualizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_model_visualizer

## Usage

In order to use RailsModelVisualizer, execute the following line in the rails console.

```ruby
RMVisualizer.print_models
```

This will generate and launch an html file visualizing rails models. Typically, all rails models will inherit from `ActiveRecord::Base`, thus one outer box representing the superclass will be displayed. In case another superclass is also present, more than one outer box will also be displayed.

Within each outer box, there will be inner boxes representing rails models. In the current version of the gem, three main type of information  is displayed.

- SQL Columns
In this section, column names of the model's table is listed. Hovering on a column name shows the data type (integer, timestamp, etc.).

- Methods
Both public and private methods of the model are listed here. Hovering on a method name shows the source code for that method.

- Associations
`ActiveRecord` associations are listed in this section. If an option for the association is defined (for example `class_name`), it is shown while hovering on the association name.

## Development

The gem is build on Ruby. `RMVisualizer` class imports model information
from Rails and creates `Model` instances.

```ruby
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
```

Superclass, SQL columns, methods and associations are imported from rails, as well. For example, the instance methods are imported as follows.

```ruby
def get_methods(type)
  filename = "#{@name.underscore}.rb"
  result = {};

  @rails_model.new.method(type).call(false).each do |pm|
    source_file = source(@rails_model, pm)
    if source_file[0].include?(filename)
      result[pm] = source_code(source_file, pm)
    end
  end

  result
end
```

where the type is either `:private_methods` or `:public_methods`. The argument `false` in method call filters out methods not defined by the user.

Method source code is read from the sourcefile as follows.

```ruby
def source_code(source_file, method)
  path, start_line = source_file
  source_code = []
  line_to_read = start_line - 1
  file = File.readlines(path)

  while true
    source_code.push(indent(file[line_to_read]))
    break if file[line_to_read] == "  end\n"

    line_to_read += 1
  end

  source_code.join("<br>")
end
```

This approach as long as the indentation is correct.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HCoban/rails_model_visualizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
