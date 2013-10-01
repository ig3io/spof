module Spof

  module Lookup

    def self.album(spotify_uri, *extras)
      check_extras(extras, [:track, :trackdetail])
      return get(spotify_uri, *extras)
    end

    def self.artist(spotify_uri, *extras)
      check_extras(extras,  [:album, :albumdetail])
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

    private
    def self.check_extras(extras, legal_extras)
      extras.each do |e|
        raise Spof::SpofError, "Illegal extra" if not legal_extras.include?(e)
      end
    end

  end

end