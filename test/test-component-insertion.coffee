Promise = require "bluebird"
fs = Promise.promisifyAll require "fs.extra"
path = require "path"
chai = require "chai"
should = chai.should()
{exec} = require "child-process-promise"

###
Test that components are properly inserted in output distributions.
###
describe "Component Insertion", ->

  describe "Source Files", ->

    it "should include a placeholder", ->
      fs.readFileAsync "#{__dirname}/../src/InboxClient.coffee", "utf8"
        .then (src) ->
          src.should.include "$settings = null"

  describe "Default Settings are Inserted", ->

    before ->
      exec "$(npm bin)/cake --dist \"#{__dirname}/component-insertion-default\" dist:all",
        cwd: path.resolve "#{__dirname}/../"

    after ->
      fs.rmrfAsync "#{__dirname}/component-insertion-default"

    it "should point to the local ClientSettings", ->
      fs.readFileAsync "#{__dirname}/component-insertion-default/InboxClient.js", "utf8"
        .then (src) ->
          src.should.include "$settings = [require(\"./ClientSettings\")];"

  describe "Custom Settings are Inserted", ->

    before ->
      settings = '--settings "LocalSettings,RemoteSettings"'
      exec "$(npm bin)/cake --dist \"#{__dirname}/component-insertion-custom\" #{settings} dist:all",
        cwd: path.resolve "#{__dirname}/../"

    after ->
      fs.rmrfAsync "#{__dirname}/component-insertion-custom"

    it "should point to given ClientSettings", ->
      fs.readFileAsync "#{__dirname}/component-insertion-custom/InboxClient.js", "utf8"
        .then (src) ->
          src.should.include "$settings = [require(\"LocalSettings\"), require(\"RemoteSettings\")];"
