json.array!(@activities) do |activity|
  json.extract! activity, :title, :description, :client_id, :rate, :date
  json.url activity_url(activity, format: :json)
end
