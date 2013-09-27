Spof
====

Ruby wrapper for the Spotify Search & Lookup API. Under development.

[![Build Status](https://travis-ci.org/ignaciocontreras/spof.png?branch=master)](https://travis-ci.org/ignaciocontreras/spof)

[![Gem Version](https://badge.fury.io/rb/spof.png)](http://badge.fury.io/rb/spof)

[![Stories in Ready](https://badge.waffle.io/ignaciocontreras/spof.png?label=ready)](https://waffle.io/ignaciocontreras/spof)  


Usage
-----

```ruby
require 'spof'
```

### Search


```ruby
r = Spof::Search.artist('nine inch nails') # or album or track

# a page can be specified
r = Spof::Search.track('life on mars', page = 2)
```

### Lookup

```ruby
r = Spof::Lookup.get('spotify:uri:album:xy...z')

# extras can be specified
r = Spof::Lookup.get('spotify:uri:album:xy...z', :track)

# convenience methods Lookup.album/artist/track check the provided extras
r = Spof::Lookup.artist('spotify:uri:artist:ab...c', :trackdetail)
# raises Spof::SpofError, "Illegal extra"
```


For both `Lookup` and `Search` methods, the result contains the parsed JSON response. For now it's like:

```ruby  
r = JSON.parse(spotify_api_json_response, :symbolize_names => true) # hash with symbols as keys
```

License
-------

See LICENSE file.
