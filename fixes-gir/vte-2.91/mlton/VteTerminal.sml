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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.FFI.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.FFI.withPtr false ---> I) copyClipboard_ self
    fun copyClipboardFormat self format = (VteTerminalClass.FFI.withPtr false &&&> VteFormat.FFI.withVal ---> I) copyClipboardFormat_ (self & format)
    fun copyPrimary self = (VteTerminalClass.FFI.withPtr false ---> I) copyPrimary_ self
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
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkEvent.FFI.withPtr false
             &&&> VteRegexRecordCPtrArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> GUInt32.FFI.withVal
             &&&> GSize.FFI.withRefVal
             ---> GSize.FFI.fromVal && Utf8CPtrArrayN.FFI.fromPtr ~1
          )
            eventCheckRegexSimple_
            (
              self
               & event
               & regexes
               & nRegexes
               & matchFlags
               & GSize.null
            )
      in
        retVal nMatches
      end
    fun feed self data =
      let
        val length = GUInt8CArrayN.length data
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
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
    fun feedChild self text =
      let
        val length = GUInt8CArrayN.length text
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             ---> I
          )
            feedChild_
            (
              self
               & text
               & length
            )
      in
        ()
      end
    fun feedChildBinary self data =
      let
        val length = GUInt8CArrayN.length data
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
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
    fun getAllowHyperlink self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAllowHyperlink_ self
    fun getAudibleBell self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAudibleBell_ self
    fun getBoldIsBright self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getBoldIsBright_ self
    fun getCellHeightScale self = (VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getCellHeightScale_ self
    fun getCellWidthScale self = (VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getCellWidthScale_ self
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getCharWidth_ self
    fun getCjkAmbiguousWidth self = (VteTerminalClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCjkAmbiguousWidth_ self
    fun getColorBackgroundForDraw self =
      let
        val color & () = (VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) getColorBackgroundForDraw_ (self & ())
      in
        color
      end
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getColumnCount_ self
    fun getCurrentContainerName self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getCurrentContainerName_ self before VteTerminalClass.FFI.touchPtr self
    fun getCurrentContainerRuntime self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getCurrentContainerRuntime_ self before VteTerminalClass.FFI.touchPtr self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getCurrentDirectoryUri_ self before VteTerminalClass.FFI.touchPtr self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getCurrentFileUri_ self before VteTerminalClass.FFI.touchPtr self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr false ---> VteCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
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
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr false ---> VteCursorShape.FFI.fromVal) getCursorShape_ self
    fun getEnableBidi self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableBidi_ self
    fun getEnableShaping self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableShaping_ self
    fun getEnableSixel self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableSixel_ self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getEncoding_ self before VteTerminalClass.FFI.touchPtr self
    fun getFont self = (VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self before VteTerminalClass.FFI.touchPtr self
    fun getFontScale self = (VteTerminalClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getFontScale_ self
    fun getGeometryHints self (minRows, minColumns) =
      let
        val hints & () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkGeometryRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
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
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getIconTitle_ self before VteTerminalClass.FFI.touchPtr self
    fun getInputEnabled self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPty self = (VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false) getPty_ self before VteTerminalClass.FFI.touchPtr self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getRowCount_ self
    fun getScrollOnKeystroke self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getScrollOnKeystroke_ self
    fun getScrollOnOutput self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getScrollOnOutput_ self
    fun getScrollbackLines self = (VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal) getScrollbackLines_ self
    fun getTextBlinkMode self = (VteTerminalClass.FFI.withPtr false ---> VteTextBlinkMode.FFI.fromVal) getTextBlinkMode_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getWindowTitle_ self before VteTerminalClass.FFI.touchPtr self
    fun getWordCharExceptions self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getWordCharExceptions_ self before VteTerminalClass.FFI.touchPtr self
    fun hyperlinkCheckEvent self event = (VteTerminalClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) hyperlinkCheckEvent_ (self & event)
    fun matchAddGregex self (gregex, gflags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt.FFI.fromVal
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
         ---> GInt.FFI.fromVal
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
             &&&> GLong.FFI.withVal
             &&&> GLong.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
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
    fun matchCheckEvent self event =
      let
        val tag & retVal =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkEvent.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
          )
            matchCheckEvent_
            (
              self
               & event
               & GInt.null
            )
      in
        (retVal, tag)
      end
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) matchRemove_ (self & tag)
    fun matchRemoveAll self = (VteTerminalClass.FFI.withPtr false ---> I) matchRemoveAll_ self
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
    fun searchGetGregex self = (VteTerminalClass.FFI.withPtr false ---> GLibRegexRecord.FFI.fromPtr false) searchGetGregex_ self before VteTerminalClass.FFI.touchPtr self
    fun searchGetRegex self = (VteTerminalClass.FFI.withPtr false ---> VteRegexRecord.FFI.fromPtr false) searchGetRegex_ self before VteTerminalClass.FFI.touchPtr self
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
    fun setAllowHyperlink self allowHyperlink = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAllowHyperlink_ (self & allowHyperlink)
    fun setAudibleBell self isAudible = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.FFI.withPtr false &&&> VteEraseBinding.FFI.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setBoldIsBright self boldIsBright = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setBoldIsBright_ (self & boldIsBright)
    fun setCellHeightScale self scale = (VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setCellHeightScale_ (self & scale)
    fun setCellWidthScale self scale = (VteTerminalClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setCellWidthScale_ (self & scale)
    fun setCjkAmbiguousWidth self width = (VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setCjkAmbiguousWidth_ (self & width)
    fun setClearBackground self setting = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setClearBackground_ (self & setting)
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
    fun setEnableBidi self enableBidi = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableBidi_ (self & enableBidi)
    fun setEnableShaping self enableShaping = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableShaping_ (self & enableShaping)
    fun setEnableSixel self enabled = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableSixel_ (self & enabled)
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
    fun setScrollSpeed self scrollSpeed = (VteTerminalClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setScrollSpeed_ (self & scrollSpeed)
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
    fun setTextBlinkMode self textBlinkMode = (VteTerminalClass.FFI.withPtr false &&&> VteTextBlinkMode.FFI.withVal ---> I) setTextBlinkMode_ (self & textBlinkMode)
    fun setWordCharExceptions self exceptions = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWordCharExceptions_ (self & exceptions)
    fun spawnSync terminal (ptyFlags, workingDirectory, argv, envv, spawnFlags, childSetup, cancellable) =
      let
        val
          childPid
           & _ =
          (
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
          )
            spawnSync_
            (
              terminal
               & ptyFlags
               & workingDirectory
               & argv
               & envv
               & spawnFlags
               & isSome childSetup
               & childSetup
               & GLibPid.null
               & cancellable
               & [GLibSpawnError.handler]
            )
      in
        childPid
      end
    fun unselectAll self = (VteTerminalClass.FFI.withPtr false ---> I) unselectAll_ self
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr false &&&> GLibPid.FFI.withVal ---> I) watchChild_ (self & childPid)
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
      fun hyperlinkHoverUriChangedSig f = signal "hyperlink-hover-uri-changed" (get 0w1 string &&&> get 0w2 GdkRectangleRecord.t ---> ret_void) (fn uri & bbox => f (uri, bbox))
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
      fun shellPrecmdSig f = signal "shell-precmd" (void ---> ret_void) f
      fun shellPreexecSig f = signal "shell-preexec" (void ---> ret_void) f
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
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val allowHyperlinkProp =
        {
          name = "allow-hyperlink",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val audibleBellProp =
        {
          name = "audible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backspaceBindingProp =
        {
          name = "backspace-binding",
          gtype = fn () => C.gtype VteEraseBinding.t (),
          get = fn _ => fn x => fn () => C.get VteEraseBinding.t x,
          set = fn _ => fn x => C.set VteEraseBinding.t x,
          init = fn x => C.set VteEraseBinding.t x
        }
      val boldIsBrightProp =
        {
          name = "bold-is-bright",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val cellHeightScaleProp =
        {
          name = "cell-height-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val cellWidthScaleProp =
        {
          name = "cell-width-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val cjkAmbiguousWidthProp =
        {
          name = "cjk-ambiguous-width",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val currentContainerNameProp =
        {
          name = "current-container-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val currentContainerRuntimeProp =
        {
          name = "current-container-runtime",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val currentDirectoryUriProp =
        {
          name = "current-directory-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val currentFileUriProp =
        {
          name = "current-file-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val cursorBlinkModeProp =
        {
          name = "cursor-blink-mode",
          gtype = fn () => C.gtype VteCursorBlinkMode.t (),
          get = fn _ => fn x => fn () => C.get VteCursorBlinkMode.t x,
          set = fn _ => fn x => C.set VteCursorBlinkMode.t x,
          init = fn x => C.set VteCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          name = "cursor-shape",
          gtype = fn () => C.gtype VteCursorShape.t (),
          get = fn _ => fn x => fn () => C.get VteCursorShape.t x,
          set = fn _ => fn x => C.set VteCursorShape.t x,
          init = fn x => C.set VteCursorShape.t x
        }
      val deleteBindingProp =
        {
          name = "delete-binding",
          gtype = fn () => C.gtype VteEraseBinding.t (),
          get = fn _ => fn x => fn () => C.get VteEraseBinding.t x,
          set = fn _ => fn x => C.set VteEraseBinding.t x,
          init = fn x => C.set VteEraseBinding.t x
        }
      val enableBidiProp =
        {
          name = "enable-bidi",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val enableShapingProp =
        {
          name = "enable-shaping",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val enableSixelProp =
        {
          name = "enable-sixel",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val encodingProp =
        {
          name = "encoding",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val fontDescProp =
        {
          name = "font-desc",
          gtype = fn () => C.gtype PangoFontDescriptionRecord.tOpt (),
          get = fn _ => fn x => fn () => C.get PangoFontDescriptionRecord.tOpt x,
          set = fn _ => fn x => C.set PangoFontDescriptionRecord.tOpt x,
          init = fn x => C.set PangoFontDescriptionRecord.tOpt x
        }
      val fontScaleProp =
        {
          name = "font-scale",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val hyperlinkHoverUriProp =
        {
          name = "hyperlink-hover-uri",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val iconTitleProp =
        {
          name = "icon-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val inputEnabledProp =
        {
          name = "input-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pointerAutohideProp =
        {
          name = "pointer-autohide",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val ptyProp =
        {
          name = "pty",
          gtype = fn () => C.gtype VtePtyClass.tOpt (),
          get = fn _ => fn x => fn () => C.get VtePtyClass.tOpt x,
          set = fn _ => fn x => C.set VtePtyClass.tOpt x,
          init = fn x => C.set VtePtyClass.tOpt x
        }
      val rewrapOnResizeProp =
        {
          name = "rewrap-on-resize",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollOnKeystrokeProp =
        {
          name = "scroll-on-keystroke",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollOnOutputProp =
        {
          name = "scroll-on-output",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scrollSpeedProp =
        {
          name = "scroll-speed",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn x => fn () => C.get uint x,
          set = fn _ => fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val scrollbackLinesProp =
        {
          name = "scrollback-lines",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn x => fn () => C.get uint x,
          set = fn _ => fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val textBlinkModeProp =
        {
          name = "text-blink-mode",
          gtype = fn () => C.gtype VteTextBlinkMode.t (),
          get = fn _ => fn x => fn () => C.get VteTextBlinkMode.t x,
          set = fn _ => fn x => C.set VteTextBlinkMode.t x,
          init = fn x => C.set VteTextBlinkMode.t x
        }
      val windowTitleProp =
        {
          name = "window-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val wordCharExceptionsProp =
        {
          name = "word-char-exceptions",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
    end
  end
