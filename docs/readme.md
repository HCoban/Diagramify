# RailsModelVisualizer

[Ruby Gems Link][link]
[link]: http://www.example.com

## Minimum Viable Product

RailsModelVisualizer is a ruby gem which will improve documentation of rails apps. Developers will be able to generate a diagram summarizing a rails app using RailsModelVisualizer. The diagram will show inheritance, AR associations, public and private methods, and instance variables of user-defined classes. By the end of week 11, this app will, at a minimum, satisfy the following criteria.

- [ ] Installing through command line with `gem install rails_model_visualizer`
- [ ] Extracting user-defined methods and instance variables
- [ ] Determining associations and inheritance between classes
- [ ] Generating an interactive html output
- [ ] Production readme

## Wireframes

This gem will generate an html file consists of boxes styled with css.
- Each box will correspond to a single ruby class.   
- Boxes will consist of following sections
  - Instance variables: will list instance variables
  - Methods: will list user-defined public and private methods
    - method's source code will be shown on mouseover
  - Associations: will list AR associations
    - associated class will be shown on click
  - Inheritance: will list parent and child classes
    - child/parent class source code will be shown on click

![expected output](/docs/wireframes/wireframe.png)

## Technologies

The project will be implemented with the following technologies:

- `Ruby` for the gem development.
- `CSS` for styling.
- Possible `JavaScript and JQuery` for an interactive UI.

## Implementation Timeline

### Day 1

**Objective:** Developing a locally available version of the gem

- [ ] Read RubyGems documentation
- [ ] Organize project structure/folders
- [ ] Test installing gem (locally)
- [ ] Extract classes from rails apps

### Day 2

**Objective:** Extract information from ruby classes

- [ ] Scan .rb files found in Day 1 and extract public and private methods
- [ ] Extract AR associations from `has_many`, `has_one`, and `belongs_to` methods.
- [ ] Extract inheritance information from class definitions

### Day 3

**Objective:** Generate html output

- [ ] Generate an HTML file as a diagram
- [ ] Publish previously extracted information into the html file
- [ ] Style using CSS (and JavaScript, JQuery)

### Day 4

- [ ] Write tests
- [ ] Write production readme
- [ ] Push gem to RubyGems.org
