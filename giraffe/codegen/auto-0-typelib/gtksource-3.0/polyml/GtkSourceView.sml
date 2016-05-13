structure GtkSourceView :>
  GTK_SOURCE_VIEW
    where type 'a class = 'a GtkSourceViewClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a gutter_class = 'a GtkSourceGutterClass.class
    where type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    where type 'a completion_class = 'a GtkSourceCompletionClass.class
    where type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    where type smart_home_end_type_t = GtkSourceSmartHomeEndType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_view_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_view_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithBuffer_ = call (load_sym libgtksourceview "gtk_source_view_new_with_buffer") (GtkSourceBufferClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAutoIndent_ = call (load_sym libgtksourceview "gtk_source_view_get_auto_indent") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCompletion_ = call (load_sym libgtksourceview "gtk_source_view_get_completion") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceCompletionClass.PolyML.cPtr)
      val getDrawSpaces_ = call (load_sym libgtksourceview "gtk_source_view_get_draw_spaces") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceDrawSpacesFlags.PolyML.cVal)
      val getGutter_ = call (load_sym libgtksourceview "gtk_source_view_get_gutter") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextWindowType.PolyML.cVal --> GtkSourceGutterClass.PolyML.cPtr)
      val getHighlightCurrentLine_ = call (load_sym libgtksourceview "gtk_source_view_get_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIndentOnTab_ = call (load_sym libgtksourceview "gtk_source_view_get_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIndentWidth_ = call (load_sym libgtksourceview "gtk_source_view_get_indent_width") (GtkSourceViewClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getInsertSpacesInsteadOfTabs_ = call (load_sym libgtksourceview "gtk_source_view_get_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRightMarginPosition_ = call (load_sym libgtksourceview "gtk_source_view_get_right_margin_position") (GtkSourceViewClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getShowLineMarks_ = call (load_sym libgtksourceview "gtk_source_view_get_show_line_marks") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowLineNumbers_ = call (load_sym libgtksourceview "gtk_source_view_get_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowRightMargin_ = call (load_sym libgtksourceview "gtk_source_view_get_show_right_margin") (GtkSourceViewClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSmartHomeEnd_ = call (load_sym libgtksourceview "gtk_source_view_get_smart_home_end") (GtkSourceViewClass.PolyML.cPtr --> GtkSourceSmartHomeEndType.PolyML.cVal)
      val getTabWidth_ = call (load_sym libgtksourceview "gtk_source_view_get_tab_width") (GtkSourceViewClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getVisualColumn_ = call (load_sym libgtksourceview "gtk_source_view_get_visual_column") (GtkSourceViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val setAutoIndent_ = call (load_sym libgtksourceview "gtk_source_view_set_auto_indent") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDrawSpaces_ = call (load_sym libgtksourceview "gtk_source_view_set_draw_spaces") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceDrawSpacesFlags.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHighlightCurrentLine_ = call (load_sym libgtksourceview "gtk_source_view_set_highlight_current_line") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIndentOnTab_ = call (load_sym libgtksourceview "gtk_source_view_set_indent_on_tab") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIndentWidth_ = call (load_sym libgtksourceview "gtk_source_view_set_indent_width") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setInsertSpacesInsteadOfTabs_ = call (load_sym libgtksourceview "gtk_source_view_set_insert_spaces_instead_of_tabs") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMarkAttributes_ =
        call (load_sym libgtksourceview "gtk_source_view_set_mark_attributes")
          (
            GtkSourceViewClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkSourceMarkAttributesClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setRightMarginPosition_ = call (load_sym libgtksourceview "gtk_source_view_set_right_margin_position") (GtkSourceViewClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowLineMarks_ = call (load_sym libgtksourceview "gtk_source_view_set_show_line_marks") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowLineNumbers_ = call (load_sym libgtksourceview "gtk_source_view_set_show_line_numbers") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setShowRightMargin_ = call (load_sym libgtksourceview "gtk_source_view_set_show_right_margin") (GtkSourceViewClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSmartHomeEnd_ = call (load_sym libgtksourceview "gtk_source_view_set_smart_home_end") (GtkSourceViewClass.PolyML.cPtr &&> GtkSourceSmartHomeEndType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTabWidth_ = call (load_sym libgtksourceview "gtk_source_view_set_tab_width") (GtkSourceViewClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceViewClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a gutter_class = 'a GtkSourceGutterClass.class
    type 'a mark_attributes_class = 'a GtkSourceMarkAttributesClass.class
    type 'a completion_class = 'a GtkSourceCompletionClass.class
    type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    type smart_home_end_type_t = GtkSourceSmartHomeEndType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceViewClass.C.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkSourceBufferClass.C.withPtr ---> GtkSourceViewClass.C.fromPtr false) newWithBuffer_ buffer
    fun getAutoIndent self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoIndent_ self
    fun getCompletion self = (GtkSourceViewClass.C.withPtr ---> GtkSourceCompletionClass.C.fromPtr false) getCompletion_ self
    fun getDrawSpaces self = (GtkSourceViewClass.C.withPtr ---> GtkSourceDrawSpacesFlags.C.fromVal) getDrawSpaces_ self
    fun getGutter self windowType = (GtkSourceViewClass.C.withPtr &&&> GtkTextWindowType.C.withVal ---> GtkSourceGutterClass.C.fromPtr false) getGutter_ (self & windowType)
    fun getHighlightCurrentLine self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightCurrentLine_ self
    fun getIndentOnTab self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getIndentOnTab_ self
    fun getIndentWidth self = (GtkSourceViewClass.C.withPtr ---> FFI.Int32.C.fromVal) getIndentWidth_ self
    fun getInsertSpacesInsteadOfTabs self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getInsertSpacesInsteadOfTabs_ self
    fun getRightMarginPosition self = (GtkSourceViewClass.C.withPtr ---> FFI.UInt32.C.fromVal) getRightMarginPosition_ self
    fun getShowLineMarks self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineMarks_ self
    fun getShowLineNumbers self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineNumbers_ self
    fun getShowRightMargin self = (GtkSourceViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRightMargin_ self
    fun getSmartHomeEnd self = (GtkSourceViewClass.C.withPtr ---> GtkSourceSmartHomeEndType.C.fromVal) getSmartHomeEnd_ self
    fun getTabWidth self = (GtkSourceViewClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTabWidth_ self
    fun getVisualColumn self iter = (GtkSourceViewClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.UInt32.C.fromVal) getVisualColumn_ (self & iter)
    fun setAutoIndent self enable = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoIndent_ (self & enable)
    fun setDrawSpaces self flags = (GtkSourceViewClass.C.withPtr &&&> GtkSourceDrawSpacesFlags.C.withVal ---> I) setDrawSpaces_ (self & flags)
    fun setHighlightCurrentLine self hl = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightCurrentLine_ (self & hl)
    fun setIndentOnTab self enable = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIndentOnTab_ (self & enable)
    fun setIndentWidth self width = (GtkSourceViewClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIndentWidth_ (self & width)
    fun setInsertSpacesInsteadOfTabs self enable = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInsertSpacesInsteadOfTabs_ (self & enable)
    fun setMarkAttributes self category attributes priority =
      (
        GtkSourceViewClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkSourceMarkAttributesClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setMarkAttributes_
        (
          self
           & category
           & attributes
           & priority
        )
    fun setRightMarginPosition self pos = (GtkSourceViewClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setRightMarginPosition_ (self & pos)
    fun setShowLineMarks self show = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineMarks_ (self & show)
    fun setShowLineNumbers self show = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineNumbers_ (self & show)
    fun setShowRightMargin self show = (GtkSourceViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowRightMargin_ (self & show)
    fun setSmartHomeEnd self smartHe = (GtkSourceViewClass.C.withPtr &&&> GtkSourceSmartHomeEndType.C.withVal ---> I) setSmartHomeEnd_ (self & smartHe)
    fun setTabWidth self width = (GtkSourceViewClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTabWidth_ (self & width)
    local
      open ClosureMarshal Signal
    in
      fun lineMarkActivatedSig f = signal "line-mark-activated" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 GdkEvent.t ---> ret_void) (fn iter & event => f iter event)
      fun moveLinesSig f = signal "move-lines" (get 0w1 boolean &&&> get 0w2 int ---> ret_void) (fn copy & count => f copy count)
      fun moveWordsSig f = signal "move-words" (get 0w1 int ---> ret_void) f
      fun redoSig f = signal "redo" (void ---> ret_void) f
      fun showCompletionSig f = signal "show-completion" (void ---> ret_void) f
      fun smartHomeEndSig f = signal "smart-home-end" (get 0w1 GtkTextIterRecord.t &&&> get 0w2 int ---> ret_void) (fn iter & count => f iter count)
      fun undoSig f = signal "undo" (void ---> ret_void) f
    end
    local
      open Property
    in
      val autoIndentProp =
        {
          get = fn x => get "auto-indent" boolean x,
          set = fn x => set "auto-indent" boolean x
        }
      val completionProp = {get = fn x => get "completion" GtkSourceCompletionClass.tOpt x}
      val drawSpacesProp =
        {
          get = fn x => get "draw-spaces" GtkSourceDrawSpacesFlags.t x,
          set = fn x => set "draw-spaces" GtkSourceDrawSpacesFlags.t x
        }
      val highlightCurrentLineProp =
        {
          get = fn x => get "highlight-current-line" boolean x,
          set = fn x => set "highlight-current-line" boolean x
        }
      val indentOnTabProp =
        {
          get = fn x => get "indent-on-tab" boolean x,
          set = fn x => set "indent-on-tab" boolean x
        }
      val indentWidthProp =
        {
          get = fn x => get "indent-width" int x,
          set = fn x => set "indent-width" int x
        }
      val insertSpacesInsteadOfTabsProp =
        {
          get = fn x => get "insert-spaces-instead-of-tabs" boolean x,
          set = fn x => set "insert-spaces-instead-of-tabs" boolean x
        }
      val rightMarginPositionProp =
        {
          get = fn x => get "right-margin-position" uint x,
          set = fn x => set "right-margin-position" uint x
        }
      val showLineMarksProp =
        {
          get = fn x => get "show-line-marks" boolean x,
          set = fn x => set "show-line-marks" boolean x
        }
      val showLineNumbersProp =
        {
          get = fn x => get "show-line-numbers" boolean x,
          set = fn x => set "show-line-numbers" boolean x
        }
      val showRightMarginProp =
        {
          get = fn x => get "show-right-margin" boolean x,
          set = fn x => set "show-right-margin" boolean x
        }
      val smartHomeEndProp =
        {
          get = fn x => get "smart-home-end" GtkSourceSmartHomeEndType.t x,
          set = fn x => set "smart-home-end" GtkSourceSmartHomeEndType.t x
        }
      val tabWidthProp =
        {
          get = fn x => get "tab-width" uint x,
          set = fn x => set "tab-width" uint x
        }
    end
  end
