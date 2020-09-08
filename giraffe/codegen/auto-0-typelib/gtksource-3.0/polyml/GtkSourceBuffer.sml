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
      val getContextClassesAtIter_ = call (getSymbol "gtk_source_buffer_get_context_classes_at_iter") (GtkSourceBufferClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
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
    fun new table = (GtkTextTagTableClass.FFI.withOptPtr false ---> GtkSourceBufferClass.FFI.fromPtr true) new_ table
    fun newWithLanguage language = (GtkSourceLanguageClass.FFI.withPtr false ---> GtkSourceBufferClass.FFI.fromPtr true) newWithLanguage_ language
    fun backwardIterToSourceMark self (iter, category) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GBool.FFI.fromVal
      )
        backwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun beginNotUndoableAction self = (GtkSourceBufferClass.FFI.withPtr false ---> I) beginNotUndoableAction_ self
    fun canRedo self = (GtkSourceBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) canRedo_ self
    fun canUndo self = (GtkSourceBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) canUndo_ self
    fun changeCase
      self
      (
        caseType,
        start,
        end'
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkSourceChangeCaseType.FFI.withVal
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
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
        GtkSourceBufferClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GtkSourceMarkClass.FFI.fromPtr false
      )
        createSourceMark_
        (
          self
           & name
           & category
           & where'
        )
    fun endNotUndoableAction self = (GtkSourceBufferClass.FFI.withPtr false ---> I) endNotUndoableAction_ self
    fun ensureHighlight self (start, end') =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
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
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> GBool.FFI.fromVal
      )
        forwardIterToSourceMark_
        (
          self
           & iter
           & category
        )
    fun getContextClassesAtIter self iter = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) getContextClassesAtIter_ (self & iter)
    fun getHighlightMatchingBrackets self = (GtkSourceBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHighlightMatchingBrackets_ self
    fun getHighlightSyntax self = (GtkSourceBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHighlightSyntax_ self
    fun getImplicitTrailingNewline self = (GtkSourceBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) getImplicitTrailingNewline_ self
    fun getLanguage self = (GtkSourceBufferClass.FFI.withPtr false ---> GtkSourceLanguageClass.FFI.fromOptPtr false) getLanguage_ self
    fun getMaxUndoLevels self = (GtkSourceBufferClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMaxUndoLevels_ self
    fun getStyleScheme self = (GtkSourceBufferClass.FFI.withPtr false ---> GtkSourceStyleSchemeClass.FFI.fromOptPtr false) getStyleScheme_ self
    fun getUndoManager self = (GtkSourceBufferClass.FFI.withPtr false ---> GtkSourceUndoManagerClass.FFI.fromOptPtr false) getUndoManager_ self
    fun iterBackwardToContextClassToggle self (iter, contextClass) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        joinLines_
        (
          self
           & start
           & end'
        )
    fun redo self = (GtkSourceBufferClass.FFI.withPtr false ---> I) redo_ self
    fun removeSourceMarks
      self
      (
        start,
        end',
        category
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        removeSourceMarks_
        (
          self
           & start
           & end'
           & category
        )
    fun setHighlightMatchingBrackets self highlight = (GtkSourceBufferClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHighlightMatchingBrackets_ (self & highlight)
    fun setHighlightSyntax self highlight = (GtkSourceBufferClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHighlightSyntax_ (self & highlight)
    fun setImplicitTrailingNewline self implicitTrailingNewline = (GtkSourceBufferClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setImplicitTrailingNewline_ (self & implicitTrailingNewline)
    fun setLanguage self language = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceLanguageClass.FFI.withOptPtr false ---> I) setLanguage_ (self & language)
    fun setMaxUndoLevels self maxUndoLevels = (GtkSourceBufferClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setMaxUndoLevels_ (self & maxUndoLevels)
    fun setStyleScheme self scheme = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceStyleSchemeClass.FFI.withOptPtr false ---> I) setStyleScheme_ (self & scheme)
    fun setUndoManager self manager = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceUndoManagerClass.FFI.withOptPtr false ---> I) setUndoManager_ (self & manager)
    fun sortLines
      self
      (
        start,
        end',
        flags,
        column
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
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
    fun undo self = (GtkSourceBufferClass.FFI.withPtr false ---> I) undo_ self
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
      open ValueAccessor
    in
      val canRedoProp =
        {
          name = "can-redo",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val canUndoProp =
        {
          name = "can-undo",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val highlightMatchingBracketsProp =
        {
          name = "highlight-matching-brackets",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val highlightSyntaxProp =
        {
          name = "highlight-syntax",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val implicitTrailingNewlineProp =
        {
          name = "implicit-trailing-newline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val languageProp =
        {
          name = "language",
          gtype = fn () => C.gtype GtkSourceLanguageClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceLanguageClass.tOpt x,
          set = fn x => C.set GtkSourceLanguageClass.tOpt x,
          init = fn x => C.set GtkSourceLanguageClass.tOpt x
        }
      val maxUndoLevelsProp =
        {
          name = "max-undo-levels",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val styleSchemeProp =
        {
          name = "style-scheme",
          gtype = fn () => C.gtype GtkSourceStyleSchemeClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => C.set GtkSourceStyleSchemeClass.tOpt x,
          init = fn x => C.set GtkSourceStyleSchemeClass.tOpt x
        }
      val undoManagerProp =
        {
          name = "undo-manager",
          gtype = fn () => C.gtype GtkSourceUndoManagerClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceUndoManagerClass.tOpt x,
          set = fn x => C.set GtkSourceUndoManagerClass.tOpt x,
          init = fn x => C.set GtkSourceUndoManagerClass.tOpt x
        }
    end
  end
