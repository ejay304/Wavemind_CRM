json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :beginDate, :endDate, :ref
  json.url activity_url(activity, format: :json)
end
