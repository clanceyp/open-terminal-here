{WorkspaceView} = require 'atom'
OpenTerminalHere = require '../lib/open-terminal-here'

{View} = require 'atom'

module.exports =
class OpenTerminalHere extends View
  @content: ->
    @div class: 'ascii-art-test overlay from-top', =>
      @div "The AsciiArtTest package is Alive! It's ALIVE!", class: "message"

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
