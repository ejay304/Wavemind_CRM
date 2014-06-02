json.array!(@documents) do |document|
  json.extract! document, :id, :name, :link, :date, :document_type_id, :activity_id
  json.url document_url(document, format: :json)
end
