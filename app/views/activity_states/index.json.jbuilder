json.array!(@activity_states) do |activity_state|
  json.extract! activity_state, :id, :name
  json.url activity_state_url(activity_state, format: :json)
end
