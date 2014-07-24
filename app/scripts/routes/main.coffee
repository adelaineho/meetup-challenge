'use strict';

class MeetupChallengeWinner.Routers.Main extends Backbone.Router

  routes:
    '': 'entry'
    'winner':  'winner'

  entry: =>
    MeetupChallengeWinner.App.Views.EntryForm.render()

  winner: =>
    MeetupChallengeWinner.App.Models.Winner.fetch()
