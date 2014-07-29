json.array!(@details) do |detail|
  json.extract! detail, :id, :weapon, :primesuspect, :personinvolved, :evid_collected, :evid_inv, :notes, :guilty
  json.url detail_url(detail, format: :json)
end
