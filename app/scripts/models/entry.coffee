'use strict';

class MeetupChallengeWinner.Models.Entry extends Backbone.Model
  url: '/api/entry'

  initialize: () ->

  defaults: {}

  validate: (attrs, options) ->
    emailPattern = /// ^ #begin of line
    ([\w.-]+)         #one or more letters, numbers, _ . or -
    @                 #followed by an @ sign
    ([\w.-]+)         #then one or more letters, numbers, _ . or -
    \.                #followed by a period
    ([a-zA-Z.]{2,6})  #followed by 2 to 6 letters or periods
    $ ///i            #end of line and ignore case
 
    if not attrs.email.match emailPattern
      'Email is invalid'
    if not attrs.firstname
      'Please put in first name' 
    if not attrs.last
      'We will need your last name'  

  parse: (response, options) ->
    response
