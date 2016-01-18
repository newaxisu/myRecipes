json.array!(@reviews) do |review|
  json.extract! review, :id, :chef_id, :review, :recipe_id, :headline
  json.url review_url(review, format: :json)
end
