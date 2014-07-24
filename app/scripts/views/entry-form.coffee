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

      if @validated()
         @model.save({wait: true})


  validated: ->
    count = 0

    fn = @$el.find('input[name=firstname]')
    ln = @$el.find('input[name=lastname]')
    em = @$el.find('input[name=email]')


    @$el.find('.has-error').each(->
      $(@).removeClass('has-error')
    )

    if fn.val().length < 2
       fn.parent().addClass('has-error')
       count++

    if ln.val().length < 2
       ln.parent().addClass('has-error')
       count++

    if !em.val().match(/[^@]+@[^@]+\.[a-zA-Z]{2,6}/)
       em.parent().addClass('has-error')
       count++

    !!(!count)
       

  saved: (e,f,g) ->
    @$el.find('p.h3.text-info').html("Thanks!  You're in the draw to win.")
    @$el.find('p.text-muted.lead').remove()
    @$el.find('form').remove()


  initialize: () ->
    #@listenTo @model, 'change', @render, @
    @listenTo @model, 'sync', @saved, @


  render: () ->
    @$el.html @template(@model.toJSON())
    @$el.find('input:first').focus()
