json.array!(@bubbles) do |bubble|
  json.extract! bubble, :id, :title, :body
  json.url bubble_url(bubble, format: :json)
end
