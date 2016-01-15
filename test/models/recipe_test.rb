require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(
    name: "Peanut Butter Barley Soup",
    summary: "A delicious soup with surprising ingredients",
    description: "Combine chicken stock, barley, brocoli, peanut butter and lemon juice.")
  end
  
  test "recipe has all required fields" do
    assert @recipe.valid?
  end
  
  test "name should be valid" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
end
