require "spof/version"
require "search"
require "lookup"
require "wrapper"

require "net/http"
require "json"

module Spof

  @@testing = false

  def self.config(options = {})
    @@testing = options[:testing] || false
  end

  def self.testing?
    @@testing
  end

  class SpofError < StandardError
  end

end