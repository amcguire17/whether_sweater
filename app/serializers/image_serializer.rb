class ImageSerializer
  def self.format_data(image)
    {
      "data": {
        "id": image.id,
        "type": 'image',
        "attributes": {
          "image": {
            "location": image.location,
            "image_url": image.url,
            "credit": {
              "source": image.source,
              "author": image.author,
              "author_link": image.author_url
            }
          }
        }
      }
    }
  end
end
