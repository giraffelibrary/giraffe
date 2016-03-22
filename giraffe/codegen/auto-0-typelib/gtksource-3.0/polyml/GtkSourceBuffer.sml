structure GtkSourceBuffer :>
  GTK_SOURCE_BUFFER
    where type 'a class = 'a GtkSourceBufferClass.class
    where type 'a mark_class = 'a GtkSourceMarkClass.class
    where type bracket_match_type_t = GtkSourceBracketMatchType.t
    where type 'a language_class = 'a GtkSourceLanguageClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    where type 'a undo_manager_class = 'a GtkSourceUndoManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_buffer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_buffer_new") (GtkTextTagTableClass.PolyML.cOptPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val newWithLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_new_with_language") (GtkSourceLanguageClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val backwardIterToSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_backward_iter_to_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val beginNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_buffer_begin_not_undoable_action") (GtkSourceBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val canRedo_ = call (load_sym libgtksourceview "gtk_source_buffer_can_redo") (GtkSourceBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canUndo_ = call (load_sym libgtksourceview "gtk_source_buffer_can_undo") (GtkSourceBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val createSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_create_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GtkSourceMarkClass.PolyML.cPtr
          )
      val endNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_buffer_end_not_undoable_action") (GtkSourceBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ensureHighlight_ =
        call (load_sym libgtksourceview "gtk_source_buffer_ensure_highlight")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val forwardIterToSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_forward_iter_to_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getHighlightMatchingBrackets_ = call (load_sym libgtksourceview "gtk_source_buffer_get_highlight_matching_brackets") (GtkSourceBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_buffer_get_highlight_syntax") (GtkSourceBufferClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_get_language") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceLanguageClass.PolyML.cPtr)
      val getMaxUndoLevels_ = call (load_sym libgtksourceview "gtk_source_buffer_get_max_undo_levels") (GtkSourceBufferClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getStyleScheme_ = call (load_sym libgtksourceview "gtk_source_buffer_get_style_scheme") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceStyleSchemeClass.PolyML.cPtr)
      val getUndoManager_ = call (load_sym libgtksourceview "gtk_source_buffer_get_undo_manager") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceUndoManagerClass.PolyML.cPtr)
      val iterBackwardToContextClassToggle_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_backward_to_context_class_toggle")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterForwardToContextClassToggle_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_forward_to_context_class_toggle")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasContextClass_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_has_context_class")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val redo_ = call (load_sym libgtksourceview "gtk_source_buffer_redo") (GtkSourceBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeSourceMarks_ =
        call (load_sym libgtksourceview "gtk_source_buffer_remove_source_marks")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setHighlightMatchingBrackets_ = call (load_sym libgtksourceview "gtk_source_buffer_set_highlight_matching_brackets") (GtkSourceBufferClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_buffer_set_highlight_syntax") (GtkSourceBufferClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_set_language") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceLanguageClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setMaxUndoLevels_ = call (load_sym libgtksourceview "gtk_source_buffer_set_max_undo_levels") (GtkSourceBufferClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setStyleScheme_ = call (load_sym libgtksourceview "gtk_source_buffer_set_style_scheme") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceStyleSchemeClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setUndoManager_ = call (load_sym libgtksourceview "gtk_source_buffer_set_undo_manager") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceUndoManagerClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val undo_ = call (load_sym libgtksourceview "gtk_source_buffer_undo") (GtkSourceBufferClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkSourceBufferClass.class
    type 'a mark_class = 'a GtkSourceMarkClass.class
    type bracket_match_type_t = GtkSourceBracketMatchType.t
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type 'a undo_manager_class = 'a GtkSourceUndoManagerClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new table = (GtkTextTagTableClass.C.withOptPtr ---> GtkSourceBufferClass.C.fromPtr true) new_ table
    fun newWithLanguage language = (GtkSourceLanguageClass.C.withPtr ---> GtkSourceBufferClass.C.fromPtr true) newWithLanguage_ language
    fun backwardIterToSourceMark self iter category =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> FFI.Bool.C.fromVal
      )
        backwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun beginNotUndoableAction self = (GtkSourceBufferClass.C.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GtkSourceBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) canRedo_ self
    fun canUndo self = (GtkSourceBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) canUndo_ self
    fun createSourceMark self name category where' =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> GtkSourceMarkClass.C.fromPtr false
      )
        createSourceMark_
        (
          self
           & name
           & category
           & where'
        )
    fun endNotUndoableAction self = (GtkSourceBufferClass.C.withPtr ---> I) endNotUndoableAction_ self
    fun ensureHighlight self start end' =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> I
      )
        ensureHighlight_
        (
          self
           & start
           & end'
        )
    fun forwardIterToSourceMark self iter category =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> FFI.Bool.C.fromVal
      )
        forwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun getHighlightMatchingBrackets self = (GtkSourceBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightMatchingBrackets_ self
    fun getHighlightSyntax self = (GtkSourceBufferClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightSyntax_ self
    fun getLanguage self = (GtkSourceBufferClass.C.withPtr ---> GtkSourceLanguageClass.C.fromPtr false) getLanguage_ self
    fun getMaxUndoLevels self = (GtkSourceBufferClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxUndoLevels_ self
    fun getStyleScheme self = (GtkSourceBufferClass.C.withPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getStyleScheme_ self
    fun getUndoManager self = (GtkSourceBufferClass.C.withPtr ---> GtkSourceUndoManagerClass.C.fromPtr false) getUndoManager_ self
    fun iterBackwardToContextClassToggle self iter contextClass =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        iterBackwardToContextClassToggle_
        (
          self
           & iter
           & contextClass
        )
    fun iterForwardToContextClassToggle self iter contextClass =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        iterForwardToContextClassToggle_
        (
          self
           & iter
           & contextClass
        )
    fun iterHasContextClass self iter contextClass =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        iterHasContextClass_
        (
          self
           & iter
           & contextClass
        )
    fun redo self = (GtkSourceBufferClass.C.withPtr ---> I) redo_ self
    fun removeSourceMarks self start end' category =
      (
        GtkSourceBufferClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        removeSourceMarks_
        (
          self
           & start
           & end'
           & category
        )
    fun setHighlightMatchingBrackets self highlight = (GtkSourceBufferClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightMatchingBrackets_ (self & highlight)
    fun setHighlightSyntax self highlight = (GtkSourceBufferClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLanguage self language = (GtkSourceBufferClass.C.withPtr &&&> GtkSourceLanguageClass.C.withOptPtr ---> I) setLanguage_ (self & language)
    fun setMaxUndoLevels self maxUndoLevels = (GtkSourceBufferClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxUndoLevels_ (self & maxUndoLevels)
    fun setStyleScheme self scheme = (GtkSourceBufferClass.C.withPtr &&&> GtkSourceStyleSchemeClass.C.withOptPtr ---> I) setStyleScheme_ (self & scheme)
    fun setUndoManager self manager = (GtkSourceBufferClass.C.withPtr &&&> GtkSourceUndoManagerClass.C.withOptPtr ---> I) setUndoManager_ (self & manager)
    fun undo self = (GtkSourceBufferClass.C.withPtr ---> I) undo_ self
    local
      open ClosureMarshal Signal
    in
      fun bracketMatchedSig f = signal "bracket-matched" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkSourceBracketMatchType.t ---> ret_void) (fn iter & state => f iter state)
      fun highlightUpdatedSig f = signal "highlight-updated" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextIterRecord.t ---> ret_void) (fn object & p0 => f object p0)
      fun redoSig f = signal "redo" (void ---> ret_void) f
      fun sourceMarkUpdatedSig f = signal "source-mark-updated" (get 0w1 GtkTextMarkClass.t ---> ret_void) f
      fun undoSig f = signal "undo" (void ---> ret_void) f
    end
    local
      open Property
    in
      val canRedoProp = {get = fn x => get "can-redo" boolean x}
      val canUndoProp = {get = fn x => get "can-undo" boolean x}
      val highlightMatchingBracketsProp =
        {
          get = fn x => get "highlight-matching-brackets" boolean x,
          set = fn x => set "highlight-matching-brackets" boolean x
        }
      val highlightSyntaxProp =
        {
          get = fn x => get "highlight-syntax" boolean x,
          set = fn x => set "highlight-syntax" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" GtkSourceLanguageClass.tOpt x,
          set = fn x => set "language" GtkSourceLanguageClass.tOpt x
        }
      val maxUndoLevelsProp =
        {
          get = fn x => get "max-undo-levels" int x,
          set = fn x => set "max-undo-levels" int x
        }
      val styleSchemeProp =
        {
          get = fn x => get "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => set "style-scheme" GtkSourceStyleSchemeClass.tOpt x
        }
      val undoManagerProp =
        {
          get = fn x => get "undo-manager" GtkSourceUndoManagerClass.tOpt x,
          set = fn x => set "undo-manager" GtkSourceUndoManagerClass.tOpt x
        }
    end
  end
