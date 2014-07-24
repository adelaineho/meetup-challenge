'use strict';

class MeetupChallengeWinner.Views.Winner extends Backbone.View

  template: JST['app/scripts/templates/winner.hbs']

  lastShownNum: 0

  templateData: ->
    newdata = []
    items = @model.get('Items')
    total = @model.get('Count')

    for item,i in items
      newitem =
        index: i
        firstname: item.firstname.S if item.firstname?
        lastname: item.lastname.S if item.lastname?
        twitter: item.twitter.S if item.twitter?
        seg_rotation: Math.round((360/total)*i)
        show_rotation: 
          if ((total-i)%2 == 0) 
            Math.round(((360/total)*(total-i))+181) 
          else 
            Math.round(((360/total)*(total-i))-179)

      newdata.push newitem
    
    newdata 

  tagName: 'div'

  el: '#main'

  events: 
    'click #lever_down': (e) ->
      current_target = $(e.currentTarget)
      @spinDaWheel(current_target)
      setTimeout((=> @resetHandle(current_target)), 5500)

  spinDaWheel: (current_target) ->
    rnd = Math.floor(Math.random() * @model.get('Count'))
    if @lastShownNum is rnd
      @spinDaWheel
    else
      #change the lever image
      current_target.addClass('hidden')
      $('#lever_up').removeClass('hidden')
      #animate wheel spin
      $('#wheel').removeAttr('class').addClass('show_'+rnd)
      @lastShownNum = rnd

  resetHandle: (current_target) ->
    #change lever image
    $('#lever_up').addClass('hidden')
    current_target.removeClass('hidden')  

  initialize: () ->
    @listenTo @model, 'change', @render, @