'use strict';

class MeetupChallengeWinner.Routers.Main extends Backbone.Router

  routes:
    '': 'entry'

  entry: ->
    console.log "ENTRY"
    MeetupChallengeWinner.App.Views.EntryForm.render()

  winner: ->
    console.log "WINNER"
    MeetupChallengeWinner.App.Views.Winner.render()
