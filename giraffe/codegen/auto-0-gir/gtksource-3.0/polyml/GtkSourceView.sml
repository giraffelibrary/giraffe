structure GtkSourceView :>
  GTK_SOURCE_VIEW
    where type 'a class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a gutter_class = 'a GtkSourceGutterClass.class
    where type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    where type change_case_type_t = GtkSourceChangeCaseType.t
    where type background_pattern_type_t = GtkSourceBackgroundPatternType.t
    where type 'a completion_class = 'a GtkSourceCompletionClass.class
    where type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    where type smart_home_end_type_t = GtkSourceSmartHomeEndType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithBuffer_ = call (getSymbol "gtk_source_view_new_with_buffer") (GtkSourceBufferClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAutoIndent_ = call (getSymbol "gtk_source_view_get_auto_indent") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBackgroundPattern_ = call (getSymbol "gtk_source_view_get_background_pattern") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceBackgroundPatternType.PolyML.cVal)
      val getCompletion_ = call (getSymbol "gtk_source_view_get_completion") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceCompletionClass.PolyML.cPtr)
      val getDrawSpaces_ = call (getSymbol "gtk_source_view_get_draw_spaces") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceDrawSpacesFlags.PolyML.cVal)
      val getGutter_ = call (getSymbol "gtk_source_view_get_gutter") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextWindowType.PolyML.cVal --> GtkSourceGutterClass.PolyML.cPtr)
      val getHighlightCurrentLine_ = call (getSymbol "gtk_source_view_get_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIndentOnTab_ = call (getSymbol "gtk_source_view_get_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIndentWidth_ = call (getSymbol "gtk_source_view_get_indent_width") (GtkSourceViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getInsertSpacesInsteadOfTabs_ = call (getSymbol "gtk_source_view_get_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRightMarginPosition_ = call (getSymbol "gtk_source_view_get_right_margin_position") (GtkSourceViewClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getShowLineMarks_ = call (getSymbol "gtk_source_view_get_show_line_marks") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowLineNumbers_ = call (getSymbol "gtk_source_view_get_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowRightMargin_ = call (getSymbol "gtk_source_view_get_show_right_margin") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSmartBackspace_ = call (getSymbol "gtk_source_view_get_smart_backspace") (GtkSourceViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSmartHomeEnd_ = call (getSymbol "gtk_source_view_get_smart_home_end") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceSmartHomeEndType.PolyML.cVal)
      val getTabWidth_ = call (getSymbol "gtk_source_view_get_tab_width") (GtkSourceViewClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getVisualColumn_ = call (getSymbol "gtk_source_view_get_visual_column") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val indentLines_ =
        call (getSymbol "gtk_source_view_indent_lines")
          (
            GtkSourceViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
      val setAutoIndent_ = call (getSymbol "gtk_source_view_set_auto_indent") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackgroundPattern_ = call (getSymbol "gtk_source_view_set_background_pattern") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceBackgroundPatternType.PolyML.cVal --> cVoid)
      val setDrawSpaces_ = call (getSymbol "gtk_source_view_set_draw_spaces") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceDrawSpacesFlags.PolyML.cVal --> cVoid)
      val setHighlightCurrentLine_ = call (getSymbol "gtk_source_view_set_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIndentOnTab_ = call (getSymbol "gtk_source_view_set_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIndentWidth_ = call (getSymbol "gtk_source_view_set_indent_width") (GtkSourceViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setInsertSpacesInsteadOfTabs_ = call (getSymbol "gtk_source_view_set_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMarkAttributes_ =
        call (getSymbol "gtk_source_view_set_mark_attributes")
          (
            GtkSourceViewClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setRightMarginPosition_ = call (getSymbol "gtk_source_view_set_right_margin_position") (GtkSourceViewClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setShowLineMarks_ = call (getSymbol "gtk_source_view_set_show_line_marks") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowLineNumbers_ = call (getSymbol "gtk_source_view_set_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowRightMargin_ = call (getSymbol "gtk_source_view_set_show_right_margin") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSmartBackspace_ = call (getSymbol "gtk_source_view_set_smart_backspace") (GtkSourceViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSmartHomeEnd_ = call (getSymbol "gtk_source_view_set_smart_home_end") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceSmartHomeEndType.PolyML.cVal --> cVoid)
      val setTabWidth_ = call (getSymbol "gtk_source_view_set_tab_width") (GtkSourceViewClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val unindentLines_ =
        call (getSymbol "gtk_source_view_unindent_lines")
          (
            GtkSourceViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a gutter_class = 'a GtkSourceGutterClass.class
    type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    type change_case_type_t = GtkSourceChangeCaseType.t
    type background_pattern_type_t = GtkSourceBackgroundPatternType.t
    type 'a completion_class = 'a GtkSourceCompletionClass.class
    type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    type smart_home_end_type_t = GtkSourceSmartHomeEndType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceViewClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkSourceBufferClass.FFI.withPtr false ---> GtkSourceViewClass.FFI.fromPtr false) newWithBuffer_ buffer
    fun getAutoIndent self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAutoIndent_ self
    fun getBackgroundPattern self = (GtkSourceViewClass.FFI.withPtr false ---> GtkSourceBackgroundPatternType.FFI.fromVal) getBackgroundPattern_ self
    fun getCompletion self = (GtkSourceViewClass.FFI.withPtr false ---> GtkSourceCompletionClass.FFI.fromPtr false) getCompletion_ self
    fun getDrawSpaces self = (GtkSourceViewClass.FFI.withPtr false ---> GtkSourceDrawSpacesFlags.FFI.fromVal) getDrawSpaces_ self
    fun getGutter self windowType = (GtkSourceViewClass.FFI.withPtr false &&&> GtkTextWindowType.FFI.withVal ---> GtkSourceGutterClass.FFI.fromPtr false) getGutter_ (self & windowType)
    fun getHighlightCurrentLine self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHighlightCurrentLine_ self
    fun getIndentOnTab self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIndentOnTab_ self
    fun getIndentWidth self = (GtkSourceViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndentWidth_ self
    fun getInsertSpacesInsteadOfTabs self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInsertSpacesInsteadOfTabs_ self
    fun getRightMarginPosition self = (GtkSourceViewClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getRightMarginPosition_ self
    fun getShowLineMarks self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowLineMarks_ self
    fun getShowLineNumbers self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowLineNumbers_ self
    fun getShowRightMargin self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowRightMargin_ self
    fun getSmartBackspace self = (GtkSourceViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSmartBackspace_ self
    fun getSmartHomeEnd self = (GtkSourceViewClass.FFI.withPtr false ---> GtkSourceSmartHomeEndType.FFI.fromVal) getSmartHomeEnd_ self
    fun getTabWidth self = (GtkSourceViewClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getTabWidth_ self
    fun getVisualColumn self iter = (GtkSourceViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) getVisualColumn_ (self & iter)
    fun indentLines self (start, end') =
      (
        GtkSourceViewClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        indentLines_
        (
          self
           & start
           & end'
        )
    fun setAutoIndent self enable = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAutoIndent_ (self & enable)
    fun setBackgroundPattern self backgroundPattern = (GtkSourceViewClass.FFI.withPtr false &&&> GtkSourceBackgroundPatternType.FFI.withVal ---> I) setBackgroundPattern_ (self & backgroundPattern)
    fun setDrawSpaces self flags = (GtkSourceViewClass.FFI.withPtr false &&&> GtkSourceDrawSpacesFlags.FFI.withVal ---> I) setDrawSpaces_ (self & flags)
    fun setHighlightCurrentLine self highlight = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHighlightCurrentLine_ (self & highlight)
    fun setIndentOnTab self enable = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setIndentOnTab_ (self & enable)
    fun setIndentWidth self width = (GtkSourceViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setIndentWidth_ (self & width)
    fun setInsertSpacesInsteadOfTabs self enable = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInsertSpacesInsteadOfTabs_ (self & enable)
    fun setMarkAttributes
      self
      (
        category,
        attributes,
        priority
      ) =
      (
        GtkSourceViewClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkSourceMarkAttributesClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        setMarkAttributes_
        (
          self
           & category
           & attributes
           & priority
        )
    fun setRightMarginPosition self pos = (GtkSourceViewClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setRightMarginPosition_ (self & pos)
    fun setShowLineMarks self show = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowLineMarks_ (self & show)
    fun setShowLineNumbers self show = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowLineNumbers_ (self & show)
    fun setShowRightMargin self show = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowRightMargin_ (self & show)
    fun setSmartBackspace self smartBackspace = (GtkSourceViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSmartBackspace_ (self & smartBackspace)
    fun setSmartHomeEnd self smartHomeEnd = (GtkSourceViewClass.FFI.withPtr false &&&> GtkSourceSmartHomeEndType.FFI.withVal ---> I) setSmartHomeEnd_ (self & smartHomeEnd)
    fun setTabWidth self width = (GtkSourceViewClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setTabWidth_ (self & width)
    fun unindentLines self (start, end') =
      (
        GtkSourceViewClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> I
      )
        unindentLines_
        (
          self
           & start
           & end'
        )
    local
      open ClosureMarshal Signal
    in
      fun changeCaseSig f = signal "change-case" (get 0w1 GtkSourceChangeCaseType.t ---> ret_void) f
      fun changeNumberSig f = signal "change-number" (get 0w1 int ---> ret_void) f
      fun joinLinesSig f = signal "join-lines" (void ---> ret_void) f
      fun lineMarkActivatedSig f = signal "line-mark-activated" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GdkEvent.t ---> ret_void) (fn iter & event => f (iter, event))
      fun moveLinesSig f = signal "move-lines" (get 0w1 boolean &&&> get 0w2 int ---> ret_void) (fn copy & count => f (copy, count))
      fun moveToMatchingBracketSig f = signal "move-to-matching-bracket" (get 0w1 boolean ---> ret_void) f
      fun moveWordsSig f = signal "move-words" (get 0w1 int ---> ret_void) f
      fun redoSig f = signal "redo" (void ---> ret_void) f
      fun showCompletionSig f = signal "show-completion" (void ---> ret_void) f
      fun smartHomeEndSig f = signal "smart-home-end" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 int ---> ret_void) (fn iter & count => f (iter, count))
      fun undoSig f = signal "undo" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val autoIndentProp =
        {
          name = "auto-indent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backgroundPatternProp =
        {
          name = "background-pattern",
          gtype = fn () => C.gtype GtkSourceBackgroundPatternType.t (),
          get = fn x => fn () => C.get GtkSourceBackgroundPatternType.t x,
          set = fn x => C.set GtkSourceBackgroundPatternType.t x,
          init = fn x => C.set GtkSourceBackgroundPatternType.t x
        }
      val completionProp =
        {
          name = "completion",
          gtype = fn () => C.gtype GtkSourceCompletionClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceCompletionClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val drawSpacesProp =
        {
          name = "draw-spaces",
          gtype = fn () => C.gtype GtkSourceDrawSpacesFlags.t (),
          get = fn x => fn () => C.get GtkSourceDrawSpacesFlags.t x,
          set = fn x => C.set GtkSourceDrawSpacesFlags.t x,
          init = fn x => C.set GtkSourceDrawSpacesFlags.t x
        }
      val highlightCurrentLineProp =
        {
          name = "highlight-current-line",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val indentOnTabProp =
        {
          name = "indent-on-tab",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val indentWidthProp =
        {
          name = "indent-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val insertSpacesInsteadOfTabsProp =
        {
          name = "insert-spaces-instead-of-tabs",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rightMarginPositionProp =
        {
          name = "right-margin-position",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val showLineMarksProp =
        {
          name = "show-line-marks",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showLineNumbersProp =
        {
          name = "show-line-numbers",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showRightMarginProp =
        {
          name = "show-right-margin",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val smartBackspaceProp =
        {
          name = "smart-backspace",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val smartHomeEndProp =
        {
          name = "smart-home-end",
          gtype = fn () => C.gtype GtkSourceSmartHomeEndType.t (),
          get = fn x => fn () => C.get GtkSourceSmartHomeEndType.t x,
          set = fn x => C.set GtkSourceSmartHomeEndType.t x,
          init = fn x => C.set GtkSourceSmartHomeEndType.t x
        }
      val tabWidthProp =
        {
          name = "tab-width",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
