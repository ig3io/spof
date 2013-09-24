require 'net/http'
require 'json'


module Sputnik

  @@testing = false

  def self.config(options = {})
    @@testing = options[:testing] || false
  end

  def self.testing?
    @@testing
  end

  class SputnikError < StandardError
  end

  
  module Search

    def self.album(text, page = 1)
      url = 'http://ws.spotify.com/search/1/album.json'
      return get_response(url, text)
    end

    def self.artist(text, page = 1)
      url = 'http://ws.spotify.com/search/1/artist.json'
      return get_response(url, text)
    end

    def self.track(text, page = 1)
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
      return uri.to_s if Sputnik.testing?
      response = Net::HTTP.get(uri)
      return JSON.parse(response, :symbolize_names => true)
    end

  end

  module Lookup

    def self.album(spotify_uri, *extras)
      legal_extras = [:track, :trackdetail]
      extras.each do |e|
        raise SputnikError, "Illegal extra" if not legal_extras.include?(e)
      end
      return get(spotify_uri, *extras)
    end

    def self.artist(spotify_uri, *extras)
      legal_extras = [:album, :albumdetail]
      extras.each do |e|
        raise SputnikError, "Illegal extra" if not legal_extras.include?(e)
      end
      return get(spotify_uri, *extras)
    end

    def self.track(spotify_uri)
      return get(spotify_uri)
    end

    def self.get(spotify_uri, *extras)
      uri = URI('http://ws.spotify.com/lookup/1/.json')
      uri.query = URI.encode_www_form({
        :uri => spotify_uri,
        :extras => extras
        })
      response = Net::HTTP.get(uri)
      return uri.to_s if Sputnik.testing?
      return JSON.parse(response, :symbolize_names => true)
    end

  end

end