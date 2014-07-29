json.array!(@guns) do |gun|
  json.extract! gun, :id, :type, :model
  json.url gun_url(gun, format: :json)
end
