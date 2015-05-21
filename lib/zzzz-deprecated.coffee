ZzzzDeprecatedView = require './zzzz-deprecated-view'
{CompositeDisposable} = require 'atom'

module.exports = ZzzzDeprecated =
  zzzzDeprecatedView: null
  modalPanel: null
  subscriptions: null

  configDefaults:
    cats: 'ok'

  activate: (state) ->
    atom.workspace.getActiveEditor()
    @zzzzDeprecatedView = new ZzzzDeprecatedView(state.zzzzDeprecatedViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @zzzzDeprecatedView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'zzzz-deprecated:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @zzzzDeprecatedView.destroy()

  serialize: ->
    zzzzDeprecatedViewState: @zzzzDeprecatedView.serialize()

  toggle: ->
    console.log 'ZzzzDeprecated was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
