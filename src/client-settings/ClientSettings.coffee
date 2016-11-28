Component = require "../component/Component"
ClientSettingsSettings = require "./ClientSettingsSettings"

###
Stores application-wide settings to configure different components.
###
class ClientSettings extends Component

  @identifier: "Client Settings"

  @settings: ClientSettingsSettings

  ###*
  Stores application-wide settings to configure different components.
  @constructor
  ###
  constructor: ->

module.exports = ClientSettings
