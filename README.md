RaveBot API

Check out [RaveBot](https://github.com/KyleMacPherson/RaveBot) here!

An API to serve up party and song information to be consumed by the RaveBot. Hosted [here](https://stormy-bastion-7671.herokuapp.com).

Users choose a party name and create a party, other users can then join the party and add songs to the playlist, along with messages and their name if they wish. Songs are generated at random from a specified party's playlist.

Breakdown of models:

Party
Song

Routes:

post '/partys' - Create new party
get '/partys/:name' = Join existing party
post '/songs' = Add a new song
get 'songs/random/:party_name' = Get a random song from the specified party's playlist

Tools:

Testing: Racktest

Code: Ruby on Rails

Other: PostgreSQL, Rack-Cors

Tests:
