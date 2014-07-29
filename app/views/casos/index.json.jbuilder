json.array!(@casos) do |caso|
  json.extract! caso, :id, :casename, :victname, :date_occu, :place_occu, :desc, :status, :user_id
  json.url caso_url(caso, format: :json)
end
