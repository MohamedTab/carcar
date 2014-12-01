json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :starts_at, :ends_at
  json.url lesson_url(lesson, format: :json)
end
