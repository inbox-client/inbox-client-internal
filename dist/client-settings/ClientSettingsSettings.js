// Generated by CoffeeScript 1.11.1
var ClientSettingsSettings, ComponentSettings,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

ComponentSettings = require("../component/ComponentSettings");

ClientSettingsSettings = (function(superClass) {
  extend(ClientSettingsSettings, superClass);

  function ClientSettingsSettings() {
    return ClientSettingsSettings.__super__.constructor.apply(this, arguments);
  }

  return ClientSettingsSettings;

})(ComponentSettings);

module.exports = ClientSettingsSettings;
