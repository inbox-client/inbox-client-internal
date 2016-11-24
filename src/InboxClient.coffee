###
Component configuration.  Will be replaced in the distribution with the chosen components passed to the build script.
###

$settings = null

###
Interface passed to {InboxClient} to provide configuration.
###
class InboxClientOptions
  ###*
  Interface passed to InboxClient to provide configuration.
  @see {InboxClient}
  @constructor
  ###
  constructor: ->
    throw new TypeError "InboxClientOptions is a type definition, and shouldn't be constructed."

  ###*
  @property [Array<Function>] An array of {InboxClientSettings} to use
  @type [Array<Function>]
  @see {InboxClientSettings}
  ###
  settings: null

###
The entrypoint for InboxClient.
###
class InboxClient
  ###*
  The entrypoint for InboxClient.
  @param {InboxClientOptions} opts Options to pass to InboxClient.
  @constructor
  ###
  constructor: (opts) ->
    opts ?= {}

module.exports = InboxClient
