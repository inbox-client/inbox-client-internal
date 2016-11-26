// Generated by CoffeeScript 1.11.1
var ClientSettings, Component,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Component = require("../component/Component");


/*
Stores application-wide settings to configure different components.
 */

ClientSettings = (function(superClass) {
  extend(ClientSettings, superClass);


  /**
  Stores application-wide settings to configure different components.
  @constructor
   */

  function ClientSettings() {}

  return ClientSettings;

})(Component);

module.exports = ClientSettings;