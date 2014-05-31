json.array!(@members) do |member|
  json.extract! member, :id, :name, :image, :body
  json.url member_url(member, format: :json)
end
