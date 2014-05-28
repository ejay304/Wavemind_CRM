json.array!(@images) do |image|
  json.extract! image, :id, :description, :link, :project_id
  json.url image_url(image, format: :json)
end
