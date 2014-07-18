'use strict';

class MeetupChallengeWinner.Models.Entry extends Backbone.Model
  url: '/api/entry'

  initialize: () ->

  defaults: {}

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
