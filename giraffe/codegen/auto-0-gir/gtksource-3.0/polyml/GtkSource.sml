structure GtkSource : GTK_SOURCE =
  struct
    local
      open PolyMLFFI
    in
      val completionErrorQuark_ = call (load_sym libgtksourceview "gtk_source_completion_error_quark") (PolyMLFFI.cVoid --> GLibQuark.PolyML.cVal)
    end
    structure BracketMatchType = GtkSourceBracketMatchType
    structure BufferClass = GtkSourceBufferClass
    structure CompletionClass = GtkSourceCompletionClass
    structure CompletionActivation = GtkSourceCompletionActivation
    structure CompletionContextClass = GtkSourceCompletionContextClass
    structure CompletionError = GtkSourceCompletionError
    exception CompletionError = GtkSourceCompletionError
    structure CompletionInfoClass = GtkSourceCompletionInfoClass
    structure CompletionItemClass = GtkSourceCompletionItemClass
    structure CompletionProposalClass = GtkSourceCompletionProposalClass
    structure CompletionProviderClass = GtkSourceCompletionProviderClass
    structure CompletionWordsClass = GtkSourceCompletionWordsClass
    structure DrawSpacesFlags = GtkSourceDrawSpacesFlags
    structure GutterClass = GtkSourceGutterClass
    structure GutterRendererClass = GtkSourceGutterRendererClass
    structure GutterRendererAlignmentMode = GtkSourceGutterRendererAlignmentMode
    structure GutterRendererState = GtkSourceGutterRendererState
    structure LanguageClass = GtkSourceLanguageClass
    structure LanguageManagerClass = GtkSourceLanguageManagerClass
    structure MarkClass = GtkSourceMarkClass
    structure MarkAttributesClass = GtkSourceMarkAttributesClass
    structure PrintCompositorClass = GtkSourcePrintCompositorClass
    structure SmartHomeEndType = GtkSourceSmartHomeEndType
    structure StyleClass = GtkSourceStyleClass
    structure StyleSchemeClass = GtkSourceStyleSchemeClass
    structure StyleSchemeManagerClass = GtkSourceStyleSchemeManagerClass
    structure UndoManagerClass = GtkSourceUndoManagerClass
    structure ViewClass = GtkSourceViewClass
    structure ViewGutterPosition = GtkSourceViewGutterPosition
    structure Buffer = GtkSourceBuffer
    structure Completion = GtkSourceCompletion
    structure CompletionContext = GtkSourceCompletionContext
    structure CompletionInfo = GtkSourceCompletionInfo
    structure CompletionItem = GtkSourceCompletionItem
    structure CompletionProposal = GtkSourceCompletionProposal
    structure CompletionProvider = GtkSourceCompletionProvider
    structure CompletionWords = GtkSourceCompletionWords
    structure Gutter = GtkSourceGutter
    structure GutterRenderer = GtkSourceGutterRenderer
    structure GutterRendererPixbufClass = GtkSourceGutterRendererPixbufClass
    structure GutterRendererTextClass = GtkSourceGutterRendererTextClass
    structure Language = GtkSourceLanguage
    structure LanguageManager = GtkSourceLanguageManager
    structure Mark = GtkSourceMark
    structure MarkAttributes = GtkSourceMarkAttributes
    structure PrintCompositor = GtkSourcePrintCompositor
    structure Style = GtkSourceStyle
    structure StyleScheme = GtkSourceStyleScheme
    structure StyleSchemeManager = GtkSourceStyleSchemeManager
    structure UndoManager = GtkSourceUndoManager
    structure View = GtkSourceView
    structure GutterRendererPixbuf = GtkSourceGutterRendererPixbuf
    structure GutterRendererText = GtkSourceGutterRendererText
    val COMPLETION_CAPABILITY_AUTOMATIC = "standard::automatic"
    val COMPLETION_CAPABILITY_INTERACTIVE = "standard::interactive"
    fun completionErrorQuark () = (I ---> GLibQuark.FFI.fromVal) completionErrorQuark_ ()
  end
