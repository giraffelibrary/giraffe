structure GtkTextView :>
  GTK_TEXT_VIEW
    where type 'a class = 'a GtkTextViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    where type text_attributes_t = GtkTextAttributesRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a text_mark_class = 'a GtkTextMarkClass.class
    where type text_iter_t = GtkTextIterRecord.t
    where type text_window_type_t = GtkTextWindowType.t
    where type delete_type_t = GtkDeleteType.t
    where type movement_step_t = GtkMovementStep.t
    where type scroll_step_t = GtkScrollStep.t
    where type 'a menu_class = 'a GtkMenuClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type justification_t = GtkJustification.t
    where type wrap_mode_t = GtkWrapMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_text_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithBuffer_ = call (getSymbol "gtk_text_view_new_with_buffer") (GtkTextBufferClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val addChildAtAnchor_ =
        call (getSymbol "gtk_text_view_add_child_at_anchor")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkTextChildAnchorClass.PolyML.cPtr
             --> cVoid
          )
      val addChildInWindow_ =
        call (getSymbol "gtk_text_view_add_child_in_window")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkTextWindowType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val backwardDisplayLine_ = call (getSymbol "gtk_text_view_backward_display_line") (GtkTextViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardDisplayLineStart_ = call (getSymbol "gtk_text_view_backward_display_line_start") (GtkTextViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val bufferToWindowCoords_ =
        call (getSymbol "gtk_text_view_buffer_to_window_coords")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextWindowType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val forwardDisplayLine_ = call (getSymbol "gtk_text_view_forward_display_line") (GtkTextViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardDisplayLineEnd_ = call (getSymbol "gtk_text_view_forward_display_line_end") (GtkTextViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAcceptsTab_ = call (getSymbol "gtk_text_view_get_accepts_tab") (GtkTextViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBorderWindowSize_ = call (getSymbol "gtk_text_view_get_border_window_size") (GtkTextViewClass.PolyML.cPtr &&> GtkTextWindowType.PolyML.cVal --> GInt.PolyML.cVal)
      val getBuffer_ = call (getSymbol "gtk_text_view_get_buffer") (GtkTextViewClass.PolyML.cPtr --> GtkTextBufferClass.PolyML.cPtr)
      val getCursorLocations_ =
        call (getSymbol "gtk_text_view_get_cursor_locations")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getCursorVisible_ = call (getSymbol "gtk_text_view_get_cursor_visible") (GtkTextViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDefaultAttributes_ = call (getSymbol "gtk_text_view_get_default_attributes") (GtkTextViewClass.PolyML.cPtr --> GtkTextAttributesRecord.PolyML.cPtr)
      val getEditable_ = call (getSymbol "gtk_text_view_get_editable") (GtkTextViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIndent_ = call (getSymbol "gtk_text_view_get_indent") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIterAtLocation_ =
        call (getSymbol "gtk_text_view_get_iter_at_location")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getIterAtPosition_ =
        call (getSymbol "gtk_text_view_get_iter_at_position")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getIterLocation_ =
        call (getSymbol "gtk_text_view_get_iter_location")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getJustification_ = call (getSymbol "gtk_text_view_get_justification") (GtkTextViewClass.PolyML.cPtr --> GtkJustification.PolyML.cVal)
      val getLeftMargin_ = call (getSymbol "gtk_text_view_get_left_margin") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLineAtY_ =
        call (getSymbol "gtk_text_view_get_line_at_y")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getLineYrange_ =
        call (getSymbol "gtk_text_view_get_line_yrange")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getOverwrite_ = call (getSymbol "gtk_text_view_get_overwrite") (GtkTextViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPixelsAboveLines_ = call (getSymbol "gtk_text_view_get_pixels_above_lines") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPixelsBelowLines_ = call (getSymbol "gtk_text_view_get_pixels_below_lines") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPixelsInsideWrap_ = call (getSymbol "gtk_text_view_get_pixels_inside_wrap") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getRightMargin_ = call (getSymbol "gtk_text_view_get_right_margin") (GtkTextViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTabs_ = call (getSymbol "gtk_text_view_get_tabs") (GtkTextViewClass.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getVisibleRect_ = call (getSymbol "gtk_text_view_get_visible_rect") (GtkTextViewClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val getWindow_ = call (getSymbol "gtk_text_view_get_window") (GtkTextViewClass.PolyML.cPtr &&> GtkTextWindowType.PolyML.cVal --> GdkWindowClass.PolyML.cPtr)
      val getWindowType_ = call (getSymbol "gtk_text_view_get_window_type") (GtkTextViewClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> GtkTextWindowType.PolyML.cVal)
      val getWrapMode_ = call (getSymbol "gtk_text_view_get_wrap_mode") (GtkTextViewClass.PolyML.cPtr --> GtkWrapMode.PolyML.cVal)
      val imContextFilterKeypress_ = call (getSymbol "gtk_text_view_im_context_filter_keypress") (GtkTextViewClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveChild_ =
        call (getSymbol "gtk_text_view_move_child")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val moveMarkOnscreen_ = call (getSymbol "gtk_text_view_move_mark_onscreen") (GtkTextViewClass.PolyML.cPtr &&> GtkTextMarkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveVisually_ =
        call (getSymbol "gtk_text_view_move_visually")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val placeCursorOnscreen_ = call (getSymbol "gtk_text_view_place_cursor_onscreen") (GtkTextViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val resetImContext_ = call (getSymbol "gtk_text_view_reset_im_context") (GtkTextViewClass.PolyML.cPtr --> cVoid)
      val scrollMarkOnscreen_ = call (getSymbol "gtk_text_view_scroll_mark_onscreen") (GtkTextViewClass.PolyML.cPtr &&> GtkTextMarkClass.PolyML.cPtr --> cVoid)
      val scrollToIter_ =
        call (getSymbol "gtk_text_view_scroll_to_iter")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val scrollToMark_ =
        call (getSymbol "gtk_text_view_scroll_to_mark")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextMarkClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setAcceptsTab_ = call (getSymbol "gtk_text_view_set_accepts_tab") (GtkTextViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBorderWindowSize_ =
        call (getSymbol "gtk_text_view_set_border_window_size")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextWindowType.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setBuffer_ = call (getSymbol "gtk_text_view_set_buffer") (GtkTextViewClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cOptPtr --> cVoid)
      val setCursorVisible_ = call (getSymbol "gtk_text_view_set_cursor_visible") (GtkTextViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEditable_ = call (getSymbol "gtk_text_view_set_editable") (GtkTextViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIndent_ = call (getSymbol "gtk_text_view_set_indent") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setJustification_ = call (getSymbol "gtk_text_view_set_justification") (GtkTextViewClass.PolyML.cPtr &&> GtkJustification.PolyML.cVal --> cVoid)
      val setLeftMargin_ = call (getSymbol "gtk_text_view_set_left_margin") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setOverwrite_ = call (getSymbol "gtk_text_view_set_overwrite") (GtkTextViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPixelsAboveLines_ = call (getSymbol "gtk_text_view_set_pixels_above_lines") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setPixelsBelowLines_ = call (getSymbol "gtk_text_view_set_pixels_below_lines") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setPixelsInsideWrap_ = call (getSymbol "gtk_text_view_set_pixels_inside_wrap") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setRightMargin_ = call (getSymbol "gtk_text_view_set_right_margin") (GtkTextViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTabs_ = call (getSymbol "gtk_text_view_set_tabs") (GtkTextViewClass.PolyML.cPtr &&> PangoTabArrayRecord.PolyML.cPtr --> cVoid)
      val setWrapMode_ = call (getSymbol "gtk_text_view_set_wrap_mode") (GtkTextViewClass.PolyML.cPtr &&> GtkWrapMode.PolyML.cVal --> cVoid)
      val startsDisplayLine_ = call (getSymbol "gtk_text_view_starts_display_line") (GtkTextViewClass.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val windowToBufferCoords_ =
        call (getSymbol "gtk_text_view_window_to_buffer_coords")
          (
            GtkTextViewClass.PolyML.cPtr
             &&> GtkTextWindowType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
    end
    type 'a class = 'a GtkTextViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type text_attributes_t = GtkTextAttributesRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a text_mark_class = 'a GtkTextMarkClass.class
    type text_iter_t = GtkTextIterRecord.t
    type text_window_type_t = GtkTextWindowType.t
    type delete_type_t = GtkDeleteType.t
    type movement_step_t = GtkMovementStep.t
    type scroll_step_t = GtkScrollStep.t
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type justification_t = GtkJustification.t
    type wrap_mode_t = GtkWrapMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextViewClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkTextBufferClass.FFI.withPtr ---> GtkTextViewClass.FFI.fromPtr false) newWithBuffer_ buffer
    fun addChildAtAnchor self child anchor =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkTextChildAnchorClass.FFI.withPtr
         ---> I
      )
        addChildAtAnchor_
        (
          self
           & child
           & anchor
        )
    fun addChildInWindow self child whichWindow xpos ypos =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkTextWindowType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        addChildInWindow_
        (
          self
           & child
           & whichWindow
           & xpos
           & ypos
        )
    fun backwardDisplayLine self iter = (GtkTextViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardDisplayLine_ (self & iter)
    fun backwardDisplayLineStart self iter = (GtkTextViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardDisplayLineStart_ (self & iter)
    fun bufferToWindowCoords self win bufferX bufferY =
      let
        val windowX
         & windowY
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextWindowType.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            bufferToWindowCoords_
            (
              self
               & win
               & bufferX
               & bufferY
               & GInt.null
               & GInt.null
            )
      in
        (windowX, windowY)
      end
    fun forwardDisplayLine self iter = (GtkTextViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardDisplayLine_ (self & iter)
    fun forwardDisplayLineEnd self iter = (GtkTextViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardDisplayLineEnd_ (self & iter)
    fun getAcceptsTab self = (GtkTextViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getAcceptsTab_ self
    fun getBorderWindowSize self type' = (GtkTextViewClass.FFI.withPtr &&&> GtkTextWindowType.FFI.withVal ---> GInt.FFI.fromVal) getBorderWindowSize_ (self & type')
    fun getBuffer self = (GtkTextViewClass.FFI.withPtr ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getCursorLocations self iter =
      let
        val strong
         & weak
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withOptPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true
                   && GdkRectangleRecord.FFI.fromPtr true
                   && I
          )
            getCursorLocations_
            (
              self
               & iter
               & ()
               & ()
            )
      in
        (strong, weak)
      end
    fun getCursorVisible self = (GtkTextViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getCursorVisible_ self
    fun getDefaultAttributes self = (GtkTextViewClass.FFI.withPtr ---> GtkTextAttributesRecord.FFI.fromPtr true) getDefaultAttributes_ self
    fun getEditable self = (GtkTextViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getEditable_ self
    fun getIndent self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getIndent_ self
    fun getIterAtLocation self x y =
      let
        val iter & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && I
          )
            getIterAtLocation_
            (
              self
               & ()
               & x
               & y
            )
      in
        iter
      end
    fun getIterAtPosition self x y =
      let
        val iter
         & trailing
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && I
          )
            getIterAtPosition_
            (
              self
               & ()
               & GInt.null
               & x
               & y
            )
      in
        (iter, trailing)
      end
    fun getIterLocation self iter =
      let
        val location & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getIterLocation_
            (
              self
               & iter
               & ()
            )
      in
        location
      end
    fun getJustification self = (GtkTextViewClass.FFI.withPtr ---> GtkJustification.FFI.fromVal) getJustification_ self
    fun getLeftMargin self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getLeftMargin_ self
    fun getLineAtY self y =
      let
        val targetIter
         & lineTop
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && I
          )
            getLineAtY_
            (
              self
               & ()
               & y
               & GInt.null
            )
      in
        (targetIter, lineTop)
      end
    fun getLineYrange self iter =
      let
        val y
         & height
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextIterRecord.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & iter
               & GInt.null
               & GInt.null
            )
      in
        (y, height)
      end
    fun getOverwrite self = (GtkTextViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getOverwrite_ self
    fun getPixelsAboveLines self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getPixelsAboveLines_ self
    fun getPixelsBelowLines self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getPixelsBelowLines_ self
    fun getPixelsInsideWrap self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getPixelsInsideWrap_ self
    fun getRightMargin self = (GtkTextViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getRightMargin_ self
    fun getTabs self = (GtkTextViewClass.FFI.withPtr ---> PangoTabArrayRecord.FFI.fromPtr true) getTabs_ self
    fun getVisibleRect self =
      let
        val visibleRect & () = (GtkTextViewClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun getWindow self win = (GtkTextViewClass.FFI.withPtr &&&> GtkTextWindowType.FFI.withVal ---> GdkWindowClass.FFI.fromPtr false) getWindow_ (self & win)
    fun getWindowType self window = (GtkTextViewClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> GtkTextWindowType.FFI.fromVal) getWindowType_ (self & window)
    fun getWrapMode self = (GtkTextViewClass.FFI.withPtr ---> GtkWrapMode.FFI.fromVal) getWrapMode_ self
    fun imContextFilterKeypress self event = (GtkTextViewClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) imContextFilterKeypress_ (self & event)
    fun moveChild self child xpos ypos =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        moveChild_
        (
          self
           & child
           & xpos
           & ypos
        )
    fun moveMarkOnscreen self mark = (GtkTextViewClass.FFI.withPtr &&&> GtkTextMarkClass.FFI.withPtr ---> GBool.FFI.fromVal) moveMarkOnscreen_ (self & mark)
    fun moveVisually self iter count =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        moveVisually_
        (
          self
           & iter
           & count
        )
    fun placeCursorOnscreen self = (GtkTextViewClass.FFI.withPtr ---> GBool.FFI.fromVal) placeCursorOnscreen_ self
    fun resetImContext self = (GtkTextViewClass.FFI.withPtr ---> I) resetImContext_ self
    fun scrollMarkOnscreen self mark = (GtkTextViewClass.FFI.withPtr &&&> GtkTextMarkClass.FFI.withPtr ---> I) scrollMarkOnscreen_ (self & mark)
    fun scrollToIter self iter withinMargin useAlign xalign yalign =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        scrollToIter_
        (
          self
           & iter
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun scrollToMark self mark withinMargin useAlign xalign yalign =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkTextMarkClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        scrollToMark_
        (
          self
           & mark
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun setAcceptsTab self acceptsTab = (GtkTextViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAcceptsTab_ (self & acceptsTab)
    fun setBorderWindowSize self type' size =
      (
        GtkTextViewClass.FFI.withPtr
         &&&> GtkTextWindowType.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setBorderWindowSize_
        (
          self
           & type'
           & size
        )
    fun setBuffer self buffer = (GtkTextViewClass.FFI.withPtr &&&> GtkTextBufferClass.FFI.withOptPtr ---> I) setBuffer_ (self & buffer)
    fun setCursorVisible self setting = (GtkTextViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCursorVisible_ (self & setting)
    fun setEditable self setting = (GtkTextViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEditable_ (self & setting)
    fun setIndent self indent = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setIndent_ (self & indent)
    fun setJustification self justification = (GtkTextViewClass.FFI.withPtr &&&> GtkJustification.FFI.withVal ---> I) setJustification_ (self & justification)
    fun setLeftMargin self leftMargin = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLeftMargin_ (self & leftMargin)
    fun setOverwrite self overwrite = (GtkTextViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOverwrite_ (self & overwrite)
    fun setPixelsAboveLines self pixelsAboveLines = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPixelsAboveLines_ (self & pixelsAboveLines)
    fun setPixelsBelowLines self pixelsBelowLines = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPixelsBelowLines_ (self & pixelsBelowLines)
    fun setPixelsInsideWrap self pixelsInsideWrap = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPixelsInsideWrap_ (self & pixelsInsideWrap)
    fun setRightMargin self rightMargin = (GtkTextViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setRightMargin_ (self & rightMargin)
    fun setTabs self tabs = (GtkTextViewClass.FFI.withPtr &&&> PangoTabArrayRecord.FFI.withPtr ---> I) setTabs_ (self & tabs)
    fun setWrapMode self wrapMode = (GtkTextViewClass.FFI.withPtr &&&> GtkWrapMode.FFI.withVal ---> I) setWrapMode_ (self & wrapMode)
    fun startsDisplayLine self iter = (GtkTextViewClass.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsDisplayLine_ (self & iter)
    fun windowToBufferCoords self win windowX windowY =
      let
        val bufferX
         & bufferY
         & () =
          (
            GtkTextViewClass.FFI.withPtr
             &&&> GtkTextWindowType.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            windowToBufferCoords_
            (
              self
               & win
               & windowX
               & windowY
               & GInt.null
               & GInt.null
            )
      in
        (bufferX, bufferY)
      end
    local
      open ClosureMarshal Signal
    in
      fun backspaceSig f = signal "backspace" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cutClipboardSig f = signal "cut-clipboard" (void ---> ret_void) f
      fun deleteFromCursorSig f = signal "delete-from-cursor" (get 0w1 GtkDeleteType.t &&&> get 0w2 int ---> ret_void) (fn type' & count => f type' count)
      fun insertAtCursorSig f = signal "insert-at-cursor" (get 0w1 string ---> ret_void) f
      fun moveCursorSig f =
        signal "move-cursor"
          (
            get 0w1 GtkMovementStep.t
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             ---> ret_void
          )
          (
            fn
              step
               & count
               & extendSelection =>
                f step count extendSelection
          )
      fun moveViewportSig f = signal "move-viewport" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & count => f step count)
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t ---> ret_void) f
      fun preeditChangedSig f = signal "preedit-changed" (get 0w1 string ---> ret_void) f
      fun selectAllSig f = signal "select-all" (get 0w1 boolean ---> ret_void) f
      fun setAnchorSig f = signal "set-anchor" (void ---> ret_void) f
      fun toggleCursorVisibleSig f = signal "toggle-cursor-visible" (void ---> ret_void) f
      fun toggleOverwriteSig f = signal "toggle-overwrite" (void ---> ret_void) f
    end
    local
      open Property
    in
      val acceptsTabProp =
        {
          get = fn x => get "accepts-tab" boolean x,
          set = fn x => set "accepts-tab" boolean x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkTextBufferClass.tOpt x,
          set = fn x => set "buffer" GtkTextBufferClass.tOpt x
        }
      val cursorVisibleProp =
        {
          get = fn x => get "cursor-visible" boolean x,
          set = fn x => set "cursor-visible" boolean x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x
        }
      val imModuleProp =
        {
          get = fn x => get "im-module" stringOpt x,
          set = fn x => set "im-module" stringOpt x
        }
      val indentProp =
        {
          get = fn x => get "indent" int x,
          set = fn x => set "indent" int x
        }
      val justificationProp =
        {
          get = fn x => get "justification" GtkJustification.t x,
          set = fn x => set "justification" GtkJustification.t x
        }
      val leftMarginProp =
        {
          get = fn x => get "left-margin" int x,
          set = fn x => set "left-margin" int x
        }
      val overwriteProp =
        {
          get = fn x => get "overwrite" boolean x,
          set = fn x => set "overwrite" boolean x
        }
      val pixelsAboveLinesProp =
        {
          get = fn x => get "pixels-above-lines" int x,
          set = fn x => set "pixels-above-lines" int x
        }
      val pixelsBelowLinesProp =
        {
          get = fn x => get "pixels-below-lines" int x,
          set = fn x => set "pixels-below-lines" int x
        }
      val pixelsInsideWrapProp =
        {
          get = fn x => get "pixels-inside-wrap" int x,
          set = fn x => set "pixels-inside-wrap" int x
        }
      val rightMarginProp =
        {
          get = fn x => get "right-margin" int x,
          set = fn x => set "right-margin" int x
        }
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x
        }
    end
  end
