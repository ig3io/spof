module Spof

  module Search

    def self.album(text, page = 1)
      url = 'http://ws.spotify.com/search/1/album.json'
      return get_response(url, text, page)
    end

    def self.artist(text, page = 1)
      url = 'http://ws.spotify.com/search/1/artist.json'
      return get_response(url, text, page)
    end

    def self.track(text, page = 1)
      url = 'http://ws.spotify.com/search/1/track.json'
      return get_response(url, text, page)
    end

    private
    def self.get_response(url, text, page = 1)
      uri = URI(url)
      uri.query = URI.encode_www_form({
        :q => text,
        :page => page
        })
      return uri.to_s if Spof.testing?
      response = Net::HTTP.get(uri)
      return JSON.parse(response, :symbolize_names => true)
    end

  end

end