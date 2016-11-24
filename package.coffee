exports.internalName = internalName = "@inbox-client/internal"
exports.distName = distName = "inbox-client"

exports.dependencies = dependencies =
  # Dependencies used to manage the inbox-client-internal repository
  dev:
    mocha: "^3.1.2"
    chai: "^3.5.0"
  # Dependencies used to build inbox-client distributions
  build:
    bluebird: "^3.4.6"
    "coffee-script": "^1.11.1"
    "fs.extra": "^1.3.2"
    "child-process-promise": "^2.2.0"
  # Dependencies used to run inbox-client
  core: {}

exports.core = core =
  version: "0.0.0"
  description: "Inbox Client is an extendable and flexible email client framework written with cross-platform use in mind."
  repository:
    type: "git"
    url: "git+https://github.com/inbox-client/inbox-client-internal.git"
  author: "Ryan Leonard (http://ryanleonard.us)"
  license: "MIT"
  bugs:
    url: "https://github.com/inbox-client/inbox-client-internal/issues"
  homepage: "https://github.com/inbox-client/inbox-client-internal#readme"

exports.internal = internal = Object.assign {}, {name: internalName}, core,
  dependencies: Object.assign {}, dependencies.build, dependencies.core
  devDependencies: dependencies.dev
  main: "Cakefile"
  scripts:
    test: "mocha --compilers coffee:coffee-script/register"

exports.dist = dist = Object.assign {}, {name: distName}, core,
  dependencies: dependencies.core
  scripts:
    test: "echo \"Error: no test specified\" && exit 1"
  main: "InboxClient.js"
