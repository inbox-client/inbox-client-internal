Promise = require "bluebird"
fs = Promise.promisifyAll require "fs.extra"
exec = (args...) ->
  execAsync = require("child-process-promise").exec
  execAsync args...
    .catch (err) ->
      console.log err.stdout
      console.log err.stderr
      throw err
    .then (res) ->
      console.log res.stdout
      console.log res.stderr

option "-d", "--dist [DIR]", "Determine the directory that distribution files are installed into.  Defaults to ./dist/"

task "internal:package.json", "Build a package.json file for inbox-client-internal", (opts) ->
  packageJSON opts, "internal", "#{__dirname}/package.json"

task "internal:all", "Run all commands to prepare internal files", (opts) ->
  internalAll opts

task "dist:compile", "Compile the distribution source", (opts) ->
  compileDist opts

task "dist:package.json", "Build a package.json file for inbox-client", (opts) ->
  distClean opts
    .then ->
      packageJSON opts, "dist", "#{dist opts}/package.json"

task "dist:all", "Run all commands to prepare the distribution files", (opts) ->
  distAll opts

task "all", "Run all repository update commands.  Useful to ensure all files are updated when committing.", (opts) ->
  Promise.join internalAll(opts), distAll(opts)

internalAll = (opts) ->
  packageJSON opts, "internal", "#{__dirname}/package.json"

distAll = (opts) ->
  distClean opts
    .then ->
      Promise.join compileDist(opts), packageJSON(opts, "dist", "#{dist opts}/package.json")

###
@param [object] opts the options passed to the Cakefile
@return [string] the directory containing the distribution files
###
dist = (opts) ->
  opts.dist ? "#{__dirname}/dist/"

###
Clean the distribution directory to ensure a clean build - remove the directory if it exists, then create an empty
directory.
@param [object] opts the options passed to the Cakefile
@return {Promise} resolves when directory clean
###
distClean = (opts) ->
  fs.rmrfAsync dist opts
    .then ->
      fs.mkdirpAsync dist opts

###
Compile the distribution source files.
@param [object] opts the options passed to the Cakefile
@return {Promise} resolves when files compiled.
###
compileDist = (opts) ->
  exec "$(npm bin)/coffee --compile --bare --output #{dist opts} src/"

###
Write `package.json` by evaluating `package.coffee`.
@param [object] opts the options passed to the Cakefile
@param [string] type a section in `package.coffee` to output.
@param [string] path the path to write `package.json` to
@return {Promise} resolves when `package.json` written
###
packageJSON = (opts, type, path) ->
  pkg = require("./package.coffee")[type]
  fs.writeFileAsync path, JSON.stringify pkg, null, 2
