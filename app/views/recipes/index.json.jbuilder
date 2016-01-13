json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :summary, :description, :cchef_id
  json.url recipe_url(recipe, format: :json)
end
