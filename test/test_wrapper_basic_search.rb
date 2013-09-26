require 'spof'
require 'test/unit'

class TestBasicWrapper < Test::Unit::TestCase

  def setup
    @w = Spof::Wrapper.new :testing => true
  end

  def test_search_album_request
    expected = Spof::Search.album('space oddity')
    real = @w.album.search('space oddity')
    assert_equal expected, real
  end

  def test_search_artist_request
    expected = Spof::Search.artist('david bowie')
    real = @w.artist.search('david bowie')
    assert_equal expected, real
  end

  def test_search_track_request
    expected = Spof::Search.track('life on mars')
    real = @w.track.search('life on mars')
    assert_equal expected, real
  end

end