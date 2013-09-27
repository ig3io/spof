require "search"
require "lookup"

module Spof

	class Wrapper

		def initialize(options = {})
			@type = nil
			Spof.config(options)
		end

		def album
			@type = :album
			self
		end

		def artist
			@type = :artist
			self
		end

		def track
			@type = :track
			self
		end

		def search(text)
			if [:album, :artist, :track].include?(@type)
				Spof::Search.send(@type, text)
			else
				raise Spof::SpofError, "Invalid search type"
			end
		end

	end

end