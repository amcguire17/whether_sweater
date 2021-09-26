class Image
  attr_reader :location, :url, :source, :author, :author_url

  def initialize(info)
    @location = map_location(info[:tags])
    @url = info[:urls][:regular]
    @source = 'unsplash.com'
    @author = info[:user][:username]
    @author_url = "#{info[:user][:links][:html]}?utm_source=whether_sweater&utm_medium=referral"
  end

  def map_location(tags)
    arr = []
    tags.each do |tag|
      arr << tag[:title]
    end
    arr.join(',')
  end
end
