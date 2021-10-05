# frozen_string_literal: true

class Image
  attr_reader :id, :location, :url, :source, :author, :author_url

  def initialize(info, location)
    @id = nil
    @location = location
    @url = info[:urls][:regular]
    @source = 'unsplash.com'
    @author = info[:user][:username]
    @author_url = "#{info[:user][:links][:html]}?utm_source=whether_sweater&utm_medium=referral"
  end
end
