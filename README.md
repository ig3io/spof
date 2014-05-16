Spof
====

Ruby wrapper for the Spotify Search & Lookup API. Under development.

[![Build Status](https://travis-ci.org/iconpin/spof.png?branch=master)](https://travis-ci.org/iconpin/spof)

[![Gem Version](https://badge.fury.io/rb/spof.png)](http://badge.fury.io/rb/spof)

[![Stories in Ready](https://badge.waffle.io/iconpin/spof.png?label=ready)](https://waffle.io/iconpin/spof)


Usage
-----

```ruby
require 'spof'
```

### Search


```ruby
Spof::Search.artist('nine inch nails') # or album or track
```

Returns:

```ruby
{
  :info => {
    :num_results => 1,
    :limit => 100,
    :offset => 0,
    :query => "nine inch nails",
    :type => "artist",
    :page => 1
    },
  :artists => [
    { :href =>"spotify:artist:0X380XXQSNBYuleKzav5UO", :name => "Nine Inch Nails", :popularity => "0.64"}
    ]
}
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

### Wrapper

```ruby
w = Spof::Wrapper.new
w.artist.search('nine inch nails') # album/artist/track. First page album results
# => [{:href=>"spotify:artist:0X380XXQSNBYuleKzav5UO", :name=>"Nine Inch Nails", :popularity=>"0.64"}]
w.all.album.search('nine inch nails')
# => list of all found albums
```

License
-------

See LICENSE file.
