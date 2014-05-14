json.array!(@members) do |member|
  json.extract! member, :id, :title, :body
  json.url member_url(member, format: :json)
end
