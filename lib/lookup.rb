module Spof

  module Lookup

    def self.album(spotify_uri, *extras)
      legal_extras = [:track, :trackdetail]
      extras.each do |e|
        raise SpofError, "Illegal extra" if not legal_extras.include?(e)
      end
      return get(spotify_uri, *extras)
    end

    def self.artist(spotify_uri, *extras)
      legal_extras = [:album, :albumdetail]
      extras.each do |e|
        raise SpofError, "Illegal extra" if not legal_extras.include?(e)
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
      return uri.to_s if Spof.testing?
      return JSON.parse(response, :symbolize_names => true)
    end

  end

end