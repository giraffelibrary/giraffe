structure GtkSourceBuffer :>
  GTK_SOURCE_BUFFER
    where type 'a class_t = 'a GtkSourceBufferClass.t
    where type 'a markclass_t = 'a GtkSourceMarkClass.t
    where type bracketmatchtype_t = GtkSourceBracketMatchType.t
    where type 'a languageclass_t = 'a GtkSourceLanguageClass.t
    where type 'a styleschemeclass_t = 'a GtkSourceStyleSchemeClass.t
    where type 'a undomanagerclass_t = 'a GtkSourceUndoManagerClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_buffer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_buffer_new") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_new_with_language") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val backwardIterToSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_backward_iter_to_source_mark")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.Bool.PolyML.VAL
          )
      val beginNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_buffer_begin_not_undoable_action") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val canRedo_ = call (load_sym libgtksourceview "gtk_source_buffer_can_redo") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val canUndo_ = call (load_sym libgtksourceview "gtk_source_buffer_can_undo") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val createSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_create_source_mark")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INPTR
             &&> GtkTextIterRecord.PolyML.PTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val endNotUndoableAction_ = call (load_sym libgtksourceview "gtk_source_buffer_end_not_undoable_action") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val ensureHighlight_ =
        call (load_sym libgtksourceview "gtk_source_buffer_ensure_highlight")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val forwardIterToSourceMark_ =
        call (load_sym libgtksourceview "gtk_source_buffer_forward_iter_to_source_mark")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.Bool.PolyML.VAL
          )
      val getHighlightMatchingBrackets_ = call (load_sym libgtksourceview "gtk_source_buffer_get_highlight_matching_brackets") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_buffer_get_highlight_syntax") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_get_language") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMaxUndoLevels_ = call (load_sym libgtksourceview "gtk_source_buffer_get_max_undo_levels") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getStyleScheme_ = call (load_sym libgtksourceview "gtk_source_buffer_get_style_scheme") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUndoManager_ = call (load_sym libgtksourceview "gtk_source_buffer_get_undo_manager") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val iterBackwardToContextClassToggle_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_backward_to_context_class_toggle")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
      val iterForwardToContextClassToggle_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_forward_to_context_class_toggle")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
      val iterHasContextClass_ =
        call (load_sym libgtksourceview "gtk_source_buffer_iter_has_context_class")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
      val redo_ = call (load_sym libgtksourceview "gtk_source_buffer_redo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeSourceMarks_ =
        call (load_sym libgtksourceview "gtk_source_buffer_remove_source_marks")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val setHighlightMatchingBrackets_ = call (load_sym libgtksourceview "gtk_source_buffer_set_highlight_matching_brackets") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setHighlightSyntax_ = call (load_sym libgtksourceview "gtk_source_buffer_set_highlight_syntax") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setLanguage_ = call (load_sym libgtksourceview "gtk_source_buffer_set_language") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setMaxUndoLevels_ = call (load_sym libgtksourceview "gtk_source_buffer_set_max_undo_levels") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setStyleScheme_ = call (load_sym libgtksourceview "gtk_source_buffer_set_style_scheme") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setUndoManager_ = call (load_sym libgtksourceview "gtk_source_buffer_set_undo_manager") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val undo_ = call (load_sym libgtksourceview "gtk_source_buffer_undo") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceBufferClass.t
    type 'a markclass_t = 'a GtkSourceMarkClass.t
    type bracketmatchtype_t = GtkSourceBracketMatchType.t
    type 'a languageclass_t = 'a GtkSourceLanguageClass.t
    type 'a styleschemeclass_t = 'a GtkSourceStyleSchemeClass.t
    type 'a undomanagerclass_t = 'a GtkSourceUndoManagerClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new table = (GObjectObjectClass.C.withOptPtr ---> GtkSourceBufferClass.C.fromPtr true) new_ table
    fun newWithLanguage language = (GObjectObjectClass.C.withPtr ---> GtkSourceBufferClass.C.fromPtr true) newWithLanguage_ language
    fun backwardIterToSourceMark self iter category =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> FFI.Bool.C.fromVal
      )
        backwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun beginNotUndoableAction self = (GObjectObjectClass.C.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canRedo_ self
    fun canUndo self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canUndo_ self
    fun createSourceMark self name category where' =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
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
    fun endNotUndoableAction self = (GObjectObjectClass.C.withPtr ---> I) endNotUndoableAction_ self
    fun ensureHighlight self start end' =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> FFI.Bool.C.fromVal
      )
        forwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun getHighlightMatchingBrackets self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightMatchingBrackets_ self
    fun getHighlightSyntax self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightSyntax_ self
    fun getLanguage self = (GObjectObjectClass.C.withPtr ---> GtkSourceLanguageClass.C.fromPtr false) getLanguage_ self
    fun getMaxUndoLevels self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxUndoLevels_ self
    fun getStyleScheme self = (GObjectObjectClass.C.withPtr ---> GtkSourceStyleSchemeClass.C.fromPtr false) getStyleScheme_ self
    fun getUndoManager self = (GObjectObjectClass.C.withPtr ---> GtkSourceUndoManagerClass.C.fromPtr false) getUndoManager_ self
    fun iterBackwardToContextClassToggle self iter contextClass =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.Bool.C.fromVal
      )
        iterHasContextClass_
        (
          self
           & iter
           & contextClass
        )
    fun redo self = (GObjectObjectClass.C.withPtr ---> I) redo_ self
    fun removeSourceMarks self start end' category =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> I
      )
        removeSourceMarks_
        (
          self
           & start
           & end'
           & category
        )
    fun setHighlightMatchingBrackets self highlight = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightMatchingBrackets_ (self & highlight)
    fun setHighlightSyntax self highlight = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setLanguage self language = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLanguage_ (self & language)
    fun setMaxUndoLevels self maxUndoLevels = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxUndoLevels_ (self & maxUndoLevels)
    fun setStyleScheme self scheme = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setStyleScheme_ (self & scheme)
    fun setUndoManager self manager = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setUndoManager_ (self & manager)
    fun undo self = (GObjectObjectClass.C.withPtr ---> I) undo_ self
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
