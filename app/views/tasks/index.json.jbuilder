json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :duration, :state, :task_type_id
  json.url task_url(task, format: :json)
end
