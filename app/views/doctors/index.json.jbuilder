json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :surname
  json.url doctor_url(doctor, format: :json)
end
