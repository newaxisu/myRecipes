json.array!(@chefs) do |chef|
  json.extract! chef, :id, :name, :email
  json.url chef_url(chef, format: :json)
end
