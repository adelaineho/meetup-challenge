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

      @model.set(data) #, {silent: true})

    'submit form': (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.save({wait: true})

  saved: (e,f,g) ->
    console.log "SAVED", e,f,g
    @$el.find('p.h3.text-info').html("Thanks!  You're in the draw to win.")
    @$el.find('p.text-muted.lead').remove()
    @$el.find('form').remove()

  initialize: () ->
    #@listenTo @model, 'change', @render, @
    @listenTo @model, 'sync', @saved, @

  render: () ->
    @$el.html @template(@model.toJSON())
    @$el.find('input:first').focus()
