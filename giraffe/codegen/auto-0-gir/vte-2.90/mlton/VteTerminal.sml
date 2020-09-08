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
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GLong.FFI.val_
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLong.FFI.val_
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLong.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getChildExitStatus_ = _import "vte_terminal_get_child_exit_status" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt.FFI.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteTerminalCursorBlinkMode.FFI.val_;
    val getCursorPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_get_cursor_position" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GLong.FFI.ref_
               * GLong.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteTerminalCursorShape.FFI.val_;
    val getDefaultEmulation_ = _import "vte_terminal_get_default_emulation" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEmulation_ = _import "vte_terminal_get_emulation" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFont_ = _import "vte_terminal_get_font" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getPtyObject_ = _import "vte_terminal_get_pty_object" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getStatusLine_ = _import "vte_terminal_get_status_line" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getVisibleBell_ = _import "vte_terminal_get_visible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val isWordChar_ = fn x1 & x2 => (_import "vte_terminal_is_word_char" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GChar.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GLibRegexRecord.FFI.non_opt GLibRegexRecord.FFI.p
               * GLibRegexMatchFlags.FFI.val_
               -> GInt.FFI.val_;
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GInt.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchClearAll_ = _import "vte_terminal_match_clear_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * GdkCursorClass.FFI.opt GdkCursorClass.FFI.p
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * GdkCursorType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val ptyNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_pty_new" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * VtePtyFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchFindNext_ = _import "vte_terminal_search_find_next" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLibRegexRecord.FFI.non_opt GLibRegexRecord.FFI.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchSetGregex_ = fn x1 & x2 => (_import "vte_terminal_search_set_gregex" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLibRegexRecord.FFI.opt GLibRegexRecord.FFI.p -> unit;) (x1, x2)
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val selectNone_ = _import "vte_terminal_select_none" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBackgroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_background_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBoldRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursorRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorDim_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorDimRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_rgba" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColors_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_vte_terminal_set_colors" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               * GdkColorRecordCArrayN.MLton.p1
               * GdkColorRecordCArrayN.FFI.non_opt GdkColorRecordCArrayN.MLton.p2
               * GLong.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setColorsRgba_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_vte_terminal_set_colors_rgba" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecordCArrayN.MLton.p1
               * GdkRgbaRecordCArrayN.FFI.non_opt GdkRgbaRecordCArrayN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalCursorBlinkMode.FFI.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalCursorShape.FFI.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setEmulation_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_emulation" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontFromString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_font_from_string" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPtyObject_ = fn x1 & x2 => (_import "vte_terminal_set_pty_object" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VtePtyClass.FFI.opt VtePtyClass.FFI.p -> unit;) (x1, x2)
    val setRewrapOnResize_ = fn x1 & x2 => (_import "vte_terminal_set_rewrap_on_resize" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLong.FFI.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GLong.FFI.val_
               * GLong.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_visible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWordChars_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_chars" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLibPid.FFI.val_ -> unit;) (x1, x2)
    val writeContents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * VteTerminalWriteFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.FFI.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.FFI.withPtr false ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.FFI.withPtr false ---> I) copyPrimary_ self
    fun feed self data =
      let
        val length = LargeInt.fromInt (GUInt8CArrayN.length data)
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GLong.FFI.withVal
             ---> I
          )
            feed_
            (
              self
               & data
               & length
            )
      in
        ()
      end
    fun feedChild self (text, length) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         ---> I
      )
        feedChild_
        (
          self
           & text
           & length
        )
    fun feedChildBinary self (data, length) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         ---> I
      )
        feedChildBinary_
        (
          self
           & data
           & length
        )
    fun getAllowBold self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (VteTerminalClass.FFI.withPtr false ---> GInt.FFI.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GLong.FFI.withRefVal
             &&&> GLong.FFI.withRefVal
             ---> GLong.FFI.fromVal
                   && GLong.FFI.fromVal
                   && I
          )
            getCursorPosition_
            (
              self
               & GLong.null
               & GLong.null
            )
      in
        (column, row)
      end
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorShape.FFI.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDefaultEmulation_ self
    fun getEmulation self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEmulation_ self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFont self = (VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self
    fun getHasSelection self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconTitle_ self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false) getPtyObject_ self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getRowCount_ self
    fun getStatusLine self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStatusLine_ self
    fun getVisibleBell self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWindowTitle_ self
    fun isWordChar self c = (VteTerminalClass.FFI.withPtr false &&&> GChar.FFI.withVal ---> GBool.FFI.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self (regex, flags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        matchAddGregex_
        (
          self
           & regex
           & flags
        )
    fun matchCheck self (column, row) =
      let
        val tag & retVal =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GLong.FFI.withVal
             &&&> GLong.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            matchCheck_
            (
              self
               & column
               & row
               & GInt.null
            )
      in
        (retVal, tag)
      end
    fun matchClearAll self = (VteTerminalClass.FFI.withPtr false ---> I) matchClearAll_ self
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self (tag, cursor) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GdkCursorClass.FFI.withOptPtr false
         ---> I
      )
        matchSetCursor_
        (
          self
           & tag
           & cursor
        )
    fun matchSetCursorName self (tag, cursorName) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        matchSetCursorName_
        (
          self
           & tag
           & cursorName
        )
    fun matchSetCursorType self (tag, cursorType) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GdkCursorType.FFI.withVal
         ---> I
      )
        matchSetCursorType_
        (
          self
           & tag
           & cursorType
        )
    fun pasteClipboard self = (VteTerminalClass.FFI.withPtr false ---> I) pasteClipboard_ self
    fun pastePrimary self = (VteTerminalClass.FFI.withPtr false ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> VtePtyFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
      )
        ptyNew_
        (
          self
           & flags
           & []
        )
    fun reset self (clearTabstops, clearHistory) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        reset_
        (
          self
           & clearTabstops
           & clearHistory
        )
    fun searchFindNext self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (VteTerminalClass.FFI.withPtr false ---> GLibRegexRecord.FFI.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (VteTerminalClass.FFI.withPtr false &&&> GLibRegexRecord.FFI.withOptPtr false ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectNone self = (VteTerminalClass.FFI.withPtr false ---> I) selectNone_ self
    fun setAllowBold self allowBold = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.FFI.withPtr false &&&> VteTerminalEraseBinding.FFI.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setColorBackground self background = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setColorBackground_ (self & background)
    fun setColorBackgroundRgba self background = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setColorBackgroundRgba_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setColorBold_ (self & bold)
    fun setColorBoldRgba self bold = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorBoldRgba_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorRgba self cursorBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorCursorRgba_ (self & cursorBackground)
    fun setColorDim self dim = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setColorDim_ (self & dim)
    fun setColorDimRgba self dim = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorDimRgba_ (self & dim)
    fun setColorForeground self foreground = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setColorForeground_ (self & foreground)
    fun setColorForegroundRgba self foreground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setColorForegroundRgba_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I) setColorHighlightForeground_ (self & highlightForeground)
    fun setColorHighlightForegroundRgba self highlightForeground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorHighlightForegroundRgba_ (self & highlightForeground)
    fun setColorHighlightRgba self highlightBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorHighlightRgba_ (self & highlightBackground)
    fun setColors
      self
      (
        foreground,
        background,
        palette
      ) =
      let
        val paletteSize = LargeInt.fromInt (GdkColorRecordCArrayN.length palette)
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkColorRecord.FFI.withOptPtr false
             &&&> GdkColorRecord.FFI.withOptPtr false
             &&&> GdkColorRecordCArrayN.FFI.withPtr 0
             &&&> GLong.FFI.withVal
             ---> I
          )
            setColors_
            (
              self
               & foreground
               & background
               & palette
               & paletteSize
            )
      in
        ()
      end
    fun setColorsRgba
      self
      (
        foreground,
        background,
        palette
      ) =
      let
        val paletteSize = GdkRgbaRecordCArrayN.length palette
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecordCArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             ---> I
          )
            setColorsRgba_
            (
              self
               & foreground
               & background
               & palette
               & paletteSize
            )
      in
        ()
      end
    fun setCursorBlinkMode self mode = (VteTerminalClass.FFI.withPtr false &&&> VteTerminalCursorBlinkMode.FFI.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.FFI.withPtr false &&&> VteTerminalCursorShape.FFI.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.FFI.withPtr false ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.FFI.withPtr false &&&> VteTerminalEraseBinding.FFI.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (VteTerminalClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPtyObject self pty = (VteTerminalClass.FFI.withPtr false &&&> VtePtyClass.FFI.withOptPtr false ---> I) setPtyObject_ (self & pty)
    fun setRewrapOnResize self rewrap = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRewrapOnResize_ (self & rewrap)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (VteTerminalClass.FFI.withPtr false &&&> GLong.FFI.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self (columns, rows) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & columns
           & rows
        )
    fun setVisibleBell self isVisible = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr false &&&> GLibPid.FFI.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents
      self
      (
        stream,
        flags,
        cancellable
      ) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GioOutputStreamClass.FFI.withPtr false
         &&&> VteTerminalWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
      fun charSizeChangedSig f = signal "char-size-changed" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f (width, height))
      fun childExitedSig f = signal "child-exited" (void ---> ret_void) f
      fun commitSig f = signal "commit" (get 0w1 string &&&> get 0w2 uint ---> ret_void) (fn text & size => f (text, size))
      fun contentsChangedSig f = signal "contents-changed" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun currentDirectoryUriChangedSig f = signal "current-directory-uri-changed" (void ---> ret_void) f
      fun currentFileUriChangedSig f = signal "current-file-uri-changed" (void ---> ret_void) f
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
      fun moveWindowSig f = signal "move-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn x & y => f (x, y))
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun raiseWindowSig f = signal "raise-window" (void ---> ret_void) f
      fun refreshWindowSig f = signal "refresh-window" (void ---> ret_void) f
      fun resizeWindowSig f = signal "resize-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f (width, height))
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
      open ValueAccessor
    in
      val allowBoldProp =
        {
          name = "allow-bold",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val audibleBellProp =
        {
          name = "audible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backgroundImageFileProp =
        {
          name = "background-image-file",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val backgroundImagePixbufProp =
        {
          name = "background-image-pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val backgroundOpacityProp =
        {
          name = "background-opacity",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val backgroundSaturationProp =
        {
          name = "background-saturation",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val backgroundTintColorProp =
        {
          name = "background-tint-color",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val backgroundTransparentProp =
        {
          name = "background-transparent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backspaceBindingProp =
        {
          name = "backspace-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn x => fn () => C.get VteTerminalEraseBinding.t x,
          set = fn x => C.set VteTerminalEraseBinding.t x,
          init = fn x => C.set VteTerminalEraseBinding.t x
        }
      val currentDirectoryUriProp =
        {
          name = "current-directory-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val currentFileUriProp =
        {
          name = "current-file-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val cursorBlinkModeProp =
        {
          name = "cursor-blink-mode",
          gtype = fn () => C.gtype VteTerminalCursorBlinkMode.t (),
          get = fn x => fn () => C.get VteTerminalCursorBlinkMode.t x,
          set = fn x => C.set VteTerminalCursorBlinkMode.t x,
          init = fn x => C.set VteTerminalCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          name = "cursor-shape",
          gtype = fn () => C.gtype VteTerminalCursorShape.t (),
          get = fn x => fn () => C.get VteTerminalCursorShape.t x,
          set = fn x => C.set VteTerminalCursorShape.t x,
          init = fn x => C.set VteTerminalCursorShape.t x
        }
      val deleteBindingProp =
        {
          name = "delete-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn x => fn () => C.get VteTerminalEraseBinding.t x,
          set = fn x => C.set VteTerminalEraseBinding.t x,
          init = fn x => C.set VteTerminalEraseBinding.t x
        }
      val emulationProp =
        {
          name = "emulation",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val encodingProp =
        {
          name = "encoding",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val fontDescProp =
        {
          name = "font-desc",
          gtype = fn () => C.gtype PangoFontDescriptionRecord.tOpt (),
          get = fn x => fn () => C.get PangoFontDescriptionRecord.tOpt x,
          set = fn x => C.set PangoFontDescriptionRecord.tOpt x,
          init = fn x => C.set PangoFontDescriptionRecord.tOpt x
        }
      val iconTitleProp =
        {
          name = "icon-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val pointerAutohideProp =
        {
          name = "pointer-autohide",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val ptyProp =
        {
          name = "pty",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val ptyObjectProp =
        {
          name = "pty-object",
          gtype = fn () => C.gtype VtePtyClass.tOpt (),
          get = fn x => fn () => C.get VtePtyClass.tOpt x,
          set = fn x => C.set VtePtyClass.tOpt x,
          init = fn x => C.set VtePtyClass.tOpt x
        }
      val rewrapOnResizeProp =
        {
          name = "rewrap-on-resize",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollBackgroundProp =
        {
          name = "scroll-background",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollOnKeystrokeProp =
        {
          name = "scroll-on-keystroke",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollOnOutputProp =
        {
          name = "scroll-on-output",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollbackLinesProp =
        {
          name = "scrollback-lines",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val visibleBellProp =
        {
          name = "visible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val windowTitleProp =
        {
          name = "window-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val wordCharsProp =
        {
          name = "word-chars",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
