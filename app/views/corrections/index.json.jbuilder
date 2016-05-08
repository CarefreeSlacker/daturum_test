json.array!(@corrections) do |correction|
  json.extract! correction, :id, :user_id, :answer_id, :text
  json.url correction_url(correction, format: :json)
end
