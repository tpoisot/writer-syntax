fs = require 'fs'
path = require 'path'

module.exports =

  apply: ->

    ltheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(240, 3%, 97%);
    @writer-fg: hsl(240, 3%, 14%);

    """

    dtheme = """
    // NOTE these colors have been auto-generated
    // edit the lib/config.coffee to change
    @writer-bg: hsl(240, 3%, 14%);
    @writer-fg: hsl(240, 3%, 97%);

    """
    updateColor = () ->
      themeVariant = atom.config.get "writer-syntax.themeVariant"
      path = "#{__dirname}/../styles/background.less"
      if themeVariant is 'Light'
        fs.writeFileSync path, ltheme
      else
        fs.writeFileSync path, dtheme

    # When starting
    updateColor()

    # When config changes
    atom.config.onDidChange 'writer-syntax.themeVariant', updateColor
