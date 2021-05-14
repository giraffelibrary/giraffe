structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class = 'a VteTerminalClass.class
    where type format_t = VteFormat.t
    where type regex_record_c_ptr_array_n_t = VteRegexRecordCPtrArrayN.t
    where type pty_flags_t = VtePtyFlags.t
    where type regex_t = VteRegexRecord.t
    where type write_flags_t = VteWriteFlags.t
    where type cursor_blink_mode_t = VteCursorBlinkMode.t
    where type cursor_shape_t = VteCursorShape.t
    where type erase_binding_t = VteEraseBinding.t
    where type 'a pty_class = 'a VtePtyClass.class
    where type text_blink_mode_t = VteTextBlinkMode.t =
  struct
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val copyClipboardFormat_ = fn x1 & x2 => (_import "vte_terminal_copy_clipboard_format" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteFormat.FFI.val_ -> unit;) (x1, x2)
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val eventCheckRegexSimple_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_vte_terminal_event_check_regex_array" :
              VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * VteRegexRecordCPtrArrayN.MLton.p1
               * VteRegexRecordCPtrArrayN.FFI.non_opt VteRegexRecordCPtrArrayN.MLton.p2
               * GSize.FFI.val_
               * GUInt32.FFI.val_
               * GSize.FFI.ref_
               -> Utf8CPtrArrayN.FFI.non_opt Utf8CPtrArrayN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
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
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
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
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
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
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getAllowHyperlink_ = _import "vte_terminal_get_allow_hyperlink" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getBoldIsBright_ = _import "vte_terminal_get_bold_is_bright" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getCellHeightScale_ = _import "vte_terminal_get_cell_height_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GDouble.FFI.val_;
    val getCellWidthScale_ = _import "vte_terminal_get_cell_width_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GDouble.FFI.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCjkAmbiguousWidth_ = _import "vte_terminal_get_cjk_ambiguous_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt.FFI.val_;
    val getColorBackgroundForDraw_ = fn x1 & x2 => (_import "vte_terminal_get_color_background_for_draw" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCurrentContainerName_ = _import "vte_terminal_get_current_container_name" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCurrentContainerRuntime_ = _import "vte_terminal_get_current_container_runtime" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteCursorBlinkMode.FFI.val_;
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
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteCursorShape.FFI.val_;
    val getEnableBidi_ = _import "vte_terminal_get_enable_bidi" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getEnableShaping_ = _import "vte_terminal_get_enable_shaping" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getEnableSixel_ = _import "vte_terminal_get_enable_sixel" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
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
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getInputEnabled_ = _import "vte_terminal_get_input_enabled" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getPty_ = _import "vte_terminal_get_pty" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getScrollOnKeystroke_ = _import "vte_terminal_get_scroll_on_keystroke" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getScrollOnOutput_ = _import "vte_terminal_get_scroll_on_output" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getScrollbackLines_ = _import "vte_terminal_get_scrollback_lines" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getTextBlinkMode_ = _import "vte_terminal_get_text_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteTextBlinkMode.FFI.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getWordCharExceptions_ = _import "vte_terminal_get_word_char_exceptions" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val hyperlinkCheckEvent_ = fn x1 & x2 => (_import "vte_terminal_hyperlink_check_event" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
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
               -> Utf8.FFI.opt Utf8.FFI.out_p;
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
               * GInt.FFI.ref_
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val matchRemoveAll_ = _import "vte_terminal_match_remove_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
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
    val setAllowHyperlink_ = fn x1 & x2 => (_import "vte_terminal_set_allow_hyperlink" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setBoldIsBright_ = fn x1 & x2 => (_import "vte_terminal_set_bold_is_bright" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCellHeightScale_ = fn x1 & x2 => (_import "vte_terminal_set_cell_height_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setCellWidthScale_ = fn x1 & x2 => (_import "vte_terminal_set_cell_width_scale" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setCjkAmbiguousWidth_ = fn x1 & x2 => (_import "vte_terminal_set_cjk_ambiguous_width" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setClearBackground_ = fn x1 & x2 => (_import "vte_terminal_set_clear_background" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteCursorBlinkMode.FFI.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteCursorShape.FFI.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setEnableBidi_ = fn x1 & x2 => (_import "vte_terminal_set_enable_bidi" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEnableShaping_ = fn x1 & x2 => (_import "vte_terminal_set_enable_shaping" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEnableSixel_ = fn x1 & x2 => (_import "vte_terminal_set_enable_sixel" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
    val setScrollSpeed_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_speed" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
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
    val setTextBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_text_blink_mode" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTextBlinkMode.FFI.val_ -> unit;) (x1, x2)
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
    val spawnSync_ =
      fn x1 & x2 & (x3, x4) & (x5, x6) & (x7, x8) & x9 & x10 & x11 & x12 & x13 & x14 =>
        (
          _import "mlton_vte_terminal_spawn_sync" :
            VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p
             * VtePtyFlags.FFI.val_
             * Utf8.MLton.p1
             * Utf8.FFI.opt Utf8.MLton.p2
             * Utf8CPtrArray.MLton.p1
             * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
             * Utf8CPtrArray.MLton.p1
             * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
             * GLibSpawnFlags.FFI.val_
             * GLibSpawnChildSetupFunc.FFI.opt GLibSpawnChildSetupFunc.FFI.dispatch_p
             * GLibSpawnChildSetupFunc.FFI.opt GLibSpawnChildSetupFunc.FFI.p
             * GLibPid.FFI.ref_
             * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
             * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
            x8,
            x9,
            x10,
            x11,
            x12,
            x13,
            x14
          )
    val unselectAll_ = _import "vte_terminal_unselect_all" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLibPid.FFI.val_ -> unit;) (x1, x2)
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
    type format_t = VteFormat.t
    type regex_record_c_ptr_array_n_t = VteRegexRecordCPtrArrayN.t
    type pty_flags_t = VtePtyFlags.t
    type regex_t = VteRegexRecord.t
    type write_flags_t = VteWriteFlags.t
    type cursor_blink_mode_t = VteCursorBlinkMode.t
    type cursor_shape_t = VteCursorShape.t
    type erase_binding_t = VteEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
    type text_blink_mode_t = VteTextBlinkMode.t
    type t = base class
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false
    in
      fun asImplementorIface self = call I (GObjectObjectClass.toBase self)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false
    in
      fun asBuildable self = call I (GObjectObjectClass.toBase self)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false
    in
      fun asScrollable self = call I (GObjectObjectClass.toBase self)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call = I ---> VteTerminalClass.FFI.fromPtr false
    in
      fun new () = call new_ ()
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun copyClipboard self = call copyClipboard_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteFormat.FFI.withVal ---> I
    in
      fun copyClipboardFormat self format = call copyClipboardFormat_ (VteTerminalClass.toBase self & format)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun copyPrimary self = call copyPrimary_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> VteRegexRecordCPtrArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GSize.FFI.withRefVal
         ---> GSize.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr ~1
    in
      fun eventCheckRegexSimple
        self
        (
          event,
          regexes,
          matchFlags
        ) =
        let
          val nRegexes = VteRegexRecordCPtrArrayN.length regexes
          val nMatches & retVal =
            call eventCheckRegexSimple_
              (
                VteTerminalClass.toBase self
                 & GdkEvent.toBase event
                 & regexes
                 & nRegexes
                 & matchFlags
                 & GSize.null
              )
        in
          retVal nMatches
        end
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         ---> I
    in
      fun feed self data =
        let
          val length = GUInt8CArrayN.length data
          val () =
            call feed_
              (
                VteTerminalClass.toBase self
                 & data
                 & length
              )
        in
          ()
        end
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         ---> I
    in
      fun feedChild self text =
        let
          val length = GUInt8CArrayN.length text
          val () =
            call feedChild_
              (
                VteTerminalClass.toBase self
                 & text
                 & length
              )
        in
          ()
        end
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> I
    in
      fun feedChildBinary self data =
        let
          val length = GUInt8CArrayN.length data
          val () =
            call feedChildBinary_
              (
                VteTerminalClass.toBase self
                 & data
                 & length
              )
        in
          ()
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getAllowBold self = call getAllowBold_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getAllowHyperlink self = call getAllowHyperlink_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getAudibleBell self = call getAudibleBell_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getBoldIsBright self = call getBoldIsBright_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getCellHeightScale self = call getCellHeightScale_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getCellWidthScale self = call getCellWidthScale_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getCharHeight self = call getCharHeight_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getCharWidth self = call getCharWidth_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getCjkAmbiguousWidth self = call getCjkAmbiguousWidth_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I
    in
      fun getColorBackgroundForDraw self =
        let
          val color & () = call getColorBackgroundForDraw_ (VteTerminalClass.toBase self & ())
        in
          color
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getColumnCount self = call getColumnCount_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getCurrentContainerName self = call getCurrentContainerName_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getCurrentContainerRuntime self = call getCurrentContainerRuntime_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getCurrentDirectoryUri self = call getCurrentDirectoryUri_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getCurrentFileUri self = call getCurrentFileUri_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VteCursorBlinkMode.FFI.fromVal
    in
      fun getCursorBlinkMode self = call getCursorBlinkMode_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLong.FFI.withRefVal
         &&&> GLong.FFI.withRefVal
         ---> GLong.FFI.fromVal
               && GLong.FFI.fromVal
               && I
    in
      fun getCursorPosition self =
        let
          val column
           & row
           & () =
            call getCursorPosition_
              (
                VteTerminalClass.toBase self
                 & GLong.null
                 & GLong.null
              )
        in
          (column, row)
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VteCursorShape.FFI.fromVal
    in
      fun getCursorShape self = call getCursorShape_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getEnableBidi self = call getEnableBidi_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getEnableShaping self = call getEnableShaping_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getEnableSixel self = call getEnableSixel_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getEncoding self = call getEncoding_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false
    in
      fun getFont self = call getFont_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getFontScale self = call getFontScale_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkGeometryRecord.FFI.withNewPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GdkGeometryRecord.FFI.fromPtr true && I
    in
      fun getGeometryHints self (minRows, minColumns) =
        let
          val hints & () =
            call getGeometryHints_
              (
                VteTerminalClass.toBase self
                 & ()
                 & minRows
                 & minColumns
              )
        in
          hints
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHasSelection self = call getHasSelection_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getIconTitle self = call getIconTitle_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getInputEnabled self = call getInputEnabled_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getMouseAutohide self = call getMouseAutohide_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false
    in
      fun getPty self = call getPty_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getRewrapOnResize self = call getRewrapOnResize_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getRowCount self = call getRowCount_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getScrollOnKeystroke self = call getScrollOnKeystroke_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getScrollOnOutput self = call getScrollOnOutput_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getScrollbackLines self = call getScrollbackLines_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VteTextBlinkMode.FFI.fromVal
    in
      fun getTextBlinkMode self = call getTextBlinkMode_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getWindowTitle self = call getWindowTitle_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0
    in
      fun getWordCharExceptions self = call getWordCharExceptions_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1
    in
      fun hyperlinkCheckEvent self event = call hyperlinkCheckEvent_ (VteTerminalClass.toBase self & GdkEvent.toBase event)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt.FFI.fromVal
    in
      fun matchAddGregex self (gregex, gflags) =
        call matchAddGregex_
          (
            VteTerminalClass.toBase self
             & gregex
             & gflags
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> VteRegexRecord.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         ---> GInt.FFI.fromVal
    in
      fun matchAddRegex self (regex, flags) =
        call matchAddRegex_
          (
            VteTerminalClass.toBase self
             & regex
             & flags
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
    in
      fun matchCheck self (column, row) =
        let
          val tag & retVal =
            call matchCheck_
              (
                VteTerminalClass.toBase self
                 & column
                 & row
                 & GInt.null
              )
        in
          (retVal, tag)
        end
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
    in
      fun matchCheckEvent self event =
        let
          val tag & retVal =
            call matchCheckEvent_
              (
                VteTerminalClass.toBase self
                 & GdkEvent.toBase event
                 & GInt.null
              )
        in
          (retVal, tag)
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun matchRemove self tag = call matchRemove_ (VteTerminalClass.toBase self & tag)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun matchRemoveAll self = call matchRemoveAll_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GdkCursorClass.FFI.withOptPtr false
         ---> I
    in
      fun matchSetCursor self (tag, cursor) =
        call matchSetCursor_
          (
            VteTerminalClass.toBase self
             & tag
             & Option.map GdkCursorClass.toBase cursor
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun matchSetCursorName self (tag, cursorName) =
        call matchSetCursorName_
          (
            VteTerminalClass.toBase self
             & tag
             & cursorName
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GdkCursorType.FFI.withVal
         ---> I
    in
      fun matchSetCursorType self (tag, cursorType) =
        call matchSetCursorType_
          (
            VteTerminalClass.toBase self
             & tag
             & cursorType
          )
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun pasteClipboard self = call pasteClipboard_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun pastePrimary self = call pastePrimary_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> VtePtyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
    in
      fun ptyNewSync self (flags, cancellable) =
        call ptyNewSync_
          (
            VteTerminalClass.toBase self
             & flags
             & Option.map GioCancellableClass.toBase cancellable
             & []
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
    in
      fun reset self (clearTabstops, clearHistory) =
        call reset_
          (
            VteTerminalClass.toBase self
             & clearTabstops
             & clearHistory
          )
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun searchFindNext self = call searchFindNext_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun searchFindPrevious self = call searchFindPrevious_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLibRegexRecord.FFI.fromPtr false
    in
      fun searchGetGregex self = call searchGetGregex_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VteRegexRecord.FFI.fromPtr false
    in
      fun searchGetRegex self = call searchGetRegex_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun searchGetWrapAround self = call searchGetWrapAround_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withOptPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> I
    in
      fun searchSetGregex self (gregex, gflags) =
        call searchSetGregex_
          (
            VteTerminalClass.toBase self
             & gregex
             & gflags
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> VteRegexRecord.FFI.withOptPtr false
         &&&> GUInt32.FFI.withVal
         ---> I
    in
      fun searchSetRegex self (regex, flags) =
        call searchSetRegex_
          (
            VteTerminalClass.toBase self
             & regex
             & flags
          )
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun searchSetWrapAround self wrapAround = call searchSetWrapAround_ (VteTerminalClass.toBase self & wrapAround)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun selectAll self = call selectAll_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAllowBold self allowBold = call setAllowBold_ (VteTerminalClass.toBase self & allowBold)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAllowHyperlink self allowHyperlink = call setAllowHyperlink_ (VteTerminalClass.toBase self & allowHyperlink)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAudibleBell self isAudible = call setAudibleBell_ (VteTerminalClass.toBase self & isAudible)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteEraseBinding.FFI.withVal ---> I
    in
      fun setBackspaceBinding self binding = call setBackspaceBinding_ (VteTerminalClass.toBase self & binding)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setBoldIsBright self boldIsBright = call setBoldIsBright_ (VteTerminalClass.toBase self & boldIsBright)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setCellHeightScale self scale = call setCellHeightScale_ (VteTerminalClass.toBase self & scale)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setCellWidthScale self scale = call setCellWidthScale_ (VteTerminalClass.toBase self & scale)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setCjkAmbiguousWidth self width = call setCjkAmbiguousWidth_ (VteTerminalClass.toBase self & width)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setClearBackground self setting = call setClearBackground_ (VteTerminalClass.toBase self & setting)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I
    in
      fun setColorBackground self background = call setColorBackground_ (VteTerminalClass.toBase self & background)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorBold self bold = call setColorBold_ (VteTerminalClass.toBase self & bold)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorCursor self cursorBackground = call setColorCursor_ (VteTerminalClass.toBase self & cursorBackground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorCursorForeground self cursorForeground = call setColorCursorForeground_ (VteTerminalClass.toBase self & cursorForeground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I
    in
      fun setColorForeground self foreground = call setColorForeground_ (VteTerminalClass.toBase self & foreground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlight self highlightBackground = call setColorHighlight_ (VteTerminalClass.toBase self & highlightBackground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlightForeground self highlightForeground = call setColorHighlightForeground_ (VteTerminalClass.toBase self & highlightForeground)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecordCArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> I
    in
      fun setColors
        self
        (
          foreground,
          background,
          palette
        ) =
        let
          val paletteSize = GdkRgbaRecordCArrayN.length palette
          val () =
            call setColors_
              (
                VteTerminalClass.toBase self
                 & foreground
                 & background
                 & palette
                 & paletteSize
              )
        in
          ()
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteCursorBlinkMode.FFI.withVal ---> I
    in
      fun setCursorBlinkMode self mode = call setCursorBlinkMode_ (VteTerminalClass.toBase self & mode)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteCursorShape.FFI.withVal ---> I
    in
      fun setCursorShape self shape = call setCursorShape_ (VteTerminalClass.toBase self & shape)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun setDefaultColors self = call setDefaultColors_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteEraseBinding.FFI.withVal ---> I
    in
      fun setDeleteBinding self binding = call setDeleteBinding_ (VteTerminalClass.toBase self & binding)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setEnableBidi self enableBidi = call setEnableBidi_ (VteTerminalClass.toBase self & enableBidi)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setEnableShaping self enableShaping = call setEnableShaping_ (VteTerminalClass.toBase self & enableShaping)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setEnableSixel self enabled = call setEnableSixel_ (VteTerminalClass.toBase self & enabled)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
    in
      fun setEncoding self codeset =
        call setEncoding_
          (
            VteTerminalClass.toBase self
             & codeset
             & []
          )
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I
    in
      fun setFont self fontDesc = call setFont_ (VteTerminalClass.toBase self & fontDesc)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setFontScale self scale = call setFontScale_ (VteTerminalClass.toBase self & scale)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I
    in
      fun setGeometryHintsForWindow self window = call setGeometryHintsForWindow_ (VteTerminalClass.toBase self & GtkWindowClass.toBase window)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setInputEnabled self enabled = call setInputEnabled_ (VteTerminalClass.toBase self & enabled)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setMouseAutohide self setting = call setMouseAutohide_ (VteTerminalClass.toBase self & setting)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VtePtyClass.FFI.withOptPtr false ---> I
    in
      fun setPty self pty = call setPty_ (VteTerminalClass.toBase self & Option.map VtePtyClass.toBase pty)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setRewrapOnResize self rewrap = call setRewrapOnResize_ (VteTerminalClass.toBase self & rewrap)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setScrollOnKeystroke self scroll = call setScrollOnKeystroke_ (VteTerminalClass.toBase self & scroll)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setScrollOnOutput self scroll = call setScrollOnOutput_ (VteTerminalClass.toBase self & scroll)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I
    in
      fun setScrollSpeed self scrollSpeed = call setScrollSpeed_ (VteTerminalClass.toBase self & scrollSpeed)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GLong.FFI.withVal ---> I
    in
      fun setScrollbackLines self lines = call setScrollbackLines_ (VteTerminalClass.toBase self & lines)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         ---> I
    in
      fun setSize self (columns, rows) =
        call setSize_
          (
            VteTerminalClass.toBase self
             & columns
             & rows
          )
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteTextBlinkMode.FFI.withVal ---> I
    in
      fun setTextBlinkMode self textBlinkMode = call setTextBlinkMode_ (VteTerminalClass.toBase self & textBlinkMode)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun setWordCharExceptions self exceptions = call setWordCharExceptions_ (VteTerminalClass.toBase self & exceptions)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> VtePtyFlags.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withOptPtr 0
         &&&> GLibSpawnFlags.FFI.withVal
         &&&> GLibSpawnChildSetupFunc.FFI.withOptDispatchPtr false
         &&&> GLibSpawnChildSetupFunc.FFI.withOptPtr true
         &&&> GLibPid.FFI.withRefVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibPid.FFI.fromVal
               && I
    in
      fun spawnSync terminal (ptyFlags, workingDirectory, argv, envv, spawnFlags, childSetup, cancellable) =
        let
          val
            childPid
             & _ =
            call spawnSync_
              (
                VteTerminalClass.toBase terminal
                 & ptyFlags
                 & workingDirectory
                 & argv
                 & envv
                 & spawnFlags
                 & isSome childSetup
                 & childSetup
                 & GLibPid.null
                 & Option.map GioCancellableClass.toBase cancellable
                 & [GLibSpawnError.handler]
              )
        in
          childPid
        end
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun unselectAll self = call unselectAll_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GLibPid.FFI.withVal ---> I
    in
      fun watchChild self childPid = call watchChild_ (VteTerminalClass.toBase self & childPid)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GioOutputStreamClass.FFI.withPtr false
         &&&> VteWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
    in
      fun writeContentsSync
        self
        (
          stream,
          flags,
          cancellable
        ) =
        call writeContentsSync_
          (
            VteTerminalClass.toBase self
             & GioOutputStreamClass.toBase stream
             & flags
             & Option.map GioCancellableClass.toBase cancellable
             & []
          )
    end
    local
      open ClosureMarshal Signal
    in
      fun bellSig f =
        signal "bell" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun charSizeChangedSig f =
        signal "char-size-changed" (get 0w1 uint &&&> get 0w2 uint ---> ret_void)
          (
            fn
              width & height =>
                let
                  val () = f (width, height)
                in
                  ()
                end
          )
      fun childExitedSig f =
        signal "child-exited" (get 0w1 int ---> ret_void)
          (
            fn
              status =>
                let
                  val () = f status
                in
                  ()
                end
          )
      fun commitSig f =
        signal "commit" (get 0w1 string &&&> get 0w2 uint ---> ret_void)
          (
            fn
              text & size =>
                let
                  val () = f (text, size)
                in
                  ()
                end
          )
      fun contentsChangedSig f =
        signal "contents-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun copyClipboardSig f =
        signal "copy-clipboard" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun currentDirectoryUriChangedSig f =
        signal "current-directory-uri-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun currentFileUriChangedSig f =
        signal "current-file-uri-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun cursorMovedSig f =
        signal "cursor-moved" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun decreaseFontSizeSig f =
        signal "decrease-font-size" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun deiconifyWindowSig f =
        signal "deiconify-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun encodingChangedSig f =
        signal "encoding-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun eofSig f =
        signal "eof" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun hyperlinkHoverUriChangedSig f =
        signal "hyperlink-hover-uri-changed" (get 0w1 string &&&> get 0w2 GdkRectangleRecord.t ---> ret_void)
          (
            fn
              uri & bbox =>
                let
                  val () = f (uri, bbox)
                in
                  ()
                end
          )
      fun iconTitleChangedSig f =
        signal "icon-title-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun iconifyWindowSig f =
        signal "iconify-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun increaseFontSizeSig f =
        signal "increase-font-size" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun lowerWindowSig f =
        signal "lower-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun maximizeWindowSig f =
        signal "maximize-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun moveWindowSig f =
        signal "move-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void)
          (
            fn
              x & y =>
                let
                  val () = f (x, y)
                in
                  ()
                end
          )
      fun notificationReceivedSig f =
        signal "notification-received" (get 0w1 string &&&> get 0w2 stringOpt ---> ret_void)
          (
            fn
              summary & body =>
                let
                  val () = f (summary, body)
                in
                  ()
                end
          )
      fun pasteClipboardSig f =
        signal "paste-clipboard" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun raiseWindowSig f =
        signal "raise-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun refreshWindowSig f =
        signal "refresh-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun resizeWindowSig f =
        signal "resize-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void)
          (
            fn
              width & height =>
                let
                  val () = f (width, height)
                in
                  ()
                end
          )
      fun restoreWindowSig f =
        signal "restore-window" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun selectionChangedSig f =
        signal "selection-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun shellPrecmdSig f =
        signal "shell-precmd" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun shellPreexecSig f =
        signal "shell-preexec" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun textDeletedSig f =
        signal "text-deleted" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun textInsertedSig f =
        signal "text-inserted" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun textModifiedSig f =
        signal "text-modified" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun textScrolledSig f =
        signal "text-scrolled" (get 0w1 int ---> ret_void)
          (
            fn
              delta =>
                let
                  val () = f delta
                in
                  ()
                end
          )
      fun windowTitleChangedSig f =
        signal "window-title-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
    end
    local
      open ValueAccessor
    in
      val allowBoldProp =
        {
          name = "allow-bold",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val allowHyperlinkProp =
        {
          name = "allow-hyperlink",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val audibleBellProp =
        {
          name = "audible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val backspaceBindingProp =
        {
          name = "backspace-binding",
          gtype = fn () => C.gtype VteEraseBinding.t (),
          get = fn _ => fn v => fn () => C.get VteEraseBinding.t v,
          set = fn _ => fn v => fn x => C.set VteEraseBinding.t v x,
          init = fn v => fn x => C.set VteEraseBinding.t v x
        }
      val boldIsBrightProp =
        {
          name = "bold-is-bright",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val cellHeightScaleProp =
        {
          name = "cell-height-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val cellWidthScaleProp =
        {
          name = "cell-width-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val cjkAmbiguousWidthProp =
        {
          name = "cjk-ambiguous-width",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val currentContainerNameProp =
        {
          name = "current-container-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val currentContainerRuntimeProp =
        {
          name = "current-container-runtime",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val currentDirectoryUriProp =
        {
          name = "current-directory-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val currentFileUriProp =
        {
          name = "current-file-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val cursorBlinkModeProp =
        {
          name = "cursor-blink-mode",
          gtype = fn () => C.gtype VteCursorBlinkMode.t (),
          get = fn _ => fn v => fn () => C.get VteCursorBlinkMode.t v,
          set = fn _ => fn v => fn x => C.set VteCursorBlinkMode.t v x,
          init = fn v => fn x => C.set VteCursorBlinkMode.t v x
        }
      val cursorShapeProp =
        {
          name = "cursor-shape",
          gtype = fn () => C.gtype VteCursorShape.t (),
          get = fn _ => fn v => fn () => C.get VteCursorShape.t v,
          set = fn _ => fn v => fn x => C.set VteCursorShape.t v x,
          init = fn v => fn x => C.set VteCursorShape.t v x
        }
      val deleteBindingProp =
        {
          name = "delete-binding",
          gtype = fn () => C.gtype VteEraseBinding.t (),
          get = fn _ => fn v => fn () => C.get VteEraseBinding.t v,
          set = fn _ => fn v => fn x => C.set VteEraseBinding.t v x,
          init = fn v => fn x => C.set VteEraseBinding.t v x
        }
      val enableBidiProp =
        {
          name = "enable-bidi",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val enableShapingProp =
        {
          name = "enable-shaping",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val enableSixelProp =
        {
          name = "enable-sixel",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val encodingProp =
        {
          name = "encoding",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
      val fontDescProp =
        {
          name = "font-desc",
          gtype = fn () => C.gtype PangoFontDescriptionRecord.tOpt (),
          get = fn _ => fn v => fn () => C.get PangoFontDescriptionRecord.tOpt v,
          set = fn _ => fn v => fn x => C.set PangoFontDescriptionRecord.tOpt v x,
          init = fn v => fn x => C.set PangoFontDescriptionRecord.tOpt v x
        }
      val fontScaleProp =
        {
          name = "font-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val hyperlinkHoverUriProp =
        {
          name = "hyperlink-hover-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val iconTitleProp =
        {
          name = "icon-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val inputEnabledProp =
        {
          name = "input-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val pointerAutohideProp =
        {
          name = "pointer-autohide",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val ptyProp =
        {
          name = "pty",
          gtype = fn () => C.gtype VtePtyClass.tOpt (),
          get = fn _ => fn v => fn () => C.get VtePtyClass.tOpt v,
          set = fn _ => fn v => fn x => C.set VtePtyClass.tOpt v (Option.map VtePtyClass.toBase x),
          init = fn v => fn x => C.set VtePtyClass.tOpt v (Option.map VtePtyClass.toBase x)
        }
      val rewrapOnResizeProp =
        {
          name = "rewrap-on-resize",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val scrollOnKeystrokeProp =
        {
          name = "scroll-on-keystroke",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val scrollOnOutputProp =
        {
          name = "scroll-on-output",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val scrollSpeedProp =
        {
          name = "scroll-speed",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn v => fn () => C.get uint v,
          set = fn _ => fn v => fn x => C.set uint v x,
          init = fn v => fn x => C.set uint v x
        }
      val scrollbackLinesProp =
        {
          name = "scrollback-lines",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn v => fn () => C.get uint v,
          set = fn _ => fn v => fn x => C.set uint v x,
          init = fn v => fn x => C.set uint v x
        }
      val textBlinkModeProp =
        {
          name = "text-blink-mode",
          gtype = fn () => C.gtype VteTextBlinkMode.t (),
          get = fn _ => fn v => fn () => C.get VteTextBlinkMode.t v,
          set = fn _ => fn v => fn x => C.set VteTextBlinkMode.t v x,
          init = fn v => fn x => C.set VteTextBlinkMode.t v x
        }
      val windowTitleProp =
        {
          name = "window-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val wordCharExceptionsProp =
        {
          name = "word-char-exceptions",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
    end
  end
