structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class = 'a VteTerminalClass.class
    where type regex_record_c_ptr_array_n_t = VteRegexRecordCPtrArrayN.t
    where type pty_flags_t = VtePtyFlags.t
    where type regex_t = VteRegexRecord.t
    where type write_flags_t = VteWriteFlags.t
    where type cursor_blink_mode_t = VteCursorBlinkMode.t
    where type cursor_shape_t = VteCursorShape.t
    where type erase_binding_t = VteEraseBinding.t
    where type 'a pty_class = 'a VtePtyClass.class =
  struct
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val eventCheckGregexSimple_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & (x7, x8) =>
          (
            _import "mlton_vte_terminal_event_check_gregex_simple" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * GLibRegexRecordCPtrArrayN.MLton.p1
               * GLibRegexRecordCPtrArrayN.FFI.non_opt GLibRegexRecordCPtrArrayN.MLton.p2
               * GUInt64.FFI.ref_
               * GLibRegexMatchFlags.FFI.val_
               * Utf8CPtrArrayN.MLton.r1
               * (Utf8CPtrArrayN.FFI.opt, Utf8CPtrArrayN.FFI.non_opt) Utf8CPtrArrayN.MLton.r2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val eventCheckRegexSimple_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & (x7, x8) =>
          (
            _import "mlton_vte_terminal_event_check_regex_simple" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * VteRegexRecordCPtrArrayN.MLton.p1
               * VteRegexRecordCPtrArrayN.FFI.non_opt VteRegexRecordCPtrArrayN.MLton.p2
               * GUInt64.FFI.ref_
               * GUInt32.FFI.val_
               * Utf8CPtrArrayN.MLton.r1
               * (Utf8CPtrArrayN.FFI.opt, Utf8CPtrArrayN.FFI.non_opt) Utf8CPtrArrayN.MLton.r2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.opt GUInt8CArrayN.MLton.p2
               * GInt64.FFI.val_
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt64.FFI.val_
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
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
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
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt64.FFI.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt64.FFI.val_;
    val getCjkAmbiguousWidth_ = _import "vte_terminal_get_cjk_ambiguous_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt32.FFI.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt64.FFI.val_;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteCursorBlinkMode.FFI.val_;
    val getCursorPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_get_cursor_position" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt64.FFI.ref_
               * GInt64.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteCursorShape.FFI.val_;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFont_ = _import "vte_terminal_get_font" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getFontScale_ = _import "vte_terminal_get_font_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GDouble.FFI.val_;
    val getGeometryHints_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_terminal_get_geometry_hints" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkGeometryRecord.FFI.non_opt GdkGeometryRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getInputEnabled_ = _import "vte_terminal_get_input_enabled" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getPty_ = _import "vte_terminal_get_pty" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt64.FFI.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWordCharExceptions_ = _import "vte_terminal_get_word_char_exceptions" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val matchAddRegex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_regex" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * VteRegexRecord.FFI.non_opt VteRegexRecord.FFI.p
               * GUInt32.FFI.val_
               -> GInt32.FFI.val_;
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
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val matchCheckEvent_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_check_event" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * GInt32.FFI.ref_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val matchRemoveAll_ = _import "vte_terminal_match_remove_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt32.FFI.val_
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
               * GInt32.FFI.val_
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
               * GInt32.FFI.val_
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
    val ptyNewSync_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_terminal_pty_new_sync" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * VtePtyFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
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
    val searchGetRegex_ = _import "vte_terminal_search_get_regex" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteRegexRecord.FFI.non_opt VteRegexRecord.FFI.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchSetGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_search_set_gregex" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GLibRegexRecord.FFI.opt GLibRegexRecord.FFI.p
               * GLibRegexMatchFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchSetRegex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_search_set_regex" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * VteRegexRecord.FFI.opt VteRegexRecord.FFI.p
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setCjkAmbiguousWidth_ = fn x1 & x2 => (_import "vte_terminal_set_cjk_ambiguous_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_foreground" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
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
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecordCArrayN.MLton.p1
               * GdkRgbaRecordCArrayN.FFI.opt GdkRgbaRecordCArrayN.MLton.p2
               * GUInt64.FFI.val_
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
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteCursorBlinkMode.FFI.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteCursorShape.FFI.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_set_encoding" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontScale_ = fn x1 & x2 => (_import "vte_terminal_set_font_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setGeometryHintsForWindow_ = fn x1 & x2 => (_import "vte_terminal_set_geometry_hints_for_window" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val setInputEnabled_ = fn x1 & x2 => (_import "vte_terminal_set_input_enabled" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPty_ = fn x1 & x2 => (_import "vte_terminal_set_pty" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VtePtyClass.FFI.opt VtePtyClass.FFI.p -> unit;) (x1, x2)
    val setRewrapOnResize_ = fn x1 & x2 => (_import "vte_terminal_set_rewrap_on_resize" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollSpeed_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_speed" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt64.FFI.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GInt64.FFI.val_
               * GInt64.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWordCharExceptions_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_char_exceptions" :
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
    val unselectAll_ = _import "vte_terminal_unselect_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val writeContentsSync_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents_sync" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * VteWriteFlags.FFI.val_
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
    type regex_record_c_ptr_array_n_t = VteRegexRecordCPtrArrayN.t
    type pty_flags_t = VtePtyFlags.t
    type regex_t = VteRegexRecord.t
    type write_flags_t = VteWriteFlags.t
    type cursor_blink_mode_t = VteCursorBlinkMode.t
    type cursor_shape_t = VteCursorShape.t
    type erase_binding_t = VteEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.FFI.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.FFI.withPtr false ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.FFI.withPtr false ---> I) copyPrimary_ self
    fun eventCheckGregexSimple
      self
      (
        event,
        regexes,
        matchFlags
      ) =
      let
        val nRegexes
         & matches
         & retVal =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkEvent.FFI.withPtr false
             &&&> GLibRegexRecordCPtrArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr 0
             ---> GUInt64.FFI.fromVal
                   && Utf8CPtrArrayN.FFI.fromPtr 0
                   && GBool.FFI.fromVal
          )
            eventCheckGregexSimple_
            (
              self
               & event
               & regexes
               & GUInt64.null
               & matchFlags
               & NONE
            )
      in
        if retVal then SOME (matches (LargeInt.toInt nRegexes)) else NONE
      end
    fun eventCheckRegexSimple
      self
      (
        event,
        regexes,
        matchFlags
      ) =
      let
        val nRegexes
         & matches
         & retVal =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkEvent.FFI.withPtr false
             &&&> VteRegexRecordCPtrArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt32.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr 0
             ---> GUInt64.FFI.fromVal
                   && Utf8CPtrArrayN.FFI.fromPtr 0
                   && GBool.FFI.fromVal
          )
            eventCheckRegexSimple_
            (
              self
               & event
               & regexes
               & GUInt64.null
               & matchFlags
               & NONE
            )
      in
        if retVal then SOME (matches (LargeInt.toInt nRegexes)) else NONE
      end
    fun feed self data =
      let
        val length =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CArrayN.length data)
          | NONE => GInt64.null
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withOptPtr 0
             &&&> GInt64.FFI.withVal
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
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt64.FFI.withVal
         ---> I
      )
        feedChild_
        (
          self
           & text
           & length
        )
    fun feedChildBinary self data =
      let
        val length =
          case data of
            SOME data => LargeInt.fromInt (GUInt8CArrayN.length data)
          | NONE => GUInt64.null
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withOptPtr 0
             &&&> GUInt64.FFI.withVal
             ---> I
          )
            feedChildBinary_
            (
              self
               & data
               & length
            )
      in
        ()
      end
    fun getAllowBold self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getCharWidth_ self
    fun getCjkAmbiguousWidth self = (VteTerminalClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getCjkAmbiguousWidth_ self
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr false ---> VteCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GInt64.FFI.withRefVal
             &&&> GInt64.FFI.withRefVal
             ---> GInt64.FFI.fromVal
                   && GInt64.FFI.fromVal
                   && I
          )
            getCursorPosition_
            (
              self
               & GInt64.null
               & GInt64.null
            )
      in
        (column, row)
      end
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr false ---> VteCursorShape.FFI.fromVal) getCursorShape_ self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFont self = (VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self
    fun getFontScale self = (VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getFontScale_ self
    fun getGeometryHints self (minRows, minColumns) =
      let
        val hints & () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkGeometryRecord.FFI.withNewPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             ---> GdkGeometryRecord.FFI.fromPtr true && I
          )
            getGeometryHints_
            (
              self
               & ()
               & minRows
               & minColumns
            )
      in
        hints
      end
    fun getHasSelection self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconTitle_ self
    fun getInputEnabled self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPty self = (VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false) getPty_ self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getRowCount_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWindowTitle_ self
    fun getWordCharExceptions self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWordCharExceptions_ self
    fun matchAddGregex self (gregex, gflags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        matchAddGregex_
        (
          self
           & gregex
           & gflags
        )
    fun matchAddRegex self (regex, flags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> VteRegexRecord.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        matchAddRegex_
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
             &&&> GInt64.FFI.withVal
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            matchCheck_
            (
              self
               & column
               & row
               & GInt32.null
            )
      in
        (retVal, tag)
      end
    fun matchCheckEvent self event =
      let
        val tag & retVal =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkEvent.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            matchCheckEvent_
            (
              self
               & event
               & GInt32.null
            )
      in
        (retVal, tag)
      end
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) matchRemove_ (self & tag)
    fun matchRemoveAll self = (VteTerminalClass.FFI.withPtr false ---> I) matchRemoveAll_ self
    fun matchSetCursor self (tag, cursor) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
    fun ptyNewSync self (flags, cancellable) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> VtePtyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
      )
        ptyNewSync_
        (
          self
           & flags
           & cancellable
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
    fun searchGetRegex self = (VteTerminalClass.FFI.withPtr false ---> VteRegexRecord.FFI.fromPtr false) searchGetRegex_ self
    fun searchGetWrapAround self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self (gregex, gflags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withOptPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> I
      )
        searchSetGregex_
        (
          self
           & gregex
           & gflags
        )
    fun searchSetRegex self (regex, flags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> VteRegexRecord.FFI.withOptPtr false
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        searchSetRegex_
        (
          self
           & regex
           & flags
        )
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.FFI.withPtr false ---> I) selectAll_ self
    fun setAllowBold self allowBold = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.FFI.withPtr false &&&> VteEraseBinding.FFI.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setCjkAmbiguousWidth self width = (VteTerminalClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setCjkAmbiguousWidth_ (self & width)
    fun setColorBackground self background = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setColorBackground_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorBold_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorForeground self cursorForeground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorCursorForeground_ (self & cursorForeground)
    fun setColorForeground self foreground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setColorForeground_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I) setColorHighlightForeground_ (self & highlightForeground)
    fun setColors
      self
      (
        foreground,
        background,
        palette
      ) =
      let
        val paletteSize =
          case palette of
            SOME palette => LargeInt.fromInt (GdkRgbaRecordCArrayN.length palette)
          | NONE => GUInt64.null
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecordCArrayN.FFI.withOptPtr 0
             &&&> GUInt64.FFI.withVal
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
    fun setCursorBlinkMode self mode = (VteTerminalClass.FFI.withPtr false &&&> VteCursorBlinkMode.FFI.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.FFI.withPtr false &&&> VteCursorShape.FFI.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.FFI.withPtr false ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.FFI.withPtr false &&&> VteEraseBinding.FFI.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEncoding self codeset =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setEncoding_
        (
          self
           & codeset
           & []
        )
    fun setFont self fontDesc = (VteTerminalClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I) setFont_ (self & fontDesc)
    fun setFontScale self scale = (VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setFontScale_ (self & scale)
    fun setGeometryHintsForWindow self window = (VteTerminalClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I) setGeometryHintsForWindow_ (self & window)
    fun setInputEnabled self enabled = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInputEnabled_ (self & enabled)
    fun setMouseAutohide self setting = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPty self pty = (VteTerminalClass.FFI.withPtr false &&&> VtePtyClass.FFI.withOptPtr false ---> I) setPty_ (self & pty)
    fun setRewrapOnResize self rewrap = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRewrapOnResize_ (self & rewrap)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollSpeed self scrollSpeed = (VteTerminalClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setScrollSpeed_ (self & scrollSpeed)
    fun setScrollbackLines self lines = (VteTerminalClass.FFI.withPtr false &&&> GInt64.FFI.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self (columns, rows) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GInt64.FFI.withVal
         &&&> GInt64.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & columns
           & rows
        )
    fun setWordCharExceptions self exceptions = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWordCharExceptions_ (self & exceptions)
    fun unselectAll self = (VteTerminalClass.FFI.withPtr false ---> I) unselectAll_ self
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) watchChild_ (self & childPid)
    fun writeContentsSync
      self
      (
        stream,
        flags,
        cancellable
      ) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GioOutputStreamClass.FFI.withPtr false
         &&&> VteWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        writeContentsSync_
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
      fun bellSig f = signal "bell" (void ---> ret_void) f
      fun charSizeChangedSig f = signal "char-size-changed" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f (width, height))
      fun childExitedSig f = signal "child-exited" (get 0w1 int ---> ret_void) f
      fun commitSig f = signal "commit" (get 0w1 string &&&> get 0w2 uint ---> ret_void) (fn text & size => f (text, size))
      fun contentsChangedSig f = signal "contents-changed" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun currentDirectoryUriChangedSig f = signal "current-directory-uri-changed" (void ---> ret_void) f
      fun currentFileUriChangedSig f = signal "current-file-uri-changed" (void ---> ret_void) f
      fun cursorMovedSig f = signal "cursor-moved" (void ---> ret_void) f
      fun decreaseFontSizeSig f = signal "decrease-font-size" (void ---> ret_void) f
      fun deiconifyWindowSig f = signal "deiconify-window" (void ---> ret_void) f
      fun encodingChangedSig f = signal "encoding-changed" (void ---> ret_void) f
      fun eofSig f = signal "eof" (void ---> ret_void) f
      fun iconTitleChangedSig f = signal "icon-title-changed" (void ---> ret_void) f
      fun iconifyWindowSig f = signal "iconify-window" (void ---> ret_void) f
      fun increaseFontSizeSig f = signal "increase-font-size" (void ---> ret_void) f
      fun lowerWindowSig f = signal "lower-window" (void ---> ret_void) f
      fun maximizeWindowSig f = signal "maximize-window" (void ---> ret_void) f
      fun moveWindowSig f = signal "move-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn x & y => f (x, y))
      fun notificationReceivedSig f = signal "notification-received" (get 0w1 string &&&> get 0w2 stringOpt ---> ret_void) (fn summary & body => f (summary, body))
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun raiseWindowSig f = signal "raise-window" (void ---> ret_void) f
      fun refreshWindowSig f = signal "refresh-window" (void ---> ret_void) f
      fun resizeWindowSig f = signal "resize-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f (width, height))
      fun restoreWindowSig f = signal "restore-window" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
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
      val backspaceBindingProp =
        {
          get = fn x => get "backspace-binding" VteEraseBinding.t x,
          set = fn x => set "backspace-binding" VteEraseBinding.t x,
          new = fn x => new "backspace-binding" VteEraseBinding.t x
        }
      val cjkAmbiguousWidthProp =
        {
          get = fn x => get "cjk-ambiguous-width" int x,
          set = fn x => set "cjk-ambiguous-width" int x,
          new = fn x => new "cjk-ambiguous-width" int x
        }
      val currentDirectoryUriProp = {get = fn x => get "current-directory-uri" stringOpt x}
      val currentFileUriProp = {get = fn x => get "current-file-uri" stringOpt x}
      val cursorBlinkModeProp =
        {
          get = fn x => get "cursor-blink-mode" VteCursorBlinkMode.t x,
          set = fn x => set "cursor-blink-mode" VteCursorBlinkMode.t x,
          new = fn x => new "cursor-blink-mode" VteCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          get = fn x => get "cursor-shape" VteCursorShape.t x,
          set = fn x => set "cursor-shape" VteCursorShape.t x,
          new = fn x => new "cursor-shape" VteCursorShape.t x
        }
      val deleteBindingProp =
        {
          get = fn x => get "delete-binding" VteEraseBinding.t x,
          set = fn x => set "delete-binding" VteEraseBinding.t x,
          new = fn x => new "delete-binding" VteEraseBinding.t x
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
      val fontScaleProp =
        {
          get = fn x => get "font-scale" double x,
          set = fn x => set "font-scale" double x,
          new = fn x => new "font-scale" double x
        }
      val iconTitleProp = {get = fn x => get "icon-title" stringOpt x}
      val inputEnabledProp =
        {
          get = fn x => get "input-enabled" boolean x,
          set = fn x => set "input-enabled" boolean x,
          new = fn x => new "input-enabled" boolean x
        }
      val pointerAutohideProp =
        {
          get = fn x => get "pointer-autohide" boolean x,
          set = fn x => set "pointer-autohide" boolean x,
          new = fn x => new "pointer-autohide" boolean x
        }
      val ptyProp =
        {
          get = fn x => get "pty" VtePtyClass.tOpt x,
          set = fn x => set "pty" VtePtyClass.tOpt x,
          new = fn x => new "pty" VtePtyClass.tOpt x
        }
      val rewrapOnResizeProp =
        {
          get = fn x => get "rewrap-on-resize" boolean x,
          set = fn x => set "rewrap-on-resize" boolean x,
          new = fn x => new "rewrap-on-resize" boolean x
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
      val scrollSpeedProp =
        {
          get = fn x => get "scroll-speed" uint x,
          set = fn x => set "scroll-speed" uint x,
          new = fn x => new "scroll-speed" uint x
        }
      val scrollbackLinesProp =
        {
          get = fn x => get "scrollback-lines" uint x,
          set = fn x => set "scrollback-lines" uint x,
          new = fn x => new "scrollback-lines" uint x
        }
      val windowTitleProp = {get = fn x => get "window-title" stringOpt x}
      val wordCharExceptionsProp = {get = fn x => get "word-char-exceptions" stringOpt x}
    end
  end
