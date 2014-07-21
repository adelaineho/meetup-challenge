'use strict';

class MeetupChallengeWinner.Models.Winner extends Backbone.Model
  url: '/api/winner'

  initialize: () ->

  defaults: [
    {
      firstname: "Chris"
      lastname: "Iona"
      twitter: "chrisiona"
      email: "chrisiona@hipagesgroup.com.au"
    },
    {
      firstname: "Adelaine"
      lastname: "Ho"
      twitter: "adelaineho"
      email: "adelaineho@hipages.com.au"
    },
    {
      firstname: "Johanna"
      lastname: "Seton"
      twitter: "jojobee"
      email: "johannaseton@hipages.com.au"
    },
    {
      firstname: "Craig"
      lastname: "Henneberry"
      twitter: "craig"
      email: "craighenneberry@hipages.com.au"
    }
  ]

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
