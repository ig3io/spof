require '../sputnik/sputnik'
require 'test/unit'


class TestBasic < Test::Unit::TestCase

  def setup
    Sputnik.config({
      :testing => true
      })
  end

  def test_search_album_request_ok
    expected = 'http://ws.spotify.com/search/1/album.json?q=nine+inch+nails&page=1'
    actual = Sputnik::Search.album('nine inch nails')
    assert_equal expected, actual
  end

  def test_search_artist_request_ok
    expected = 'http://ws.spotify.com/search/1/artist.json?q=david+bowie&page=1'
    actual = Sputnik::Search.artist('david bowie')
    assert_equal expected, actual
  end

  def test_search_track_request_ok
    expected = 'http://ws.spotify.com/search/1/track.json?q=life+on+mars&page=1'
    actual = Sputnik::Search.track('life on mars')
    assert_equal expected, actual
  end

  def test_lookup_album_request_ok
    assert false
  end

  def test_lookup_artist_request_ok
    assert false
  end

  def test_lookup_artist_request_ok
    assert false
  end

end