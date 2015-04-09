json.array!(@viewimages) do |viewimage|
  json.extract! viewimage, :id, :image, :title, :content
  json.url viewimage_url(viewimage, format: :json)
end
