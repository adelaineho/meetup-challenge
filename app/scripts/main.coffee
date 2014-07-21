window.MeetupChallengeWinner =
  App:
    Models: {}
    Collections: {}
    Views: {}
    Routers: {}
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    @App.Routers.Main = new @Routers.Main()

    @App.Models.Entry = new @Models.Entry()
    @App.Views.EntryForm = new @Views.EntryForm({model: @App.Models.Entry})

    @App.Models.Winner = new @Models.Winner()
    @App.Views.Winner = new @Views.Winner({model: @App.Models.Winner})

    Backbone.history.start({pushState: true})
  
$ ->
  'use strict'
  MeetupChallengeWinner.init()
