json.array!(@likes) do |like|
  json.extract! like, :id, :like, :chef_id, :recipe_id
  json.url like_url(like, format: :json)
end
