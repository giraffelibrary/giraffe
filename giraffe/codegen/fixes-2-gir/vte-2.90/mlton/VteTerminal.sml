structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class = 'a VteTerminalClass.class
    where type pty_flags_t = VtePtyFlags.t
    where type terminal_write_flags_t = VteTerminalWriteFlags.t
    where type terminal_cursor_blink_mode_t = VteTerminalCursorBlinkMode.t
    where type terminal_cursor_shape_t = VteTerminalCursorShape.t
    where type terminal_erase_binding_t = VteTerminalEraseBinding.t
    where type 'a pty_class = 'a VtePtyClass.class =
  struct
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.C.notnull VteTerminalClass.C.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Long.C.val_
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Long.C.val_
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Long.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val forkCommandFull_ =
      fn x1 & x2 & (x3, x4) & (x5, x6) & (x7, x8) & x9 & x10 & x11 =>
        (
          _import "giraffe_vte_terminal_fork_command_full" :
            GObjectObjectClass.C.notnull GObjectObjectClass.C.p
             * VtePtyFlags.C.val_
             * Utf8.MLton.p1
             * unit Utf8.MLton.p2
             * Utf8CVector.MLton.p1
             * Utf8CVector.C.notnull Utf8CVector.MLton.p2
             * Utf8CVector.MLton.p1
             * unit Utf8CVector.MLton.p2
             * GLibSpawnFlags.C.val_
             * GLibPid.C.ref_
             * (unit, unit) GLibErrorRecord.C.r
             -> FFI.Bool.C.val_;
        )
          (
            x1,
            x2,
            x3,
            x4,
            x5,
            x6,
            x7,
            x8,
            x9,
            x10,
            x11
          )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getChildExitStatus_ = _import "vte_terminal_get_child_exit_status" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Int.C.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VteTerminalCursorBlinkMode.C.val_;
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VteTerminalCursorShape.C.val_;
    val getDefaultEmulation_ = _import "vte_terminal_get_default_emulation" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEmulation_ = _import "vte_terminal_get_emulation" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFont_ = _import "vte_terminal_get_font" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getPtyObject_ = _import "vte_terminal_get_pty_object" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VtePtyClass.C.notnull VtePtyClass.C.p;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getStatusLine_ = _import "vte_terminal_get_status_line" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVisibleBell_ = _import "vte_terminal_get_visible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val imAppendMenuitems_ = fn x1 & x2 => (_import "vte_terminal_im_append_menuitems" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GtkMenuShellClass.C.notnull GtkMenuShellClass.C.p -> unit;) (x1, x2)
    val isWordChar_ = fn x1 & x2 => (_import "vte_terminal_is_word_char" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Char.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * GLibRegexMatchFlags.C.val_
               -> FFI.Int.C.val_;
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Long.C.val_
               * FFI.Long.C.val_
               * FFI.Int.C.ref_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchClearAll_ = _import "vte_terminal_match_clear_all" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Int.C.val_
               * unit GdkCursorClass.C.p
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Int.C.val_
               * GdkCursorType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val ptyNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_pty_new" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * VtePtyFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> VtePtyClass.C.notnull VtePtyClass.C.p;
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchFindNext_ = _import "vte_terminal_search_find_next" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> GLibRegexRecord.C.notnull GLibRegexRecord.C.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchSetGregex_ = fn x1 & x2 => (_import "vte_terminal_search_set_gregex" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GLibRegexRecord.C.p -> unit;) (x1, x2)
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val selectNone_ = _import "vte_terminal_select_none" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBackgroundImage_ = fn x1 & x2 => (_import "vte_terminal_set_background_image" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val setBackgroundImageFile_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_background_image_file" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBackgroundSaturation_ = fn x1 & x2 => (_import "vte_terminal_set_background_saturation" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setBackgroundTintColor_ = fn x1 & x2 => (_import "vte_terminal_set_background_tint_color" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setBackgroundTransparent_ = fn x1 & x2 => (_import "vte_terminal_set_background_transparent" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteTerminalEraseBinding.C.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorBackgroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_background_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorBoldRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorCursorRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorDim_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorDimRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkColorRecord.C.p -> unit;) (x1, x2)
    val setColorHighlightRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_rgba" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColors_ =
      fn
        x1 & x2 & x3 =>
          (
            _import "giraffe_vte_terminal_set_colors" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GdkColorRecord.C.p
               * unit GdkColorRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteTerminalCursorBlinkMode.C.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteTerminalCursorShape.C.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteTerminalEraseBinding.C.val_ -> unit;) (x1, x2)
    val setEmulation_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_emulation" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setFontFromString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_font_from_string" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "vte_terminal_set_opacity" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.UInt16.C.val_ -> unit;) (x1, x2)
    val setPtyObject_ = fn x1 & x2 => (_import "vte_terminal_set_pty_object" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit VtePtyClass.C.p -> unit;) (x1, x2)
    val setScrollBackground_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_background" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Long.C.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Long.C.val_
               * FFI.Long.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_visible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWordChars_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_chars" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GLibPid.C.val_ -> unit;) (x1, x2)
    val writeContents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * VteTerminalWriteFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a VteTerminalClass.class
    type pty_flags_t = VtePtyFlags.t
    type terminal_write_flags_t = VteTerminalWriteFlags.t
    type terminal_cursor_blink_mode_t = VteTerminalCursorBlinkMode.t
    type terminal_cursor_shape_t = VteTerminalCursorShape.t
    type terminal_erase_binding_t = VteTerminalEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.C.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.C.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.C.withPtr ---> I) copyPrimary_ self
    fun feed self data length =
      (
        VteTerminalClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Long.C.withVal
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
        VteTerminalClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Long.C.withVal
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
        VteTerminalClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Long.C.withVal
         ---> I
      )
        feedChildBinary_
        (
          self
           & data
           & length
        )
    fun forkCommandFull self ptyFlags workingDirectory argv envv spawnFlags =
      let
        val childPid & _ =
          (
            VteTerminalClass.C.withPtr
             &&&> VtePtyFlags.C.withVal
             &&&> Utf8.C.withOptPtr
             &&&> Utf8CVector.C.withPtr
             &&&> Utf8CVector.C.withOptPtr
             &&&> GLibSpawnFlags.C.withVal
             &&&> GLibPid.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GLibPid.C.fromVal
                   && I
          )
            forkCommandFull_
            (
              self
               & ptyFlags
               & workingDirectory
               & argv
               & envv
               & spawnFlags
               & GLibPid.null 
               & [GLibSpawnError.handler]
            )
      in
        childPid
      end
    fun getAllowBold self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (VteTerminalClass.C.withPtr ---> FFI.Int.C.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getColumnCount_ self
    fun getCursorBlinkMode self = (VteTerminalClass.C.withPtr ---> VteTerminalCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorShape self = (VteTerminalClass.C.withPtr ---> VteTerminalCursorShape.C.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultEmulation_ self
    fun getEmulation self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getEmulation_ self
    fun getEncoding self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFont self = (VteTerminalClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getHasSelection self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getIconTitle_ self
    fun getMouseAutohide self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (VteTerminalClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPtyObject_ self
    fun getRowCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getStatusLine self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getStatusLine_ self
    fun getVisibleBell self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getWindowTitle_ self
    fun imAppendMenuitems self menushell = (VteTerminalClass.C.withPtr &&&> GtkMenuShellClass.C.withPtr ---> I) imAppendMenuitems_ (self & menushell)
    fun isWordChar self c = (VteTerminalClass.C.withPtr &&&> FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self regex flags =
      (
        VteTerminalClass.C.withPtr
         &&&> GLibRegexRecord.C.withPtr
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Int.C.fromVal
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
            VteTerminalClass.C.withPtr
             &&&> FFI.Long.C.withVal
             &&&> FFI.Long.C.withVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal && Utf8.C.fromPtr true
          )
            matchCheck_
            (
              self
               & column
               & row
               & FFI.Int.null
            )
      in
        (retVal, tag)
      end
    fun matchClearAll self = (VteTerminalClass.C.withPtr ---> I) matchClearAll_ self
    fun matchRemove self tag = (VteTerminalClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self tag cursor =
      (
        VteTerminalClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GdkCursorClass.C.withOptPtr
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
        VteTerminalClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
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
        VteTerminalClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GdkCursorType.C.withVal
         ---> I
      )
        matchSetCursorType_
        (
          self
           & tag
           & cursorType
        )
    fun pasteClipboard self = (VteTerminalClass.C.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (VteTerminalClass.C.withPtr ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        VteTerminalClass.C.withPtr
         &&&> VtePtyFlags.C.withVal
         &&&> GLibErrorRecord.handleError
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
        VteTerminalClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        reset_
        (
          self
           & clearTabstops
           & clearHistory
        )
    fun searchFindNext self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (VteTerminalClass.C.withPtr ---> GLibRegexRecord.C.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (VteTerminalClass.C.withPtr &&&> GLibRegexRecord.C.withOptPtr ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.C.withPtr ---> I) selectAll_ self
    fun selectNone self = (VteTerminalClass.C.withPtr ---> I) selectNone_ self
    fun setAllowBold self allowBold = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackgroundImage self image = (VteTerminalClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> I) setBackgroundImage_ (self & image)
    fun setBackgroundImageFile self path = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setBackgroundImageFile_ (self & path)
    fun setBackgroundSaturation self saturation = (VteTerminalClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setBackgroundSaturation_ (self & saturation)
    fun setBackgroundTintColor self color = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundTintColor_ (self & color)
    fun setBackgroundTransparent self transparent = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBackgroundTransparent_ (self & transparent)
    fun setBackspaceBinding self binding = (VteTerminalClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setColorBackground self background = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBackgroundRgba self background = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorBackgroundRgba_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBold_ (self & bold)
    fun setColorBoldRgba self bold = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorBoldRgba_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorRgba self cursorBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorCursorRgba_ (self & cursorBackground)
    fun setColorDim self dim = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorDim_ (self & dim)
    fun setColorDimRgba self dim = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorDimRgba_ (self & dim)
    fun setColorForeground self foreground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorForegroundRgba self foreground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorForegroundRgba_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightRgba self highlightBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlightRgba_ (self & highlightBackground)
    fun setColors self foreground background =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkColorRecord.C.withOptPtr
         &&&> GdkColorRecord.C.withOptPtr
         ---> I
      )
        setColors_
        (
          self
           & foreground
           & background
        )
    fun setCursorBlinkMode self mode = (VteTerminalClass.C.withPtr &&&> VteTerminalCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.C.withPtr &&&> VteTerminalCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (VteTerminalClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (VteTerminalClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (VteTerminalClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setOpacity self opacity = (VteTerminalClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPtyObject self pty = (VteTerminalClass.C.withPtr &&&> VtePtyClass.C.withOptPtr ---> I) setPtyObject_ (self & pty)
    fun setScrollBackground self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollBackground_ (self & scroll)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (VteTerminalClass.C.withPtr &&&> FFI.Long.C.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self columns rows =
      (
        VteTerminalClass.C.withPtr
         &&&> FFI.Long.C.withVal
         &&&> FFI.Long.C.withVal
         ---> I
      )
        setSize_
        (
          self
           & columns
           & rows
        )
    fun setVisibleBell self isVisible = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (VteTerminalClass.C.withPtr &&&> GLibPid.C.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents self stream flags cancellable =
      (
        VteTerminalClass.C.withPtr
         &&&> GioOutputStreamClass.C.withPtr
         &&&> VteTerminalWriteFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
