path = require 'path'
shell = require 'shell'

_ = require 'underscore-plus'
{$, BufferedProcess, ScrollView} = require 'atom'

fs = require 'fs-plus'

module.exports =
  activate: ->
    atom.workspaceView.command "open-terminal-here:open-terminal-editor", => @openTerminalEditor()
    atom.workspaceView.command "open-terminal-here:open-terminal-menu", => @openTerminalMenu()

  openTerminalMenu: ->
      @openTerminalEditor()

  openTerminalEditor: ->
    editor = atom.workspace.getActivePaneItem()
    file = editor?.buffer.file
    console.log file?.path
    a = file?.path
    b = a.split("/")
    c = b.pop()
    d = b.join("/")
    pathToOpen = d
    isFile = false
    {command, args, label} = @commandForPath(pathToOpen, isFile)

    errorLines = []
    stderr = (lines) -> errorLines.push(lines)
    exit = (code) ->
      if code isnt 0
        atom.confirm
          message: "Opening #{command} #{args} failed"
          detailedMessage: errorLines.join('\n')
          buttons: ['OK']

    new BufferedProcess({command, args, stderr, exit})

  commandForPath: (pathToOpen, isFile) ->
    switch process.platform
      when 'darwin'
        command: 'open'
        args: ['-a','Terminal', pathToOpen]
      when 'win32'
        # TODO
      else
        # TODO
