json.array!(@projects) do |project|
  json.extract! project, :id, :name, :date, :description, :ref, :responsible_id
  json.url project_url(project, format: :json)
end
