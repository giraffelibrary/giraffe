structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class_t = 'a VteTerminalClass.t
    where type ptyflags_t = VtePtyFlags.t
    where type terminalwriteflags_t = VteTerminalWriteFlags.t
    where type terminalcursorblinkmode_t = VteTerminalCursorBlinkMode.t
    where type terminalcursorshape_t = VteTerminalCursorShape.t
    where type terminalerasebinding_t = VteTerminalEraseBinding.t
    where type 'a ptyclass_t = 'a VtePtyClass.t =
  struct
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "vte_terminal_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val feedChild_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val feedChildBinary_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed_child_binary" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val getChildExitStatus_ = _import "vte_terminal_get_child_exit_status" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> VteTerminalCursorBlinkMode.C.val_;
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> VteTerminalCursorShape.C.val_;
    val getDefaultEmulation_ = _import "vte_terminal_get_default_emulation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getEmulation_ = _import "vte_terminal_get_emulation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getEncoding_ = _import "vte_terminal_get_encoding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getFont_ = _import "vte_terminal_get_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getPtyObject_ = _import "vte_terminal_get_pty_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getRowCount_ = _import "vte_terminal_get_row_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val getStatusLine_ = _import "vte_terminal_get_status_line" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getVisibleBell_ = _import "vte_terminal_get_visible_bell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val imAppendMenuitems_ = fn x1 & x2 => (_import "vte_terminal_im_append_menuitems" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val isWordChar_ = fn x1 & x2 => (_import "vte_terminal_is_word_char" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Char.val_ -> FFI.Bool.val_;) (x1, x2)
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * GLibRegexMatchFlags.C.val_
               -> FFI.Int32.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val matchCheck_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_terminal_match_check" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.val_
               * FFI.Int64.val_
               * FFI.Int32.ref_
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchClearAll_ = _import "vte_terminal_match_clear_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val matchSetCursorName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_vte_terminal_match_set_cursor_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchSetCursorType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * GdkCursorType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val ptyNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_pty_new" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * VtePtyFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val reset_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_reset" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.val_
               * FFI.Bool.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchFindNext_ = _import "vte_terminal_search_find_next" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GLibRegexRecord.C.notnull GLibRegexRecord.C.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val searchSetGregex_ = fn x1 & x2 => (_import "vte_terminal_search_set_gregex" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GLibRegexRecord.C.p -> unit;) (x1, x2)
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val selectNone_ = _import "vte_terminal_select_none" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setBackgroundImage_ = fn x1 & x2 => (_import "vte_terminal_set_background_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setBackgroundImageFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_background_image_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackgroundSaturation_ = fn x1 & x2 => (_import "vte_terminal_set_background_saturation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.val_ -> unit;) (x1, x2)
    val setBackgroundTintColor_ = fn x1 & x2 => (_import "vte_terminal_set_background_tint_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setBackgroundTransparent_ = fn x1 & x2 => (_import "vte_terminal_set_background_transparent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * VteTerminalEraseBinding.C.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorBackgroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_background_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorBoldRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorCursorRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorDim_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorDimRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorHighlightRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * VteTerminalCursorBlinkMode.C.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * VteTerminalCursorShape.C.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * VteTerminalEraseBinding.C.val_ -> unit;) (x1, x2)
    val setEmulation_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_emulation" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEncoding_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_encoding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setFontFromString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_font_from_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "vte_terminal_set_opacity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt16.val_ -> unit;) (x1, x2)
    val setPtyObject_ = fn x1 & x2 => (_import "vte_terminal_set_pty_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setScrollBackground_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_background" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int64.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.val_
               * FFI.Int64.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_visible_bell" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setWordChars_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_chars" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val writeContents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * VteTerminalWriteFlags.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class_t = 'a VteTerminalClass.t
    type ptyflags_t = VtePtyFlags.t
    type terminalwriteflags_t = VteTerminalWriteFlags.t
    type terminalcursorblinkmode_t = VteTerminalCursorBlinkMode.t
    type terminalcursorshape_t = VteTerminalCursorShape.t
    type terminalerasebinding_t = VteTerminalEraseBinding.t
    type 'a ptyclass_t = 'a VtePtyClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.C.fromPtr false) new_ ()
    fun copyClipboard self = (GObjectObjectClass.C.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (GObjectObjectClass.C.withPtr ---> I) copyPrimary_ self
    fun feed self data length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         ---> I
      )
        feed_
        (
          self
           & data
           & length
        )
    fun feedChild self text length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         ---> I
      )
        feedChild_
        (
          self
           & text
           & length
        )
    fun feedChildBinary self data length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         ---> I
      )
        feedChildBinary_
        (
          self
           & data
           & length
        )
    fun getAllowBold self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getAllowBold_ self
    fun getAudibleBell self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getAudibleBell_ self
    fun getCharHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getCharHeight_ self
    fun getCharWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getColumnCount_ self
    fun getCursorBlinkMode self = (GObjectObjectClass.C.withPtr ---> VteTerminalCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorShape self = (GObjectObjectClass.C.withPtr ---> VteTerminalCursorShape.C.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDefaultEmulation_ self
    fun getEmulation self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getEmulation_ self
    fun getEncoding self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getEncoding_ self
    fun getFont self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getHasSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHasSelection_ self
    fun getIconTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getIconTitle_ self
    fun getMouseAutohide self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (GObjectObjectClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPtyObject_ self
    fun getRowCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getRowCount_ self
    fun getStatusLine self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getStatusLine_ self
    fun getVisibleBell self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getWindowTitle_ self
    fun imAppendMenuitems self menushell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) imAppendMenuitems_ (self & menushell)
    fun isWordChar self c = (GObjectObjectClass.C.withPtr &&&> FFI.Char.withVal ---> FFI.Bool.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self regex flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibRegexRecord.C.withPtr
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Int32.fromVal
      )
        matchAddGregex_
        (
          self
           & regex
           & flags
        )
    fun matchCheck self column row =
      let
        val tag & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int64.withVal
             &&&> FFI.Int64.withVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal && FFI.String.fromPtr true
          )
            matchCheck_
            (
              self
               & column
               & row
               & 0
            )
      in
        (retVal, tag)
      end
    fun matchClearAll self = (GObjectObjectClass.C.withPtr ---> I) matchClearAll_ self
    fun matchRemove self tag = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self tag cursor =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        matchSetCursor_
        (
          self
           & tag
           & cursor
        )
    fun matchSetCursorName self tag cursorName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        matchSetCursorName_
        (
          self
           & tag
           & cursorName
        )
    fun matchSetCursorType self tag cursorType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> GdkCursorType.C.withVal
         ---> I
      )
        matchSetCursorType_
        (
          self
           & tag
           & cursorType
        )
    fun pasteClipboard self = (GObjectObjectClass.C.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (GObjectObjectClass.C.withPtr ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> VtePtyFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> VtePtyClass.C.fromPtr true
      )
        ptyNew_
        (
          self
           & flags
           & []
        )
    fun reset self clearTabstops clearHistory =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Bool.withVal
         ---> I
      )
        reset_
        (
          self
           & clearTabstops
           & clearHistory
        )
    fun searchFindNext self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (GObjectObjectClass.C.withPtr ---> GLibRegexRecord.C.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (GObjectObjectClass.C.withPtr &&&> GLibRegexRecord.C.withOptPtr ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectNone self = (GObjectObjectClass.C.withPtr ---> I) selectNone_ self
    fun setAllowBold self allowBold = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackgroundImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setBackgroundImage_ (self & image)
    fun setBackgroundImageFile self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setBackgroundImageFile_ (self & path)
    fun setBackgroundSaturation self saturation = (GObjectObjectClass.C.withPtr &&&> FFI.Double.withVal ---> I) setBackgroundSaturation_ (self & saturation)
    fun setBackgroundTintColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundTintColor_ (self & color)
    fun setBackgroundTransparent self transparent = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setBackgroundTransparent_ (self & transparent)
    fun setBackspaceBinding self binding = (GObjectObjectClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setColorBackground self background = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBackgroundRgba self background = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorBackgroundRgba_ (self & background)
    fun setColorBold self bold = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBold_ (self & bold)
    fun setColorBoldRgba self bold = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorBoldRgba_ (self & bold)
    fun setColorCursor self cursorBackground = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorRgba self cursorBackground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorCursorRgba_ (self & cursorBackground)
    fun setColorDim self dim = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorDim_ (self & dim)
    fun setColorDimRgba self dim = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorDimRgba_ (self & dim)
    fun setColorForeground self foreground = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorForegroundRgba self foreground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorForegroundRgba_ (self & foreground)
    fun setColorHighlight self highlightBackground = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightRgba self highlightBackground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlightRgba_ (self & highlightBackground)
    fun setCursorBlinkMode self mode = (GObjectObjectClass.C.withPtr &&&> VteTerminalCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (GObjectObjectClass.C.withPtr &&&> VteTerminalCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (GObjectObjectClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (GObjectObjectClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.withVal ---> I) setOpacity_ (self & opacity)
    fun setPtyObject self pty = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setPtyObject_ (self & pty)
    fun setScrollBackground self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setScrollBackground_ (self & scroll)
    fun setScrollOnKeystroke self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (GObjectObjectClass.C.withPtr &&&> FFI.Int64.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self columns rows =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.Int64.withVal
         ---> I
      )
        setSize_
        (
          self
           & columns
           & rows
        )
    fun setVisibleBell self isVisible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents self stream flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> VteTerminalWriteFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        writeContents_
        (
          self
           & stream
           & flags
           & cancellable
           & []
        )
    local
      open ClosureMarshal Signal
    in
      fun beepSig f = signal "beep" (void ---> ret_void) f
      fun charSizeChangedSig f = signal "char-size-changed" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f width height)
      fun childExitedSig f = signal "child-exited" (void ---> ret_void) f
      fun commitSig f = signal "commit" (get 0w1 string &&&> get 0w2 uint ---> ret_void) (fn text & size => f text size)
      fun contentsChangedSig f = signal "contents-changed" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cursorMovedSig f = signal "cursor-moved" (void ---> ret_void) f
      fun decreaseFontSizeSig f = signal "decrease-font-size" (void ---> ret_void) f
      fun deiconifyWindowSig f = signal "deiconify-window" (void ---> ret_void) f
      fun emulationChangedSig f = signal "emulation-changed" (void ---> ret_void) f
      fun encodingChangedSig f = signal "encoding-changed" (void ---> ret_void) f
      fun eofSig f = signal "eof" (void ---> ret_void) f
      fun iconTitleChangedSig f = signal "icon-title-changed" (void ---> ret_void) f
      fun iconifyWindowSig f = signal "iconify-window" (void ---> ret_void) f
      fun increaseFontSizeSig f = signal "increase-font-size" (void ---> ret_void) f
      fun lowerWindowSig f = signal "lower-window" (void ---> ret_void) f
      fun maximizeWindowSig f = signal "maximize-window" (void ---> ret_void) f
      fun moveWindowSig f = signal "move-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn x & y => f x y)
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun raiseWindowSig f = signal "raise-window" (void ---> ret_void) f
      fun refreshWindowSig f = signal "refresh-window" (void ---> ret_void) f
      fun resizeWindowSig f = signal "resize-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f width height)
      fun restoreWindowSig f = signal "restore-window" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
      fun statusLineChangedSig f = signal "status-line-changed" (void ---> ret_void) f
      fun textDeletedSig f = signal "text-deleted" (void ---> ret_void) f
      fun textInsertedSig f = signal "text-inserted" (void ---> ret_void) f
      fun textModifiedSig f = signal "text-modified" (void ---> ret_void) f
      fun textScrolledSig f = signal "text-scrolled" (get 0w1 int ---> ret_void) f
      fun windowTitleChangedSig f = signal "window-title-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val allowBoldProp =
        {
          get = fn x => get "allow-bold" boolean x,
          set = fn x => set "allow-bold" boolean x
        }
      val audibleBellProp =
        {
          get = fn x => get "audible-bell" boolean x,
          set = fn x => set "audible-bell" boolean x
        }
      val backgroundImageFileProp =
        {
          get = fn x => get "background-image-file" stringOpt x,
          set = fn x => set "background-image-file" stringOpt x
        }
      val backgroundImagePixbufProp =
        {
          get = fn x => get "background-image-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "background-image-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val backgroundOpacityProp =
        {
          get = fn x => get "background-opacity" double x,
          set = fn x => set "background-opacity" double x
        }
      val backgroundSaturationProp =
        {
          get = fn x => get "background-saturation" double x,
          set = fn x => set "background-saturation" double x
        }
      val backgroundTintColorProp =
        {
          get = fn x => get "background-tint-color" GdkColorRecord.tOpt x,
          set = fn x => set "background-tint-color" GdkColorRecord.tOpt x
        }
      val backgroundTransparentProp =
        {
          get = fn x => get "background-transparent" boolean x,
          set = fn x => set "background-transparent" boolean x
        }
      val backspaceBindingProp =
        {
          get = fn x => get "backspace-binding" VteTerminalEraseBinding.t x,
          set = fn x => set "backspace-binding" VteTerminalEraseBinding.t x
        }
      val cursorBlinkModeProp =
        {
          get = fn x => get "cursor-blink-mode" VteTerminalCursorBlinkMode.t x,
          set = fn x => set "cursor-blink-mode" VteTerminalCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          get = fn x => get "cursor-shape" VteTerminalCursorShape.t x,
          set = fn x => set "cursor-shape" VteTerminalCursorShape.t x
        }
      val deleteBindingProp =
        {
          get = fn x => get "delete-binding" VteTerminalEraseBinding.t x,
          set = fn x => set "delete-binding" VteTerminalEraseBinding.t x
        }
      val emulationProp =
        {
          get = fn x => get "emulation" stringOpt x,
          set = fn x => set "emulation" stringOpt x
        }
      val encodingProp =
        {
          get = fn x => get "encoding" stringOpt x,
          set = fn x => set "encoding" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val iconTitleProp = {get = fn x => get "icon-title" stringOpt x}
      val pointerAutohideProp =
        {
          get = fn x => get "pointer-autohide" boolean x,
          set = fn x => set "pointer-autohide" boolean x
        }
      val ptyProp =
        {
          get = fn x => get "pty" int x,
          set = fn x => set "pty" int x
        }
      val ptyObjectProp =
        {
          get = fn x => get "pty-object" VtePtyClass.tOpt x,
          set = fn x => set "pty-object" VtePtyClass.tOpt x
        }
      val scrollBackgroundProp =
        {
          get = fn x => get "scroll-background" boolean x,
          set = fn x => set "scroll-background" boolean x
        }
      val scrollOnKeystrokeProp =
        {
          get = fn x => get "scroll-on-keystroke" boolean x,
          set = fn x => set "scroll-on-keystroke" boolean x
        }
      val scrollOnOutputProp =
        {
          get = fn x => get "scroll-on-output" boolean x,
          set = fn x => set "scroll-on-output" boolean x
        }
      val scrollbackLinesProp =
        {
          get = fn x => get "scrollback-lines" uint x,
          set = fn x => set "scrollback-lines" uint x
        }
      val visibleBellProp =
        {
          get = fn x => get "visible-bell" boolean x,
          set = fn x => set "visible-bell" boolean x
        }
      val windowTitleProp = {get = fn x => get "window-title" stringOpt x}
      val wordCharsProp =
        {
          get = fn x => get "word-chars" stringOpt x,
          set = fn x => set "word-chars" stringOpt x
        }
    end
  end
