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
    val new_ = _import "vte_terminal_new" reentrant : unit -> VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val feed_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed" reentrant :
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
            _import "mlton_vte_terminal_feed_child" reentrant :
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
            _import "mlton_vte_terminal_feed_child_binary" reentrant :
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
    val forkCommandFull_ =
      fn x1 & x2 & (x3, x4) & (x5, x6) & (x7, x8) & x9 & x10 & x11 & x12 & x13 =>
        (
          _import "mlton_vte_terminal_fork_command_full" reentrant :
            GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
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
            x13
          )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getChildExitStatus_ = _import "vte_terminal_get_child_exit_status" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GInt.FFI.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteTerminalCursorBlinkMode.FFI.val_;
    val getCursorPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_get_cursor_position" reentrant :
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
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VteTerminalCursorShape.FFI.val_;
    val getDefaultEmulation_ = _import "vte_terminal_get_default_emulation" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEmulation_ = _import "vte_terminal_get_emulation" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEncoding_ = _import "vte_terminal_get_encoding" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFont_ = _import "vte_terminal_get_font" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;
    val getHasSelection_ = _import "vte_terminal_get_has_selection" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getPtyObject_ = _import "vte_terminal_get_pty_object" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLong.FFI.val_;
    val getStatusLine_ = _import "vte_terminal_get_status_line" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getVisibleBell_ = _import "vte_terminal_get_visible_bell" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val isWordChar_ = fn x1 & x2 => (_import "vte_terminal_is_word_char" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GChar.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" reentrant :
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
            _import "vte_terminal_match_check" reentrant :
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
    val matchClearAll_ = _import "vte_terminal_match_clear_all" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val matchSetCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_set_cursor" reentrant :
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
            _import "mlton_vte_terminal_match_set_cursor_name" reentrant :
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
            _import "vte_terminal_match_set_cursor_type" reentrant :
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
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val ptyNew_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_pty_new" reentrant :
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
            _import "vte_terminal_reset" reentrant :
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
    val searchFindNext_ = _import "vte_terminal_search_find_next" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GLibRegexRecord.FFI.non_opt GLibRegexRecord.FFI.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> GBool.FFI.val_;
    val searchSetGregex_ = fn x1 & x2 => (_import "vte_terminal_search_set_gregex" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLibRegexRecord.FFI.opt GLibRegexRecord.FFI.p -> unit;) (x1, x2)
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val selectNone_ = _import "vte_terminal_select_none" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBackgroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_background_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorBoldRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorCursorRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorDim_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorDimRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_dim_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightForegroundRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColorHighlightRgba_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_rgba" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p -> unit;) (x1, x2)
    val setColors_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_vte_terminal_set_colors" reentrant :
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
            _import "mlton_vte_terminal_set_colors_rgba" reentrant :
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
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalCursorBlinkMode.FFI.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalCursorShape.FFI.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VteTerminalEraseBinding.FFI.val_ -> unit;) (x1, x2)
    val setEmulation_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_emulation" reentrant :
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
            _import "mlton_vte_terminal_set_encoding" reentrant :
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
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontFromString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_font_from_string" reentrant :
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
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPtyObject_ = fn x1 & x2 => (_import "vte_terminal_set_pty_object" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * VtePtyClass.FFI.opt VtePtyClass.FFI.p -> unit;) (x1, x2)
    val setRewrapOnResize_ = fn x1 & x2 => (_import "vte_terminal_set_rewrap_on_resize" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLong.FFI.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" reentrant :
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
    val setVisibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_visible_bell" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWordChars_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_terminal_set_word_chars" reentrant :
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
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" reentrant : VteTerminalClass.FFI.non_opt VteTerminalClass.FFI.p * GLibPid.FFI.val_ -> unit;) (x1, x2)
    val writeContents_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents" reentrant :
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
    local
      val conv = GObjectObjectClass.FFI.withPtr false (AtkImplementorIfaceClass.FFI.fromPtr false)
    in
      fun asImplementorIface self = conv (GObjectObjectClass.toBase self)
    end
    local
      val conv = GObjectObjectClass.FFI.withPtr false (GtkBuildableClass.FFI.fromPtr false)
    in
      fun asBuildable self = conv (GObjectObjectClass.toBase self)
    end
    local
      val conv = GObjectObjectClass.FFI.withPtr false (GtkScrollableClass.FFI.fromPtr false)
    in
      fun asScrollable self = conv (GObjectObjectClass.toBase self)
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
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun copyPrimary self = call copyPrimary_ (VteTerminalClass.toBase self)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         ---> I
    in
      fun feed self data =
        let
          val length = LargeInt.fromInt (GUInt8CArrayN.length data)
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
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         ---> I
    in
      fun feedChild self (text, length) =
        call feedChild_
          (
            VteTerminalClass.toBase self
             & text
             & length
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLong.FFI.withVal
         ---> I
    in
      fun feedChildBinary self (data, length) =
        call feedChildBinary_
          (
            VteTerminalClass.toBase self
             & data
             & length
          )
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> VtePtyFlags.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withOptPtr 0
         &&&> GLibSpawnFlags.FFI.withVal
         &&&> GLibSpawnChildSetupFunc.FFI.withOptDispatchPtr true
         &&&> GLibSpawnChildSetupFunc.FFI.withOptPtr false
         &&&> GLibPid.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GLibPid.FFI.fromVal
               && I
    in
      fun forkCommandFull self (ptyFlags, workingDirectory, argv, envv, spawnFlags) =
        let
          val childPid & _ =
            call forkCommandFull_
              (
                VteTerminalClass.toBase self
                 & ptyFlags
                 & workingDirectory
                 & argv
                 & envv
                 & spawnFlags
                 & isSome NONE
                 & NONE
                 & GLibPid.null 
                 & [GLibSpawnError.handler]
              )
        in
          childPid
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
      fun getAudibleBell self = call getAudibleBell_ (VteTerminalClass.toBase self)
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
      fun getChildExitStatus self = call getChildExitStatus_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GLong.FFI.fromVal
    in
      fun getColumnCount self = call getColumnCount_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getCurrentDirectoryUri self = call getCurrentDirectoryUri_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getCurrentFileUri self = call getCurrentFileUri_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorBlinkMode.FFI.fromVal
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
      val call = VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorShape.FFI.fromVal
    in
      fun getCursorShape self = call getCursorShape_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getDefaultEmulation self = call getDefaultEmulation_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getEmulation self = call getEmulation_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getEncoding self = call getEncoding_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false
    in
      fun getFont self = call getFont_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHasSelection self = call getHasSelection_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getIconTitle self = call getIconTitle_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getMouseAutohide self = call getMouseAutohide_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false
    in
      fun getPtyObject self = call getPtyObject_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
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
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getStatusLine self = call getStatusLine_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getVisibleBell self = call getVisibleBell_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getWindowTitle self = call getWindowTitle_ (VteTerminalClass.toBase self) before VteTerminalClass.FFI.touchPtr self
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GChar.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun isWordChar self c = call isWordChar_ (VteTerminalClass.toBase self & c)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt.FFI.fromVal
    in
      fun matchAddGregex self (regex, flags) =
        call matchAddGregex_
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
         ---> GInt.FFI.fromVal && Utf8.FFI.fromPtr ~1
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
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun matchClearAll self = call matchClearAll_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun matchRemove self tag = call matchRemove_ (VteTerminalClass.toBase self & tag)
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
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
    in
      fun ptyNew self flags =
        call ptyNew_
          (
            VteTerminalClass.toBase self
             & flags
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
      val call = VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun searchGetWrapAround self = call searchGetWrapAround_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GLibRegexRecord.FFI.withOptPtr false ---> I
    in
      fun searchSetGregex self regex = call searchSetGregex_ (VteTerminalClass.toBase self & regex)
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
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun selectNone self = call selectNone_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAllowBold self allowBold = call setAllowBold_ (VteTerminalClass.toBase self & allowBold)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAudibleBell self isAudible = call setAudibleBell_ (VteTerminalClass.toBase self & isAudible)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteTerminalEraseBinding.FFI.withVal ---> I
    in
      fun setBackspaceBinding self binding = call setBackspaceBinding_ (VteTerminalClass.toBase self & binding)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I
    in
      fun setColorBackground self background = call setColorBackground_ (VteTerminalClass.toBase self & background)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I
    in
      fun setColorBackgroundRgba self background = call setColorBackgroundRgba_ (VteTerminalClass.toBase self & background)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I
    in
      fun setColorBold self bold = call setColorBold_ (VteTerminalClass.toBase self & bold)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorBoldRgba self bold = call setColorBoldRgba_ (VteTerminalClass.toBase self & bold)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I
    in
      fun setColorCursor self cursorBackground = call setColorCursor_ (VteTerminalClass.toBase self & cursorBackground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorCursorRgba self cursorBackground = call setColorCursorRgba_ (VteTerminalClass.toBase self & cursorBackground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I
    in
      fun setColorDim self dim = call setColorDim_ (VteTerminalClass.toBase self & dim)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorDimRgba self dim = call setColorDimRgba_ (VteTerminalClass.toBase self & dim)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I
    in
      fun setColorForeground self foreground = call setColorForeground_ (VteTerminalClass.toBase self & foreground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I
    in
      fun setColorForegroundRgba self foreground = call setColorForegroundRgba_ (VteTerminalClass.toBase self & foreground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlight self highlightBackground = call setColorHighlight_ (VteTerminalClass.toBase self & highlightBackground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlightForeground self highlightForeground = call setColorHighlightForeground_ (VteTerminalClass.toBase self & highlightForeground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlightForegroundRgba self highlightForeground = call setColorHighlightForegroundRgba_ (VteTerminalClass.toBase self & highlightForeground)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withOptPtr false ---> I
    in
      fun setColorHighlightRgba self highlightBackground = call setColorHighlightRgba_ (VteTerminalClass.toBase self & highlightBackground)
    end
    local
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         &&&> GdkColorRecordCArrayN.FFI.withPtr 0
         &&&> GLong.FFI.withVal
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
          val paletteSize = LargeInt.fromInt (GdkColorRecordCArrayN.length palette)
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
      val call =
        VteTerminalClass.FFI.withPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecordCArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> I
    in
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
            call setColorsRgba_
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
      val call = VteTerminalClass.FFI.withPtr false &&&> VteTerminalCursorBlinkMode.FFI.withVal ---> I
    in
      fun setCursorBlinkMode self mode = call setCursorBlinkMode_ (VteTerminalClass.toBase self & mode)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteTerminalCursorShape.FFI.withVal ---> I
    in
      fun setCursorShape self shape = call setCursorShape_ (VteTerminalClass.toBase self & shape)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false ---> I
    in
      fun setDefaultColors self = call setDefaultColors_ (VteTerminalClass.toBase self)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VteTerminalEraseBinding.FFI.withVal ---> I
    in
      fun setDeleteBinding self binding = call setDeleteBinding_ (VteTerminalClass.toBase self & binding)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I
    in
      fun setEmulation self emulation = call setEmulation_ (VteTerminalClass.toBase self & emulation)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I
    in
      fun setEncoding self codeset = call setEncoding_ (VteTerminalClass.toBase self & codeset)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I
    in
      fun setFont self fontDesc = call setFont_ (VteTerminalClass.toBase self & fontDesc)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun setFontFromString self name = call setFontFromString_ (VteTerminalClass.toBase self & name)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setMouseAutohide self setting = call setMouseAutohide_ (VteTerminalClass.toBase self & setting)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> VtePtyClass.FFI.withOptPtr false ---> I
    in
      fun setPtyObject self pty = call setPtyObject_ (VteTerminalClass.toBase self & Option.map VtePtyClass.toBase pty)
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
      val call = VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setVisibleBell self isVisible = call setVisibleBell_ (VteTerminalClass.toBase self & isVisible)
    end
    local
      val call = VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun setWordChars self spec = call setWordChars_ (VteTerminalClass.toBase self & spec)
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
         &&&> VteTerminalWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
    in
      fun writeContents
        self
        (
          stream,
          flags,
          cancellable
        ) =
        call writeContents_
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
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val beepSig =
          {
            name = "beep",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
        fun hConv
          f
          (
            self
             & width
             & height
          ) =
          let
            val () = f (GObjectObjectClass.toBase self) (width, height)
          in
            ()
          end
        fun eConv f self (width, height) =
          let
            val () =
              f
                (
                  VteTerminalClass.toBase self
                   & width
                   & height
                )
          in
            ()
          end
      in
        val charSizeChangedSig =
          {
            name = "char-size-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val childExitedSig =
          {
            name = "child-exited",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 string
           &&&> parIn 2 uint
           ---> retVoid
        fun hConv
          f
          (
            self
             & text
             & size
          ) =
          let
            val () = f (GObjectObjectClass.toBase self) (text, size)
          in
            ()
          end
        fun eConv f self (text, size) =
          let
            val () =
              f
                (
                  VteTerminalClass.toBase self
                   & text
                   & size
                )
          in
            ()
          end
      in
        val commitSig =
          {
            name = "commit",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val contentsChangedSig =
          {
            name = "contents-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val copyClipboardSig =
          {
            name = "copy-clipboard",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val currentDirectoryUriChangedSig =
          {
            name = "current-directory-uri-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val currentFileUriChangedSig =
          {
            name = "current-file-uri-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val cursorMovedSig =
          {
            name = "cursor-moved",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val decreaseFontSizeSig =
          {
            name = "decrease-font-size",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val deiconifyWindowSig =
          {
            name = "deiconify-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val emulationChangedSig =
          {
            name = "emulation-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val encodingChangedSig =
          {
            name = "encoding-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val eofSig =
          {
            name = "eof",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val iconTitleChangedSig =
          {
            name = "icon-title-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val iconifyWindowSig =
          {
            name = "iconify-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val increaseFontSizeSig =
          {
            name = "increase-font-size",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val lowerWindowSig =
          {
            name = "lower-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val maximizeWindowSig =
          {
            name = "maximize-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
        fun hConv
          f
          (
            self
             & x
             & y
          ) =
          let
            val () = f (GObjectObjectClass.toBase self) (x, y)
          in
            ()
          end
        fun eConv f self (x, y) =
          let
            val () =
              f
                (
                  VteTerminalClass.toBase self
                   & x
                   & y
                )
          in
            ()
          end
      in
        val moveWindowSig =
          {
            name = "move-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val pasteClipboardSig =
          {
            name = "paste-clipboard",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val raiseWindowSig =
          {
            name = "raise-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val refreshWindowSig =
          {
            name = "refresh-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
        fun hConv
          f
          (
            self
             & width
             & height
          ) =
          let
            val () = f (GObjectObjectClass.toBase self) (width, height)
          in
            ()
          end
        fun eConv f self (width, height) =
          let
            val () =
              f
                (
                  VteTerminalClass.toBase self
                   & width
                   & height
                )
          in
            ()
          end
      in
        val resizeWindowSig =
          {
            name = "resize-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val restoreWindowSig =
          {
            name = "restore-window",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val selectionChangedSig =
          {
            name = "selection-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val statusLineChangedSig =
          {
            name = "status-line-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val textDeletedSig =
          {
            name = "text-deleted",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val textInsertedSig =
          {
            name = "text-inserted",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val textModifiedSig =
          {
            name = "text-modified",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t &&&> parIn 1 int ---> retVoid
        fun hConv f (self & delta) =
          let
            val () = f (GObjectObjectClass.toBase self) delta
          in
            ()
          end
        fun eConv f self delta =
          let
            val () = f (VteTerminalClass.toBase self & delta)
          in
            ()
          end
      in
        val textScrolledSig =
          {
            name = "text-scrolled",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
        fun hConv f self =
          let
            val () = f (GObjectObjectClass.toBase self)
          in
            ()
          end
        fun eConv f self =
          let
            val () = f (VteTerminalClass.toBase self)
          in
            ()
          end
      in
        val windowTitleChangedSig =
          {
            name = "window-title-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  {
                    h = makeCallback marshaller o hConv,
                    e = eConv o call marshaller
                  }
          }
      end
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
      val audibleBellProp =
        {
          name = "audible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val backgroundImageFileProp =
        {
          name = "background-image-file",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
      val backgroundImagePixbufProp =
        {
          name = "background-image-pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn _ => fn v => fn () => C.get GdkPixbufPixbufClass.tOpt v,
          set = fn _ => fn v => fn x => C.set GdkPixbufPixbufClass.tOpt v (Option.map GdkPixbufPixbufClass.toBase x),
          init = fn v => fn x => C.set GdkPixbufPixbufClass.tOpt v (Option.map GdkPixbufPixbufClass.toBase x)
        }
      val backgroundOpacityProp =
        {
          name = "background-opacity",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val backgroundSaturationProp =
        {
          name = "background-saturation",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val backgroundTintColorProp =
        {
          name = "background-tint-color",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn _ => fn v => fn () => C.get GdkColorRecord.tOpt v,
          set = fn _ => fn v => fn x => C.set GdkColorRecord.tOpt v x,
          init = fn v => fn x => C.set GdkColorRecord.tOpt v x
        }
      val backgroundTransparentProp =
        {
          name = "background-transparent",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val backspaceBindingProp =
        {
          name = "backspace-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn _ => fn v => fn () => C.get VteTerminalEraseBinding.t v,
          set = fn _ => fn v => fn x => C.set VteTerminalEraseBinding.t v x,
          init = fn v => fn x => C.set VteTerminalEraseBinding.t v x
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
          gtype = fn () => C.gtype VteTerminalCursorBlinkMode.t (),
          get = fn _ => fn v => fn () => C.get VteTerminalCursorBlinkMode.t v,
          set = fn _ => fn v => fn x => C.set VteTerminalCursorBlinkMode.t v x,
          init = fn v => fn x => C.set VteTerminalCursorBlinkMode.t v x
        }
      val cursorShapeProp =
        {
          name = "cursor-shape",
          gtype = fn () => C.gtype VteTerminalCursorShape.t (),
          get = fn _ => fn v => fn () => C.get VteTerminalCursorShape.t v,
          set = fn _ => fn v => fn x => C.set VteTerminalCursorShape.t v x,
          init = fn v => fn x => C.set VteTerminalCursorShape.t v x
        }
      val deleteBindingProp =
        {
          name = "delete-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn _ => fn v => fn () => C.get VteTerminalEraseBinding.t v,
          set = fn _ => fn v => fn x => C.set VteTerminalEraseBinding.t v x,
          init = fn v => fn x => C.set VteTerminalEraseBinding.t v x
        }
      val emulationProp =
        {
          name = "emulation",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
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
      val iconTitleProp =
        {
          name = "icon-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
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
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val ptyObjectProp =
        {
          name = "pty-object",
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
      val scrollBackgroundProp =
        {
          name = "scroll-background",
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
      val scrollbackLinesProp =
        {
          name = "scrollback-lines",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn v => fn () => C.get uint v,
          set = fn _ => fn v => fn x => C.set uint v x,
          init = fn v => fn x => C.set uint v x
        }
      val visibleBellProp =
        {
          name = "visible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val windowTitleProp =
        {
          name = "window-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => ignore,
          init = ignore
        }
      val wordCharsProp =
        {
          name = "word-chars",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
    end
  end
