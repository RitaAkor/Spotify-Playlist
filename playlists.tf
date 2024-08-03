resource "spotify_playlist" "NaijaPraise" {
  name = "NaijaPraise"
  tracks = ["6PGTBSagHYqLOMbuCjaI6H"]
}

data "spotify_search_track" "anendlessocean" {
  artist = "anendlessocean"
  limit = 10
}

resource "spotify_playlist" "ForHeaven" {
    name = "For Heaven"
    tracks = [data.spotify_search_track.anendlessocean.tracks[1].id,
    data.spotify_search_track.anendlessocean.tracks[2].id,
    data.spotify_search_track.anendlessocean.tracks[3].id]
}

