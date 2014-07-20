'use strict';

class MeetupChallengeWinner.Models.Winner extends Backbone.Model
  url: '/api/winner'

  initialize: () ->

  defaults: {}

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
