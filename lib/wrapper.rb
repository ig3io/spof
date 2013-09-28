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

		def all
			@all = true
			self
		end

		def search(text)
			@type ||= :all
			@all ||= false

			result = []
			page = 0
			loop do
				res = case @type
							when :album
								Spof::Search.album(text, page)[:albums]
							when :artist
								Spof::Search.artist(text, page)[:artists]
							when :track
								Spof::Search.track(text, page)[:tracks]
							when :all?
							else
								raise Spof::SpofError, "Invalid search type #{@type}"
							end
				result |= res
				page += 1
				break unless @all
				break if res.empty?
			end

			@type = nil # TODO: reset search type?
			@all = nil

			return result
		end

	end

end