###
Defines the structure of properties that can be set for this component.
###
class ComponentSettings

  ###*
  @property {Field} defines fields that can be used to configure a component.
  ###
  @fields = {}

  ###*
  Defines the structure of properties that can be set for this component.
  @constructor
  ###
  constructor: ->
    @initFields()

  ###*
  Create an instance of each field in the settings.
  @return {ComponentSettings} for chaining
  ###
  initFields: ->
    @fields = {}
    for field, ExtendedField in @constructor.fields
      @fields[field] = new ExtendedField()
    @

module.exports = ComponentSettings
