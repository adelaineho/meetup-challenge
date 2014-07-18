# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Main Router', ->
  beforeEach ->
    @MainRouter = new MeetupChallengeWinner.Routers.Main();

  it 'index route', ->

