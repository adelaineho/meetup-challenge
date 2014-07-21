'use strict';

class MeetupChallengeWinner.Views.EntryForm extends Backbone.View

  template: JST['app/scripts/templates/entry-form.hbs']

  tagName: 'div'

  el: '#main'

  events:
    'change input': (e) ->
      obj = $(e.currentTarget)
      data = {}
      data[obj.attr('name')] = obj.val()

      @model.set(data, {silent: true})

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())
