require_relative 'test_helper'
require 'spof'
require 'test/unit'


class TestWrapper < Test::Unit::TestCase

  def setup
    Spof.config({
      :testing => true
      })
  end

  def test_helper_methods_return_self
    assert_nothing_thrown do
      w = Spof::Wrapper.new
      w.album.artist.track
      w.artist.track.album
    end
  end


end
