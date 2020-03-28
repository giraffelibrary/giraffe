structure GtkSourceBuffer :>
  GTK_SOURCE_BUFFER
    where type 'a class = 'a GtkSourceBufferClass.class
    where type change_case_type_t = GtkSourceChangeCaseType.t
    where type 'a mark_class = 'a GtkSourceMarkClass.class
    where type sort_flags_t = GtkSourceSortFlags.t
    where type bracket_match_type_t = GtkSourceBracketMatchType.t
    where type 'a language_class = 'a GtkSourceLanguageClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    where type 'a undo_manager_class = 'a GtkSourceUndoManagerClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_buffer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_buffer_new") (GtkTextTagTableClass.PolyML.cOptPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val newWithLanguage_ = call (getSymbol "gtk_source_buffer_new_with_language") (GtkSourceLanguageClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val backwardIterToSourceMark_ =
        call (getSymbol "gtk_source_buffer_backward_iter_to_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GBool.PolyML.cVal
          )
      val beginNotUndoableAction_ = call (getSymbol "gtk_source_buffer_begin_not_undoable_action") (GtkSourceBufferClass.PolyML.cPtr --> cVoid)
      val canRedo_ = call (getSymbol "gtk_source_buffer_can_redo") (GtkSourceBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canUndo_ = call (getSymbol "gtk_source_buffer_can_undo") (GtkSourceBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val changeCase_ =
        call (getSymbol "gtk_source_buffer_change_case")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkSourceChangeCaseType.PolyML.cVal
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val createSourceMark_ =
        call (getSymbol "gtk_source_buffer_create_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GtkSourceMarkClass.PolyML.cPtr
          )
      val endNotUndoableAction_ = call (getSymbol "gtk_source_buffer_end_not_undoable_action") (GtkSourceBufferClass.PolyML.cPtr --> cVoid)
      val ensureHighlight_ =
        call (getSymbol "gtk_source_buffer_ensure_highlight")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val forwardIterToSourceMark_ =
        call (getSymbol "gtk_source_buffer_forward_iter_to_source_mark")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GBool.PolyML.cVal
          )
      val getContextClassesAtIter_ = call (getSymbol "gtk_source_buffer_get_context_classes_at_iter") (GtkSourceBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8CArray.PolyML.cOutPtr)
      val getHighlightMatchingBrackets_ = call (getSymbol "gtk_source_buffer_get_highlight_matching_brackets") (GtkSourceBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHighlightSyntax_ = call (getSymbol "gtk_source_buffer_get_highlight_syntax") (GtkSourceBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getImplicitTrailingNewline_ = call (getSymbol "gtk_source_buffer_get_implicit_trailing_newline") (GtkSourceBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLanguage_ = call (getSymbol "gtk_source_buffer_get_language") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceLanguageClass.PolyML.cOptPtr)
      val getMaxUndoLevels_ = call (getSymbol "gtk_source_buffer_get_max_undo_levels") (GtkSourceBufferClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStyleScheme_ = call (getSymbol "gtk_source_buffer_get_style_scheme") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceStyleSchemeClass.PolyML.cOptPtr)
      val getUndoManager_ = call (getSymbol "gtk_source_buffer_get_undo_manager") (GtkSourceBufferClass.PolyML.cPtr --> GtkSourceUndoManagerClass.PolyML.cOptPtr)
      val iterBackwardToContextClassToggle_ =
        call (getSymbol "gtk_source_buffer_iter_backward_to_context_class_toggle")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val iterForwardToContextClassToggle_ =
        call (getSymbol "gtk_source_buffer_iter_forward_to_context_class_toggle")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val iterHasContextClass_ =
        call (getSymbol "gtk_source_buffer_iter_has_context_class")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val joinLines_ =
        call (getSymbol "gtk_source_buffer_join_lines")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val redo_ = call (getSymbol "gtk_source_buffer_redo") (GtkSourceBufferClass.PolyML.cPtr --> cVoid)
      val removeSourceMarks_ =
        call (getSymbol "gtk_source_buffer_remove_source_marks")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setHighlightMatchingBrackets_ = call (getSymbol "gtk_source_buffer_set_highlight_matching_brackets") (GtkSourceBufferClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHighlightSyntax_ = call (getSymbol "gtk_source_buffer_set_highlight_syntax") (GtkSourceBufferClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setImplicitTrailingNewline_ = call (getSymbol "gtk_source_buffer_set_implicit_trailing_newline") (GtkSourceBufferClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLanguage_ = call (getSymbol "gtk_source_buffer_set_language") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceLanguageClass.PolyML.cOptPtr --> cVoid)
      val setMaxUndoLevels_ = call (getSymbol "gtk_source_buffer_set_max_undo_levels") (GtkSourceBufferClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setStyleScheme_ = call (getSymbol "gtk_source_buffer_set_style_scheme") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceStyleSchemeClass.PolyML.cOptPtr --> cVoid)
      val setUndoManager_ = call (getSymbol "gtk_source_buffer_set_undo_manager") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceUndoManagerClass.PolyML.cOptPtr --> cVoid)
      val sortLines_ =
        call (getSymbol "gtk_source_buffer_sort_lines")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkSourceSortFlags.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val undo_ = call (getSymbol "gtk_source_buffer_undo") (GtkSourceBufferClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceBufferClass.class
    type change_case_type_t = GtkSourceChangeCaseType.t
    type 'a mark_class = 'a GtkSourceMarkClass.class
    type sort_flags_t = GtkSourceSortFlags.t
    type bracket_match_type_t = GtkSourceBracketMatchType.t
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type 'a undo_manager_class = 'a GtkSourceUndoManagerClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new table = (GtkTextTagTableClass.FFI.withOptPtr ---> GtkSourceBufferClass.FFI.fromPtr true) new_ table
    fun newWithLanguage language = (GtkSourceLanguageClass.FFI.withPtr ---> GtkSourceBufferClass.FFI.fromPtr true) newWithLanguage_ language
    fun backwardIterToSourceMark self (iter, category) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GBool.FFI.fromVal
      )
        backwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun beginNotUndoableAction self = (GtkSourceBufferClass.FFI.withPtr ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) canRedo_ self
    fun canUndo self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) canUndo_ self
    fun changeCase
      self
      (
        caseType,
        start,
        end'
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkSourceChangeCaseType.FFI.withVal
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        changeCase_
        (
          self
           & caseType
           & start
           & end'
        )
    fun createSourceMark
      self
      (
        name,
        category,
        where'
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GtkSourceMarkClass.FFI.fromPtr false
      )
        createSourceMark_
        (
          self
           & name
           & category
           & where'
        )
    fun endNotUndoableAction self = (GtkSourceBufferClass.FFI.withPtr ---> I) endNotUndoableAction_ self
    fun ensureHighlight self (start, end') =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        ensureHighlight_
        (
          self
           & start
           & end'
        )
    fun forwardIterToSourceMark self (iter, category) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GBool.FFI.fromVal
      )
        forwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun getContextClassesAtIter self iter = (GtkSourceBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 2) getContextClassesAtIter_ (self & iter)
    fun getHighlightMatchingBrackets self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightMatchingBrackets_ self
    fun getHighlightSyntax self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightSyntax_ self
    fun getImplicitTrailingNewline self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getImplicitTrailingNewline_ self
    fun getLanguage self = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourceLanguageClass.FFI.fromOptPtr false) getLanguage_ self
    fun getMaxUndoLevels self = (GtkSourceBufferClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxUndoLevels_ self
    fun getStyleScheme self = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourceStyleSchemeClass.FFI.fromOptPtr false) getStyleScheme_ self
    fun getUndoManager self = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourceUndoManagerClass.FFI.fromOptPtr false) getUndoManager_ self
    fun iterBackwardToContextClassToggle self (iter, contextClass) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        iterBackwardToContextClassToggle_
        (
          self
           & iter
           & contextClass
        )
    fun iterForwardToContextClassToggle self (iter, contextClass) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        iterForwardToContextClassToggle_
        (
          self
           & iter
           & contextClass
        )
    fun iterHasContextClass self (iter, contextClass) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        iterHasContextClass_
        (
          self
           & iter
           & contextClass
        )
    fun joinLines self (start, end') =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> I
      )
        joinLines_
        (
          self
           & start
           & end'
        )
    fun redo self = (GtkSourceBufferClass.FFI.withPtr ---> I) redo_ self
    fun removeSourceMarks
      self
      (
        start,
        end',
        category
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        removeSourceMarks_
        (
          self
           & start
           & end'
           & category
        )
    fun setHighlightMatchingBrackets self highlight = (GtkSourceBufferClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHighlightMatchingBrackets_ (self & highlight)
    fun setHighlightSyntax self highlight = (GtkSourceBufferClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setImplicitTrailingNewline self implicitTrailingNewline = (GtkSourceBufferClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setImplicitTrailingNewline_ (self & implicitTrailingNewline)
    fun setLanguage self language = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceLanguageClass.FFI.withOptPtr ---> I) setLanguage_ (self & language)
    fun setMaxUndoLevels self maxUndoLevels = (GtkSourceBufferClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxUndoLevels_ (self & maxUndoLevels)
    fun setStyleScheme self scheme = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceStyleSchemeClass.FFI.withOptPtr ---> I) setStyleScheme_ (self & scheme)
    fun setUndoManager self manager = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceUndoManagerClass.FFI.withOptPtr ---> I) setUndoManager_ (self & manager)
    fun sortLines
      self
      (
        start,
        end',
        flags,
        column
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkSourceSortFlags.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        sortLines_
        (
          self
           & start
           & end'
           & flags
           & column
        )
    fun undo self = (GtkSourceBufferClass.FFI.withPtr ---> I) undo_ self
    local
      open ClosureMarshal Signal
    in
      fun bracketMatchedSig f = signal "bracket-matched" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkSourceBracketMatchType.t ---> ret_void) (fn iter & state => f (iter, state))
      fun highlightUpdatedSig f = signal "highlight-updated" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GtkTextIterRecord.t ---> ret_void) (fn start & end' => f (start, end'))
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
          set = fn x => set "highlight-matching-brackets" boolean x,
          new = fn x => new "highlight-matching-brackets" boolean x
        }
      val highlightSyntaxProp =
        {
          get = fn x => get "highlight-syntax" boolean x,
          set = fn x => set "highlight-syntax" boolean x,
          new = fn x => new "highlight-syntax" boolean x
        }
      val implicitTrailingNewlineProp =
        {
          get = fn x => get "implicit-trailing-newline" boolean x,
          set = fn x => set "implicit-trailing-newline" boolean x,
          new = fn x => new "implicit-trailing-newline" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" GtkSourceLanguageClass.tOpt x,
          set = fn x => set "language" GtkSourceLanguageClass.tOpt x,
          new = fn x => new "language" GtkSourceLanguageClass.tOpt x
        }
      val maxUndoLevelsProp =
        {
          get = fn x => get "max-undo-levels" int x,
          set = fn x => set "max-undo-levels" int x,
          new = fn x => new "max-undo-levels" int x
        }
      val styleSchemeProp =
        {
          get = fn x => get "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => set "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          new = fn x => new "style-scheme" GtkSourceStyleSchemeClass.tOpt x
        }
      val undoManagerProp =
        {
          get = fn x => get "undo-manager" GtkSourceUndoManagerClass.tOpt x,
          set = fn x => set "undo-manager" GtkSourceUndoManagerClass.tOpt x,
          new = fn x => new "undo-manager" GtkSourceUndoManagerClass.tOpt x
        }
    end
  end
