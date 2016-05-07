json.array!(@questions) do |question|
  json.extract! question, :id, :header, :text
  json.url question_url(question, format: :json)
end
