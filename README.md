## RaveBot API

Check out [RaveBot](https://github.com/KyleMacPherson/RaveBot) here!

An API to serve up party and song information to be consumed by the RaveBot. Hosted [here](https://stormy-bastion-7671.herokuapp.com).

Users choose a party name and create a party, other users can then join the party and add songs to the playlist, along with messages and their name if they wish. Songs are generated at random from a specified party's playlist.

__Breakdown of models:__

Party
Song

__Routes:__

post '/partys' - Create new party
get '/partys/:name' = Join existing party
post '/songs' = Add a new song
get 'songs/random/:party_name' = Get a random song from the specified party's playlist

__Tools:__

Testing: Racktest

Code: Ruby on Rails

Other: PostgreSQL, Rack-Cors

__Tests:__

_Users_
  + post request to /partys
      + with party name
        + creates new party if party name is neither blank nor already taken
        + if party name is already taken it returns an error
        + if party name blank it returns an error

_Songs_
  + post request to /songs
    + adds song to party if party name is valid
    + does not add song to party if party name is invalid
    +  does not add a song to party unless url field is completed
  + get request to /songs/random/:party_name
    +  returns one of the songs from specified party
    +  returns error if specified party does not exist

_Party_
  + should have many songs

_Song_
  + should belong to party

Finished in 0.15841 seconds (files took 1.5 seconds to load)
10 examples, 0 failures
