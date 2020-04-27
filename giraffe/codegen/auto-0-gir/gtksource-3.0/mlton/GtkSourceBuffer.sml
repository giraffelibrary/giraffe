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
    val getType_ = _import "gtk_source_buffer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_buffer_new" : unit GtkTextTagTableClass.FFI.p -> GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p;
    val newWithLanguage_ = _import "gtk_source_buffer_new_with_language" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p;
    val backwardIterToSourceMark_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_source_buffer_backward_iter_to_source_mark" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val beginNotUndoableAction_ = _import "gtk_source_buffer_begin_not_undoable_action" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit;
    val canRedo_ = _import "gtk_source_buffer_can_redo" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GBool.FFI.val_;
    val canUndo_ = _import "gtk_source_buffer_can_undo" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GBool.FFI.val_;
    val changeCase_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_source_buffer_change_case" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkSourceChangeCaseType.FFI.val_
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val createSourceMark_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_source_buffer_create_source_mark" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val endNotUndoableAction_ = _import "gtk_source_buffer_end_not_undoable_action" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit;
    val ensureHighlight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_buffer_ensure_highlight" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val forwardIterToSourceMark_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_source_buffer_forward_iter_to_source_mark" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getContextClassesAtIter_ = fn x1 & x2 => (_import "gtk_source_buffer_get_context_classes_at_iter" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;) (x1, x2)
    val getHighlightMatchingBrackets_ = _import "gtk_source_buffer_get_highlight_matching_brackets" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GBool.FFI.val_;
    val getHighlightSyntax_ = _import "gtk_source_buffer_get_highlight_syntax" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GBool.FFI.val_;
    val getImplicitTrailingNewline_ = _import "gtk_source_buffer_get_implicit_trailing_newline" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GBool.FFI.val_;
    val getLanguage_ = _import "gtk_source_buffer_get_language" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit GtkSourceLanguageClass.FFI.p;
    val getMaxUndoLevels_ = _import "gtk_source_buffer_get_max_undo_levels" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> GInt.FFI.val_;
    val getStyleScheme_ = _import "gtk_source_buffer_get_style_scheme" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit GtkSourceStyleSchemeClass.FFI.p;
    val getUndoManager_ = _import "gtk_source_buffer_get_undo_manager" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit GtkSourceUndoManagerClass.FFI.p;
    val iterBackwardToContextClassToggle_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_source_buffer_iter_backward_to_context_class_toggle" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterForwardToContextClassToggle_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_source_buffer_iter_forward_to_context_class_toggle" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasContextClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_source_buffer_iter_has_context_class" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val joinLines_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_buffer_join_lines" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val redo_ = _import "gtk_source_buffer_redo" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit;
    val removeSourceMarks_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_gtk_source_buffer_remove_source_marks" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setHighlightMatchingBrackets_ = fn x1 & x2 => (_import "gtk_source_buffer_set_highlight_matching_brackets" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHighlightSyntax_ = fn x1 & x2 => (_import "gtk_source_buffer_set_highlight_syntax" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setImplicitTrailingNewline_ = fn x1 & x2 => (_import "gtk_source_buffer_set_implicit_trailing_newline" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLanguage_ = fn x1 & x2 => (_import "gtk_source_buffer_set_language" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * unit GtkSourceLanguageClass.FFI.p -> unit;) (x1, x2)
    val setMaxUndoLevels_ = fn x1 & x2 => (_import "gtk_source_buffer_set_max_undo_levels" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setStyleScheme_ = fn x1 & x2 => (_import "gtk_source_buffer_set_style_scheme" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * unit GtkSourceStyleSchemeClass.FFI.p -> unit;) (x1, x2)
    val setUndoManager_ = fn x1 & x2 => (_import "gtk_source_buffer_set_undo_manager" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p * unit GtkSourceUndoManagerClass.FFI.p -> unit;) (x1, x2)
    val sortLines_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_source_buffer_sort_lines" :
              GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkSourceSortFlags.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val undo_ = _import "gtk_source_buffer_undo" : GtkSourceBufferClass.FFI.notnull GtkSourceBufferClass.FFI.p -> unit;
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
    fun getContextClassesAtIter self iter = (GtkSourceBufferClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getContextClassesAtIter_ (self & iter)
    fun getHighlightMatchingBrackets self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightMatchingBrackets_ self
    fun getHighlightSyntax self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getHighlightSyntax_ self
    fun getImplicitTrailingNewline self = (GtkSourceBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) getImplicitTrailingNewline_ self
    fun getLanguage self = (GtkSourceBufferClass.FFI.withPtr ---> GtkSourceLanguageClass.FFI.fromOptPtr false) getLanguage_ self
    fun getMaxUndoLevels self = (GtkSourceBufferClass.FFI.withPtr ---> GInt.FFI.fromVal) getMaxUndoLevels_ self
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
    fun setMaxUndoLevels self maxUndoLevels = (GtkSourceBufferClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMaxUndoLevels_ (self & maxUndoLevels)
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
         &&&> GInt.FFI.withVal
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
