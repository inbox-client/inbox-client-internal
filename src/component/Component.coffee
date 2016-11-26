###
Abstract definition of a modular component.
###
class Component

  ###*
  @property {String} a unique identifier for this component.
    An NPM namespace or reverse-domain-name works well.
  ###
  @identifier: "inbox-client/Component"

  ###*
  @property {ComponentSettings} defines settings that can be configured for instances of this component.
  ###
  @settings: null

  ###*
  Abstract definition of a modular component.
  @constructor
  ###
  constructor: ->

module.exports = Component
