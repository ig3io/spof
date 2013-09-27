require 'spof'
require 'test/unit'

class TestBasicWrapper < Test::Unit::TestCase

  def setup
    @w = Spof::Wrapper.new :testing => false # testing actual responses!
  end

  def test_search_album_response
    expected = Spof::Search.album('space oddity')[:albums]
    real = @w.album.search('space oddity')
    assert_equal expected, real
  end

  def test_search_artist_response
    expected = Spof::Search.artist('david bowie')[:artists]
    real = @w.artist.search('david bowie')
    assert_equal expected, real
  end

  def test_search_track_response
    expected = Spof::Search.track('life on mars')[:tracks]
    real = @w.track.search('life on mars')
    assert_equal expected, real
  end

end