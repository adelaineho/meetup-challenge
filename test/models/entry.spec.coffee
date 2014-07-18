# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Entry Model', ->
  beforeEach ->
    @EntryModel = new MeetupChallengeWinner.Models.Entry();
