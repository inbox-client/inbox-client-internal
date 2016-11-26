Component = require "../component/Component"

###
Stores application-wide settings to configure different components.
###
class ClientSettings extends Component

  @identifier: "Client Settings"

  ###*
  Stores application-wide settings to configure different components.
  @constructor
  ###
  constructor: ->

module.exports = ClientSettings
