{View} = require 'atom'

module.exports =
class OpenTerminalHereView extends View
  @content: ->
    @div class: 'open terminal overlay from-top', =>
      @div "The OpenTerminalHere package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "open-terminal-here:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "OpenTerminalHere was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
