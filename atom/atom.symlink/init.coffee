path = require 'path'

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()
  if path.extname(editor.getPath()) is '.md'
    editor.setSoftWrap(true)

  if (/standalone.*\.xml/.test(path.basename(editor.getPath())) ||
    path.basename(editor.getPath()) is 'pom.xml' ||
    path.extname(editor.getPath()) is '.java')
    editor.setSoftWrap(false)
    editor.setTabLength(4)
