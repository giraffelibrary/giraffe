structure GtkSourceView :>
  GTK_SOURCE_VIEW
    where type 'a class_t = 'a GtkSourceViewClass.t
    where type 'a buffer_class_t = 'a GtkSourceBufferClass.t
    where type 'a gutter_class_t = 'a GtkSourceGutterClass.t
    where type 'a mark_attributes_class_t = 'a GtkSourceMarkAttributesClass.t
    where type 'a completion_class_t = 'a GtkSourceCompletionClass.t
    where type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    where type smart_home_end_type_t = GtkSourceSmartHomeEndType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_view_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_view_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithBuffer_ = call (load_sym libgtksourceview "gtk_source_view_new_with_buffer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAutoIndent_ = call (load_sym libgtksourceview "gtk_source_view_get_auto_indent") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCompletion_ = call (load_sym libgtksourceview "gtk_source_view_get_completion") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDrawSpaces_ = call (load_sym libgtksourceview "gtk_source_view_get_draw_spaces") (GObjectObjectClass.PolyML.PTR --> GtkSourceDrawSpacesFlags.PolyML.VAL)
      val getGutter_ = call (load_sym libgtksourceview "gtk_source_view_get_gutter") (GObjectObjectClass.PolyML.PTR &&> GtkTextWindowType.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getHighlightCurrentLine_ = call (load_sym libgtksourceview "gtk_source_view_get_highlight_current_line") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIndentOnTab_ = call (load_sym libgtksourceview "gtk_source_view_get_indent_on_tab") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIndentWidth_ = call (load_sym libgtksourceview "gtk_source_view_get_indent_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getInsertSpacesInsteadOfTabs_ = call (load_sym libgtksourceview "gtk_source_view_get_insert_spaces_instead_of_tabs") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getRightMarginPosition_ = call (load_sym libgtksourceview "gtk_source_view_get_right_margin_position") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getShowLineMarks_ = call (load_sym libgtksourceview "gtk_source_view_get_show_line_marks") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowLineNumbers_ = call (load_sym libgtksourceview "gtk_source_view_get_show_line_numbers") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowRightMargin_ = call (load_sym libgtksourceview "gtk_source_view_get_show_right_margin") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSmartHomeEnd_ = call (load_sym libgtksourceview "gtk_source_view_get_smart_home_end") (GObjectObjectClass.PolyML.PTR --> GtkSourceSmartHomeEndType.PolyML.VAL)
      val getTabWidth_ = call (load_sym libgtksourceview "gtk_source_view_get_tab_width") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getVisualColumn_ = call (load_sym libgtksourceview "gtk_source_view_get_visual_column") (GObjectObjectClass.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val setAutoIndent_ = call (load_sym libgtksourceview "gtk_source_view_set_auto_indent") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setDrawSpaces_ = call (load_sym libgtksourceview "gtk_source_view_set_draw_spaces") (GObjectObjectClass.PolyML.PTR &&> GtkSourceDrawSpacesFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val setHighlightCurrentLine_ = call (load_sym libgtksourceview "gtk_source_view_set_highlight_current_line") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setIndentOnTab_ = call (load_sym libgtksourceview "gtk_source_view_set_indent_on_tab") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setIndentWidth_ = call (load_sym libgtksourceview "gtk_source_view_set_indent_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setInsertSpacesInsteadOfTabs_ = call (load_sym libgtksourceview "gtk_source_view_set_insert_spaces_instead_of_tabs") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setMarkAttributes_ =
        call (load_sym libgtksourceview "gtk_source_view_set_mark_attributes")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setRightMarginPosition_ = call (load_sym libgtksourceview "gtk_source_view_set_right_margin_position") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowLineMarks_ = call (load_sym libgtksourceview "gtk_source_view_set_show_line_marks") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowLineNumbers_ = call (load_sym libgtksourceview "gtk_source_view_set_show_line_numbers") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setShowRightMargin_ = call (load_sym libgtksourceview "gtk_source_view_set_show_right_margin") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSmartHomeEnd_ = call (load_sym libgtksourceview "gtk_source_view_set_smart_home_end") (GObjectObjectClass.PolyML.PTR &&> GtkSourceSmartHomeEndType.PolyML.VAL --> FFI.PolyML.VOID)
      val setTabWidth_ = call (load_sym libgtksourceview "gtk_source_view_set_tab_width") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkSourceViewClass.t
    type 'a buffer_class_t = 'a GtkSourceBufferClass.t
    type 'a gutter_class_t = 'a GtkSourceGutterClass.t
    type 'a mark_attributes_class_t = 'a GtkSourceMarkAttributesClass.t
    type 'a completion_class_t = 'a GtkSourceCompletionClass.t
    type draw_spaces_flags_t = GtkSourceDrawSpacesFlags.t
    type smart_home_end_type_t = GtkSourceSmartHomeEndType.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceViewClass.C.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GObjectObjectClass.C.withPtr ---> GtkSourceViewClass.C.fromPtr false) newWithBuffer_ buffer
    fun getAutoIndent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoIndent_ self
    fun getCompletion self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionClass.C.fromPtr false) getCompletion_ self
    fun getDrawSpaces self = (GObjectObjectClass.C.withPtr ---> GtkSourceDrawSpacesFlags.C.fromVal) getDrawSpaces_ self
    fun getGutter self windowType = (GObjectObjectClass.C.withPtr &&&> GtkTextWindowType.C.withVal ---> GtkSourceGutterClass.C.fromPtr false) getGutter_ (self & windowType)
    fun getHighlightCurrentLine self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHighlightCurrentLine_ self
    fun getIndentOnTab self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIndentOnTab_ self
    fun getIndentWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIndentWidth_ self
    fun getInsertSpacesInsteadOfTabs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInsertSpacesInsteadOfTabs_ self
    fun getRightMarginPosition self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getRightMarginPosition_ self
    fun getShowLineMarks self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineMarks_ self
    fun getShowLineNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineNumbers_ self
    fun getShowRightMargin self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRightMargin_ self
    fun getSmartHomeEnd self = (GObjectObjectClass.C.withPtr ---> GtkSourceSmartHomeEndType.C.fromVal) getSmartHomeEnd_ self
    fun getTabWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getTabWidth_ self
    fun getVisualColumn self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.UInt32.C.fromVal) getVisualColumn_ (self & iter)
    fun setAutoIndent self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoIndent_ (self & enable)
    fun setDrawSpaces self flags = (GObjectObjectClass.C.withPtr &&&> GtkSourceDrawSpacesFlags.C.withVal ---> I) setDrawSpaces_ (self & flags)
    fun setHighlightCurrentLine self hl = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightCurrentLine_ (self & hl)
    fun setIndentOnTab self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIndentOnTab_ (self & enable)
    fun setIndentWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIndentWidth_ (self & width)
    fun setInsertSpacesInsteadOfTabs self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInsertSpacesInsteadOfTabs_ (self & enable)
    fun setMarkAttributes self category attributes priority =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun setRightMarginPosition self pos = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setRightMarginPosition_ (self & pos)
    fun setShowLineMarks self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineMarks_ (self & show)
    fun setShowLineNumbers self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineNumbers_ (self & show)
    fun setShowRightMargin self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowRightMargin_ (self & show)
    fun setSmartHomeEnd self smartHe = (GObjectObjectClass.C.withPtr &&&> GtkSourceSmartHomeEndType.C.withVal ---> I) setSmartHomeEnd_ (self & smartHe)
    fun setTabWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTabWidth_ (self & width)
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
