# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Winner View', ->
  beforeEach ->
    @WinnerView = new MeetupChallengeWinner.Views.Winner();
