json.array!(@users) do |user|
  json.extract! user, :id, :name, :firstname, :string, :fax, :function, :zip, :city, :country, :address
  json.url user_url(user, format: :json)
end
