require 'net/http'
require 'json'


module Sputnik

  module Search

    def self.album(text, page = 1)
      url = 'http://ws.spotify.com/search/1/album.json'
      return get_response(url, text)
    end

    def artist(text, page = 1)
      url = 'http://ws.spotify.com/search/1/artist.json'
      return get_response(url, text)
    end

    def track(text, page = 1)
      url = 'http://ws.spotify.com/search/1/track.json'
      return get_response(url, text)
    end

    private
    def self.get_response(url, text, page = 1)
      uri = URI(url)
      uri.query = URI.encode_www_form({
        :q => text,
        :page => page
        })
      response = Net::HTTP.get(uri)
      return JSON.parse(response, :symbolize_names => true)
    end

  end

  module Lookup

    def self.album(spotify_uri)
      return get(spotify_uri)
    end

    def self.artist(spotify_uri)
      return get(spotify_uri)
    end

    def self.track(spotify_uri)
      return get(spotify_uri)
    end

    private
    def self.get(spotify_uri, extras = {})
      uri = URI('http://ws.spotify.com/lookup/1/.json')
      uri.query = URI.encode_www_form(
        extras.merge({ :uri => spotify_uri })
        )
      response = Net::HTTP.get(uri)
      return JSON.parse(response, :symbolize_names => true)
    end

  end

end