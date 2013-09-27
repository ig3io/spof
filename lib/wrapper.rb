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

		def all(num)
			@all = true
		end

		def search(text)
			@type ||= :all
			@all ||= false

			continue = true

			result = []
			while continue
				res = case @type
							when :album
								Spof::Search.album(text)[:albums]
							when :artist
								Spof::Search.artist(text)[:artists]
							when :track
								Spof::Search.track(text)[:tracks]
							when :all?
							else
								raise Spof::SpofError, "Invalid search type #{@type}"
							end
				result |= res
				if res.empty?
					continue = false
				else
					continue = @all
				end
			end

			@type = nil # TODO: reset search type?
			@all = nil

			return result
		end

	end

end