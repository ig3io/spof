require_relative '../sputnik/sputnik'
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

  def test_lookup_get_album_request_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:album:40pUoRK9pOn3tMoXY02fUB'
    real = Sputnik::Lookup.get('spotify:album:40pUoRK9pOn3tMoXY02fUB')
    assert expected, real
  end

  def test_lookup_get_artist_request_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy'
    real = Sputnik::Lookup.get('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy')
    assert expected, real
  end

  def test_lookup_get_track_request_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:track:2Z9vxEQVzEdj5Ph9JLUzDo'
    real = Sputnik::Lookup.get('spotify:track:2Z9vxEQVzEdj5Ph9JLUzDo')
    assert expected, real
  end

  def test_lookup_album_request_no_extras_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:album:40pUoRK9pOn3tMoXY02fUB'
    real = Sputnik::Lookup.album('spotify:album:40pUoRK9pOn3tMoXY02fUB')
    assert expected, real
  end

  def test_lookup_artist_request_no_extras_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy'
    real = Sputnik::Lookup.artist('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy')
    assert expected, real
  end

  def test_lookup_track_request_no_extras_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:track:2Z9vxEQVzEdj5Ph9JLUzDo'
    real = Sputnik::Lookup.track('spotify:track:2Z9vxEQVzEdj5Ph9JLUzDo')
    assert expected, real
  end

  def test_lookup_album_request_track_extra_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:album:40pUoRK9pOn3tMoXY02fUB&extras=track'
    real = Sputnik::Lookup.album('spotify:album:40pUoRK9pOn3tMoXY02fUB', :track)
    assert expected, real
  end

  def test_lookup_album_request_trackdetail_extra_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:album:40pUoRK9pOn3tMoXY02fUB&extras=trackdetail'
    real = Sputnik::Lookup.album('spotify:album:40pUoRK9pOn3tMoXY02fUB', :trackdetail)
    assert expected, real
  end

  def test_lookup_artist_request_album_extra_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy&extras=album'
    real = Sputnik::Lookup.artist('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy', :album)
    assert expected, real
  end

  def test_lookup_artist_request_albumdetail_extra_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy&extras=albumdetail'
    real = Sputnik::Lookup.artist('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy', :albumdetail)
    assert expected, real
  end

  def test_lookup_album_request_both_extras_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:album:40pUoRK9pOn3tMoXY02fUB&extras=track,trackdetail'
    real = Sputnik::Lookup.album('spotify:album:40pUoRK9pOn3tMoXY02fUB', :track, :trackdetail)
    assert expected, real
  end

  def test_lookup_artist_request_both_extras_ok
    expected = 'http://ws.spotify.com/lookup/1/?uri=spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy&extras=album,albumdetail'
    real = Sputnik::Lookup.artist('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy', :album, :albumdetail)
    assert expected, real
  end

  def test_lookup_album_illegal_extra_error

    assert_raise (Sputnik::SputnikError) {
      Sputnik::Lookup.album('spotify:album:40pUoRK9pOn3tMoXY02fUB', :track, :illegal)
    }

  end

  def test_lookup_artist_illegal_extra_error
    assert_raise (Sputnik::SputnikError) {
      Sputnik::Lookup.artist('spotify:artist:0oSGxfWSnnOXhD2fKuz2Gy', :album, :illegal)
    }
  end

end