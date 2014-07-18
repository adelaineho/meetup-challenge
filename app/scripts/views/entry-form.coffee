'use strict';

class MeetupChallengeWinner.Views.EntryForm extends Backbone.View

  template: JST['app/scripts/templates/entry-form.hbs']

  tagName: 'div'

  el: '#main'

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
