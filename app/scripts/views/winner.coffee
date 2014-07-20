'use strict';

class MeetupChallengeWinner.Views.Winner extends Backbone.View

  template: JST['app/scripts/templates/winner.hbs']

  tagName: 'div'

  el: '#main'

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
