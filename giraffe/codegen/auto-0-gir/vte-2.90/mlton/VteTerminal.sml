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
    structure GdkRgbaRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GdkRgbaRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GdkRgbaRecord.C.ValueType)
      )
    structure GdkRgbaRecordCVectorN = CVectorN(GdkRgbaRecordCVectorNType)
    structure GdkColorRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GdkColorRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GdkColorRecord.C.ValueType)
      )
    structure GdkColorRecordCVectorN = CVectorN(GdkColorRecordCVectorNType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLong.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getChildExitStatus_ = _import "vte_terminal_get_child_exit_status" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GInt.FFI.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> VteTerminalCursorBlinkMode.FFI.val_;
    val getCursorPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_get_cursor_position" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GLong.FFI.ref_
               * GLong.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> VteTerminalCursorShape.FFI.val_;
    val getDefaultEmulation_ = _import "vte_terminal_get_default_emulation" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getEmulation_ = _import "vte_terminal_get_emulation" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFont_ = _import "vte_terminal_get_font" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getPtyObject_ = _import "vte_terminal_get_pty_object" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getStatusLine_ = _import "vte_terminal_get_status_line" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getVisibleBell_ = _import "vte_terminal_get_visible_bell" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isWordChar_ = fn x1 & x2 => (_import "vte_terminal_is_word_char" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GChar.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GLong.FFI.val_
               * GLong.FFI.val_
               * GInt.FFI.ref_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchClearAll_ = _import "vte_terminal_match_clear_all" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * unit GdkCursorClass.FFI.p
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GInt.FFI.val_
               * GdkCursorType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val ptyNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_pty_new" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * VtePtyFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchFindNext_ = _import "vte_terminal_search_find_next" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GLibRegexRecord.FFI.notnull GLibRegexRecord.FFI.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchSetGregex_ = fn x1 & x2 => (_import "vte_terminal_search_set_gregex" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GLibRegexRecord.FFI.p -> unit;) (x1, x2)
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val selectNone_ = _import "vte_terminal_select_none" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBackgroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_background_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBoldRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursorRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorDim_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorDimRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkColorRecord.FFI.notnull GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_rgba" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColors_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_vte_terminal_set_colors" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * unit GdkColorRecord.FFI.p
               * unit GdkColorRecord.FFI.p
               * GdkColorRecordCVectorN.MLton.p1
               * GdkColorRecordCVectorN.FFI.notnull GdkColorRecordCVectorN.MLton.p2
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * unit GdkRgbaRecord.FFI.p
               * unit GdkRgbaRecord.FFI.p
               * GdkRgbaRecordCVectorN.MLton.p1
               * GdkRgbaRecordCVectorN.FFI.notnull GdkRgbaRecordCVectorN.MLton.p2
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
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * VteTerminalCursorBlinkMode.FFI.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * VteTerminalCursorShape.FFI.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setEmulation_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_emulation" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
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
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontFromString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_font_from_string" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPtyObject_ = fn x1 & x2 => (_import "vte_terminal_set_pty_object" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * unit VtePtyClass.FFI.p -> unit;) (x1, x2)
    val setRewrapOnResize_ = fn x1 & x2 => (_import "vte_terminal_set_rewrap_on_resize" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GLong.FFI.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GLong.FFI.val_
               * GLong.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_visible_bell" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWordChars_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_chars" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p * GLibPid.FFI.val_ -> unit;) (x1, x2)
    val writeContents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents" :
              VteTerminalClass.FFI.notnull VteTerminalClass.FFI.p
               * GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p
               * VteTerminalWriteFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.FFI.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.FFI.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.FFI.withPtr ---> I) copyPrimary_ self
    fun feed self data =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val () =
          (
            VteTerminalClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLong.FFI.withVal
         ---> I
      )
        feedChildBinary_
        (
          self
           & data
           & length
        )
    fun getAllowBold self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr ---> GLong.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr ---> GLong.FFI.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (VteTerminalClass.FFI.withPtr ---> GInt.FFI.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr ---> GLong.FFI.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr ---> VteTerminalCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            VteTerminalClass.FFI.withPtr
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
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr ---> VteTerminalCursorShape.FFI.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDefaultEmulation_ self
    fun getEmulation self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEmulation_ self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFont self = (VteTerminalClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self
    fun getHasSelection self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconTitle_ self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (VteTerminalClass.FFI.withPtr ---> VtePtyClass.FFI.fromPtr false) getPtyObject_ self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr ---> GLong.FFI.fromVal) getRowCount_ self
    fun getStatusLine self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStatusLine_ self
    fun getVisibleBell self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWindowTitle_ self
    fun isWordChar self c = (VteTerminalClass.FFI.withPtr &&&> GChar.FFI.withVal ---> GBool.FFI.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self (regex, flags) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GLibRegexRecord.FFI.withPtr
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
            VteTerminalClass.FFI.withPtr
             &&&> GLong.FFI.withVal
             &&&> GLong.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && Utf8.FFI.fromPtr 1
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
    fun matchClearAll self = (VteTerminalClass.FFI.withPtr ---> I) matchClearAll_ self
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self (tag, cursor) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GdkCursorClass.FFI.withOptPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
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
        VteTerminalClass.FFI.withPtr
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
    fun pasteClipboard self = (VteTerminalClass.FFI.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (VteTerminalClass.FFI.withPtr ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        VteTerminalClass.FFI.withPtr
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
        VteTerminalClass.FFI.withPtr
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
    fun searchFindNext self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (VteTerminalClass.FFI.withPtr ---> GLibRegexRecord.FFI.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (VteTerminalClass.FFI.withPtr &&&> GLibRegexRecord.FFI.withOptPtr ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.FFI.withPtr ---> I) selectAll_ self
    fun selectNone self = (VteTerminalClass.FFI.withPtr ---> I) selectNone_ self
    fun setAllowBold self allowBold = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.FFI.withPtr &&&> VteTerminalEraseBinding.FFI.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setColorBackground self background = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBackgroundRgba self background = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setColorBackgroundRgba_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColorBold_ (self & bold)
    fun setColorBoldRgba self bold = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorBoldRgba_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorRgba self cursorBackground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorCursorRgba_ (self & cursorBackground)
    fun setColorDim self dim = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColorDim_ (self & dim)
    fun setColorDimRgba self dim = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorDimRgba_ (self & dim)
    fun setColorForeground self foreground = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorForegroundRgba self foreground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setColorForegroundRgba_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (VteTerminalClass.FFI.withPtr &&&> GdkColorRecord.FFI.withOptPtr ---> I) setColorHighlightForeground_ (self & highlightForeground)
    fun setColorHighlightForegroundRgba self highlightForeground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorHighlightForegroundRgba_ (self & highlightForeground)
    fun setColorHighlightRgba self highlightBackground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorHighlightRgba_ (self & highlightBackground)
    fun setColors
      self
      (
        foreground,
        background,
        palette
      ) =
      let
        val paletteSize = LargeInt.fromInt (GdkColorRecordCVectorN.length palette)
        val () =
          (
            VteTerminalClass.FFI.withPtr
             &&&> GdkColorRecord.FFI.withOptPtr
             &&&> GdkColorRecord.FFI.withOptPtr
             &&&> GdkColorRecordCVectorN.FFI.withPtr
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
        val paletteSize = LargeInt.fromInt (GdkRgbaRecordCVectorN.length palette)
        val () =
          (
            VteTerminalClass.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecordCVectorN.FFI.withPtr
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
    fun setCursorBlinkMode self mode = (VteTerminalClass.FFI.withPtr &&&> VteTerminalCursorBlinkMode.FFI.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.FFI.withPtr &&&> VteTerminalCursorShape.FFI.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.FFI.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.FFI.withPtr &&&> VteTerminalEraseBinding.FFI.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (VteTerminalClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (VteTerminalClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (VteTerminalClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (VteTerminalClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPtyObject self pty = (VteTerminalClass.FFI.withPtr &&&> VtePtyClass.FFI.withOptPtr ---> I) setPtyObject_ (self & pty)
    fun setRewrapOnResize self rewrap = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRewrapOnResize_ (self & rewrap)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (VteTerminalClass.FFI.withPtr &&&> GLong.FFI.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self (columns, rows) =
      (
        VteTerminalClass.FFI.withPtr
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
    fun setVisibleBell self isVisible = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (VteTerminalClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr &&&> GLibPid.FFI.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents
      self
      (
        stream,
        flags,
        cancellable
      ) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GioOutputStreamClass.FFI.withPtr
         &&&> VteTerminalWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
      open Property
    in
      val allowBoldProp =
        {
          get = fn x => get "allow-bold" boolean x,
          set = fn x => set "allow-bold" boolean x,
          new = fn x => new "allow-bold" boolean x
        }
      val audibleBellProp =
        {
          get = fn x => get "audible-bell" boolean x,
          set = fn x => set "audible-bell" boolean x,
          new = fn x => new "audible-bell" boolean x
        }
      val backgroundImageFileProp =
        {
          get = fn x => get "background-image-file" stringOpt x,
          set = fn x => set "background-image-file" stringOpt x,
          new = fn x => new "background-image-file" stringOpt x
        }
      val backgroundImagePixbufProp =
        {
          get = fn x => get "background-image-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "background-image-pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "background-image-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val backgroundOpacityProp =
        {
          get = fn x => get "background-opacity" double x,
          set = fn x => set "background-opacity" double x,
          new = fn x => new "background-opacity" double x
        }
      val backgroundSaturationProp =
        {
          get = fn x => get "background-saturation" double x,
          set = fn x => set "background-saturation" double x,
          new = fn x => new "background-saturation" double x
        }
      val backgroundTintColorProp =
        {
          get = fn x => get "background-tint-color" GdkColorRecord.tOpt x,
          set = fn x => set "background-tint-color" GdkColorRecord.tOpt x,
          new = fn x => new "background-tint-color" GdkColorRecord.tOpt x
        }
      val backgroundTransparentProp =
        {
          get = fn x => get "background-transparent" boolean x,
          set = fn x => set "background-transparent" boolean x,
          new = fn x => new "background-transparent" boolean x
        }
      val backspaceBindingProp =
        {
          get = fn x => get "backspace-binding" VteTerminalEraseBinding.t x,
          set = fn x => set "backspace-binding" VteTerminalEraseBinding.t x,
          new = fn x => new "backspace-binding" VteTerminalEraseBinding.t x
        }
      val currentDirectoryUriProp = {get = fn x => get "current-directory-uri" stringOpt x}
      val currentFileUriProp = {get = fn x => get "current-file-uri" stringOpt x}
      val cursorBlinkModeProp =
        {
          get = fn x => get "cursor-blink-mode" VteTerminalCursorBlinkMode.t x,
          set = fn x => set "cursor-blink-mode" VteTerminalCursorBlinkMode.t x,
          new = fn x => new "cursor-blink-mode" VteTerminalCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          get = fn x => get "cursor-shape" VteTerminalCursorShape.t x,
          set = fn x => set "cursor-shape" VteTerminalCursorShape.t x,
          new = fn x => new "cursor-shape" VteTerminalCursorShape.t x
        }
      val deleteBindingProp =
        {
          get = fn x => get "delete-binding" VteTerminalEraseBinding.t x,
          set = fn x => set "delete-binding" VteTerminalEraseBinding.t x,
          new = fn x => new "delete-binding" VteTerminalEraseBinding.t x
        }
      val emulationProp =
        {
          get = fn x => get "emulation" stringOpt x,
          set = fn x => set "emulation" stringOpt x,
          new = fn x => new "emulation" stringOpt x
        }
      val encodingProp =
        {
          get = fn x => get "encoding" stringOpt x,
          set = fn x => set "encoding" stringOpt x,
          new = fn x => new "encoding" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x,
          new = fn x => new "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val iconTitleProp = {get = fn x => get "icon-title" stringOpt x}
      val pointerAutohideProp =
        {
          get = fn x => get "pointer-autohide" boolean x,
          set = fn x => set "pointer-autohide" boolean x,
          new = fn x => new "pointer-autohide" boolean x
        }
      val ptyProp =
        {
          get = fn x => get "pty" int x,
          set = fn x => set "pty" int x,
          new = fn x => new "pty" int x
        }
      val ptyObjectProp =
        {
          get = fn x => get "pty-object" VtePtyClass.tOpt x,
          set = fn x => set "pty-object" VtePtyClass.tOpt x,
          new = fn x => new "pty-object" VtePtyClass.tOpt x
        }
      val rewrapOnResizeProp =
        {
          get = fn x => get "rewrap-on-resize" boolean x,
          set = fn x => set "rewrap-on-resize" boolean x,
          new = fn x => new "rewrap-on-resize" boolean x
        }
      val scrollBackgroundProp =
        {
          get = fn x => get "scroll-background" boolean x,
          set = fn x => set "scroll-background" boolean x,
          new = fn x => new "scroll-background" boolean x
        }
      val scrollOnKeystrokeProp =
        {
          get = fn x => get "scroll-on-keystroke" boolean x,
          set = fn x => set "scroll-on-keystroke" boolean x,
          new = fn x => new "scroll-on-keystroke" boolean x
        }
      val scrollOnOutputProp =
        {
          get = fn x => get "scroll-on-output" boolean x,
          set = fn x => set "scroll-on-output" boolean x,
          new = fn x => new "scroll-on-output" boolean x
        }
      val scrollbackLinesProp =
        {
          get = fn x => get "scrollback-lines" uint x,
          set = fn x => set "scrollback-lines" uint x,
          new = fn x => new "scrollback-lines" uint x
        }
      val visibleBellProp =
        {
          get = fn x => get "visible-bell" boolean x,
          set = fn x => set "visible-bell" boolean x,
          new = fn x => new "visible-bell" boolean x
        }
      val windowTitleProp = {get = fn x => get "window-title" stringOpt x}
      val wordCharsProp =
        {
          get = fn x => get "word-chars" stringOpt x,
          set = fn x => set "word-chars" stringOpt x,
          new = fn x => new "word-chars" stringOpt x
        }
    end
  end
