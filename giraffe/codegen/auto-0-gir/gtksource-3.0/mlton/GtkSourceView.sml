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
    val getType_ = _import "gtk_source_view_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_view_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithBuffer_ = _import "gtk_source_view_new_with_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAutoIndent_ = _import "gtk_source_view_get_auto_indent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getCompletion_ = _import "gtk_source_view_get_completion" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDrawSpaces_ = _import "gtk_source_view_get_draw_spaces" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSourceDrawSpacesFlags.C.val_;
    val getGutter_ = fn x1 & x2 => (_import "gtk_source_view_get_gutter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextWindowType.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getHighlightCurrentLine_ = _import "gtk_source_view_get_highlight_current_line" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIndentOnTab_ = _import "gtk_source_view_get_indent_on_tab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIndentWidth_ = _import "gtk_source_view_get_indent_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getInsertSpacesInsteadOfTabs_ = _import "gtk_source_view_get_insert_spaces_instead_of_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getRightMarginPosition_ = _import "gtk_source_view_get_right_margin_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getShowLineMarks_ = _import "gtk_source_view_get_show_line_marks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowLineNumbers_ = _import "gtk_source_view_get_show_line_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowRightMargin_ = _import "gtk_source_view_get_show_right_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSmartHomeEnd_ = _import "gtk_source_view_get_smart_home_end" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSourceSmartHomeEndType.C.val_;
    val getTabWidth_ = _import "gtk_source_view_get_tab_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getVisualColumn_ = fn x1 & x2 => (_import "gtk_source_view_get_visual_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.UInt.C.val_;) (x1, x2)
    val setAutoIndent_ = fn x1 & x2 => (_import "gtk_source_view_set_auto_indent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDrawSpaces_ = fn x1 & x2 => (_import "gtk_source_view_set_draw_spaces" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSourceDrawSpacesFlags.C.val_ -> unit;) (x1, x2)
    val setHighlightCurrentLine_ = fn x1 & x2 => (_import "gtk_source_view_set_highlight_current_line" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIndentOnTab_ = fn x1 & x2 => (_import "gtk_source_view_set_indent_on_tab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIndentWidth_ = fn x1 & x2 => (_import "gtk_source_view_set_indent_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setInsertSpacesInsteadOfTabs_ = fn x1 & x2 => (_import "gtk_source_view_set_insert_spaces_instead_of_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMarkAttributes_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_source_view_set_mark_attributes" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setRightMarginPosition_ = fn x1 & x2 => (_import "gtk_source_view_set_right_margin_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setShowLineMarks_ = fn x1 & x2 => (_import "gtk_source_view_set_show_line_marks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowLineNumbers_ = fn x1 & x2 => (_import "gtk_source_view_set_show_line_numbers" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setShowRightMargin_ = fn x1 & x2 => (_import "gtk_source_view_set_show_right_margin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSmartHomeEnd_ = fn x1 & x2 => (_import "gtk_source_view_set_smart_home_end" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSourceSmartHomeEndType.C.val_ -> unit;) (x1, x2)
    val setTabWidth_ = fn x1 & x2 => (_import "gtk_source_view_set_tab_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
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
    fun getIndentWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIndentWidth_ self
    fun getInsertSpacesInsteadOfTabs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInsertSpacesInsteadOfTabs_ self
    fun getRightMarginPosition self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getRightMarginPosition_ self
    fun getShowLineMarks self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineMarks_ self
    fun getShowLineNumbers self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowLineNumbers_ self
    fun getShowRightMargin self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowRightMargin_ self
    fun getSmartHomeEnd self = (GObjectObjectClass.C.withPtr ---> GtkSourceSmartHomeEndType.C.fromVal) getSmartHomeEnd_ self
    fun getTabWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getTabWidth_ self
    fun getVisualColumn self iter = (GObjectObjectClass.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.UInt.C.fromVal) getVisualColumn_ (self & iter)
    fun setAutoIndent self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoIndent_ (self & enable)
    fun setDrawSpaces self flags = (GObjectObjectClass.C.withPtr &&&> GtkSourceDrawSpacesFlags.C.withVal ---> I) setDrawSpaces_ (self & flags)
    fun setHighlightCurrentLine self hl = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHighlightCurrentLine_ (self & hl)
    fun setIndentOnTab self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setIndentOnTab_ (self & enable)
    fun setIndentWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIndentWidth_ (self & width)
    fun setInsertSpacesInsteadOfTabs self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInsertSpacesInsteadOfTabs_ (self & enable)
    fun setMarkAttributes self category attributes priority =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setMarkAttributes_
        (
          self
           & category
           & attributes
           & priority
        )
    fun setRightMarginPosition self pos = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setRightMarginPosition_ (self & pos)
    fun setShowLineMarks self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineMarks_ (self & show)
    fun setShowLineNumbers self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowLineNumbers_ (self & show)
    fun setShowRightMargin self show = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowRightMargin_ (self & show)
    fun setSmartHomeEnd self smartHe = (GObjectObjectClass.C.withPtr &&&> GtkSourceSmartHomeEndType.C.withVal ---> I) setSmartHomeEnd_ (self & smartHe)
    fun setTabWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setTabWidth_ (self & width)
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
