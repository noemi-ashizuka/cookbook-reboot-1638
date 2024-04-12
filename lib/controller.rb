require_relative "view"
require_relative "recipe"

class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def add
    # Ask the view to ask user for a recipe name
    name = @view.ask_for("name")
    # store the answer
    # Ask the view to ask user for the description
    description = @view.ask_for("description")
    # store the answer
    # make an instance of a recipe
    recipe = Recipe.new(name, description)
    # ask the cookbook to store the recipe
    @cookbook.create(recipe)
  end

  def list
   display_recipes
  end

  def remove
    # display the recipes
    display_recipes
    # ask the user for a number (index)
    index = @view.ask_for_index
    # ask cookbook to remove the recipe
    @cookbook.destroy(index)
  end

  private

  def display_recipes
     # ask the cookbook to give me all the recipes
     recipes = @cookbook.all # array of recipes instances
     # Ask the view to display the recipes
     @view.display_list(recipes)
  end
end
