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
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "vte_terminal_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (externalFunctionSymbol "vte_terminal_new") (cVoid --> VteTerminalClass.PolyML.cPtr)
      val copyClipboard_ = call (externalFunctionSymbol "vte_terminal_copy_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val copyClipboardFormat_ = call (externalFunctionSymbol "vte_terminal_copy_clipboard_format") (VteTerminalClass.PolyML.cPtr &&> VteFormat.PolyML.cVal --> cVoid)
      val copyPrimary_ = call (externalFunctionSymbol "vte_terminal_copy_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val eventCheckRegexSimple_ =
        call (externalFunctionSymbol "vte_terminal_event_check_regex_array")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> VteRegexRecordCPtrArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GSize.PolyML.cRef
             --> Utf8CPtrArrayN.PolyML.cOutPtr
          )
      val feed_ =
        call (externalFunctionSymbol "vte_terminal_feed")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> cVoid
          )
      val feedChild_ =
        call (externalFunctionSymbol "vte_terminal_feed_child")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> cVoid
          )
      val feedChildBinary_ =
        call (externalFunctionSymbol "vte_terminal_feed_child_binary")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> cVoid
          )
      val getAllowBold_ = call (externalFunctionSymbol "vte_terminal_get_allow_bold") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAllowHyperlink_ = call (externalFunctionSymbol "vte_terminal_get_allow_hyperlink") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAudibleBell_ = call (externalFunctionSymbol "vte_terminal_get_audible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBoldIsBright_ = call (externalFunctionSymbol "vte_terminal_get_bold_is_bright") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCellHeightScale_ = call (externalFunctionSymbol "vte_terminal_get_cell_height_scale") (VteTerminalClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getCellWidthScale_ = call (externalFunctionSymbol "vte_terminal_get_cell_width_scale") (VteTerminalClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getCharHeight_ = call (externalFunctionSymbol "vte_terminal_get_char_height") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getCharWidth_ = call (externalFunctionSymbol "vte_terminal_get_char_width") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getCjkAmbiguousWidth_ = call (externalFunctionSymbol "vte_terminal_get_cjk_ambiguous_width") (VteTerminalClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getColorBackgroundForDraw_ = call (externalFunctionSymbol "vte_terminal_get_color_background_for_draw") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val getColumnCount_ = call (externalFunctionSymbol "vte_terminal_get_column_count") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getCurrentContainerName_ = call (externalFunctionSymbol "vte_terminal_get_current_container_name") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCurrentContainerRuntime_ = call (externalFunctionSymbol "vte_terminal_get_current_container_runtime") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCurrentDirectoryUri_ = call (externalFunctionSymbol "vte_terminal_get_current_directory_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCurrentFileUri_ = call (externalFunctionSymbol "vte_terminal_get_current_file_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getCursorBlinkMode_ = call (externalFunctionSymbol "vte_terminal_get_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteCursorBlinkMode.PolyML.cVal)
      val getCursorPosition_ =
        call (externalFunctionSymbol "vte_terminal_get_cursor_position")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cRef
             &&> GLong.PolyML.cRef
             --> cVoid
          )
      val getCursorShape_ = call (externalFunctionSymbol "vte_terminal_get_cursor_shape") (VteTerminalClass.PolyML.cPtr --> VteCursorShape.PolyML.cVal)
      val getEnableBidi_ = call (externalFunctionSymbol "vte_terminal_get_enable_bidi") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEnableShaping_ = call (externalFunctionSymbol "vte_terminal_get_enable_shaping") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEnableSixel_ = call (externalFunctionSymbol "vte_terminal_get_enable_sixel") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEncoding_ = call (externalFunctionSymbol "vte_terminal_get_encoding") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getFont_ = call (externalFunctionSymbol "vte_terminal_get_font") (VteTerminalClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontScale_ = call (externalFunctionSymbol "vte_terminal_get_font_scale") (VteTerminalClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getGeometryHints_ =
        call (externalFunctionSymbol "vte_terminal_get_geometry_hints")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val getHasSelection_ = call (externalFunctionSymbol "vte_terminal_get_has_selection") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconTitle_ = call (externalFunctionSymbol "vte_terminal_get_icon_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getInputEnabled_ = call (externalFunctionSymbol "vte_terminal_get_input_enabled") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMouseAutohide_ = call (externalFunctionSymbol "vte_terminal_get_mouse_autohide") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPty_ = call (externalFunctionSymbol "vte_terminal_get_pty") (VteTerminalClass.PolyML.cPtr --> VtePtyClass.PolyML.cPtr)
      val getRewrapOnResize_ = call (externalFunctionSymbol "vte_terminal_get_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowCount_ = call (externalFunctionSymbol "vte_terminal_get_row_count") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getScrollOnKeystroke_ = call (externalFunctionSymbol "vte_terminal_get_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getScrollOnOutput_ = call (externalFunctionSymbol "vte_terminal_get_scroll_on_output") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getScrollbackLines_ = call (externalFunctionSymbol "vte_terminal_get_scrollback_lines") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getTextBlinkMode_ = call (externalFunctionSymbol "vte_terminal_get_text_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteTextBlinkMode.PolyML.cVal)
      val getWindowTitle_ = call (externalFunctionSymbol "vte_terminal_get_window_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getWordCharExceptions_ = call (externalFunctionSymbol "vte_terminal_get_word_char_exceptions") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val hyperlinkCheckEvent_ = call (externalFunctionSymbol "vte_terminal_hyperlink_check_event") (VteTerminalClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val matchAddGregex_ =
        call (externalFunctionSymbol "vte_terminal_match_add_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val matchAddRegex_ =
        call (externalFunctionSymbol "vte_terminal_match_add_regex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VteRegexRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val matchCheck_ =
        call (externalFunctionSymbol "vte_terminal_match_check")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> Utf8.PolyML.cOutOptPtr
          )
      val matchCheckEvent_ =
        call (externalFunctionSymbol "vte_terminal_match_check_event")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GInt.PolyML.cRef
             --> Utf8.PolyML.cOutOptPtr
          )
      val matchRemove_ = call (externalFunctionSymbol "vte_terminal_match_remove") (VteTerminalClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val matchRemoveAll_ = call (externalFunctionSymbol "vte_terminal_match_remove_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val matchSetCursor_ =
        call (externalFunctionSymbol "vte_terminal_match_set_cursor")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GdkCursorClass.PolyML.cOptPtr
             --> cVoid
          )
      val matchSetCursorName_ =
        call (externalFunctionSymbol "vte_terminal_match_set_cursor_name")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val matchSetCursorType_ =
        call (externalFunctionSymbol "vte_terminal_match_set_cursor_type")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GdkCursorType.PolyML.cVal
             --> cVoid
          )
      val pasteClipboard_ = call (externalFunctionSymbol "vte_terminal_paste_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val pastePrimary_ = call (externalFunctionSymbol "vte_terminal_paste_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val ptyNewSync_ =
        call (externalFunctionSymbol "vte_terminal_pty_new_sync")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val reset_ =
        call (externalFunctionSymbol "vte_terminal_reset")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val searchFindNext_ = call (externalFunctionSymbol "vte_terminal_search_find_next") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchFindPrevious_ = call (externalFunctionSymbol "vte_terminal_search_find_previous") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchGetGregex_ = call (externalFunctionSymbol "vte_terminal_search_get_gregex") (VteTerminalClass.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val searchGetRegex_ = call (externalFunctionSymbol "vte_terminal_search_get_regex") (VteTerminalClass.PolyML.cPtr --> VteRegexRecord.PolyML.cPtr)
      val searchGetWrapAround_ = call (externalFunctionSymbol "vte_terminal_search_get_wrap_around") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchSetGregex_ =
        call (externalFunctionSymbol "vte_terminal_search_set_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cOptPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> cVoid
          )
      val searchSetRegex_ =
        call (externalFunctionSymbol "vte_terminal_search_set_regex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VteRegexRecord.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val searchSetWrapAround_ = call (externalFunctionSymbol "vte_terminal_search_set_wrap_around") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val selectAll_ = call (externalFunctionSymbol "vte_terminal_select_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setAllowBold_ = call (externalFunctionSymbol "vte_terminal_set_allow_bold") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAllowHyperlink_ = call (externalFunctionSymbol "vte_terminal_set_allow_hyperlink") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAudibleBell_ = call (externalFunctionSymbol "vte_terminal_set_audible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackspaceBinding_ = call (externalFunctionSymbol "vte_terminal_set_backspace_binding") (VteTerminalClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> cVoid)
      val setBoldIsBright_ = call (externalFunctionSymbol "vte_terminal_set_bold_is_bright") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCellHeightScale_ = call (externalFunctionSymbol "vte_terminal_set_cell_height_scale") (VteTerminalClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setCellWidthScale_ = call (externalFunctionSymbol "vte_terminal_set_cell_width_scale") (VteTerminalClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setCjkAmbiguousWidth_ = call (externalFunctionSymbol "vte_terminal_set_cjk_ambiguous_width") (VteTerminalClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setClearBackground_ = call (externalFunctionSymbol "vte_terminal_set_clear_background") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setColorBackground_ = call (externalFunctionSymbol "vte_terminal_set_color_background") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorBold_ = call (externalFunctionSymbol "vte_terminal_set_color_bold") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursor_ = call (externalFunctionSymbol "vte_terminal_set_color_cursor") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursorForeground_ = call (externalFunctionSymbol "vte_terminal_set_color_cursor_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorForeground_ = call (externalFunctionSymbol "vte_terminal_set_color_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorHighlight_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForeground_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColors_ =
        call (externalFunctionSymbol "vte_terminal_set_colors")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecordCArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> cVoid
          )
      val setCursorBlinkMode_ = call (externalFunctionSymbol "vte_terminal_set_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteCursorBlinkMode.PolyML.cVal --> cVoid)
      val setCursorShape_ = call (externalFunctionSymbol "vte_terminal_set_cursor_shape") (VteTerminalClass.PolyML.cPtr &&> VteCursorShape.PolyML.cVal --> cVoid)
      val setDefaultColors_ = call (externalFunctionSymbol "vte_terminal_set_default_colors") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setDeleteBinding_ = call (externalFunctionSymbol "vte_terminal_set_delete_binding") (VteTerminalClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> cVoid)
      val setEnableBidi_ = call (externalFunctionSymbol "vte_terminal_set_enable_bidi") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEnableShaping_ = call (externalFunctionSymbol "vte_terminal_set_enable_shaping") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEnableSixel_ = call (externalFunctionSymbol "vte_terminal_set_enable_sixel") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEncoding_ =
        call (externalFunctionSymbol "vte_terminal_set_encoding")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setFont_ = call (externalFunctionSymbol "vte_terminal_set_font") (VteTerminalClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val setFontScale_ = call (externalFunctionSymbol "vte_terminal_set_font_scale") (VteTerminalClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setGeometryHintsForWindow_ = call (externalFunctionSymbol "vte_terminal_set_geometry_hints_for_window") (VteTerminalClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
      val setInputEnabled_ = call (externalFunctionSymbol "vte_terminal_set_input_enabled") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMouseAutohide_ = call (externalFunctionSymbol "vte_terminal_set_mouse_autohide") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPty_ = call (externalFunctionSymbol "vte_terminal_set_pty") (VteTerminalClass.PolyML.cPtr &&> VtePtyClass.PolyML.cOptPtr --> cVoid)
      val setRewrapOnResize_ = call (externalFunctionSymbol "vte_terminal_set_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnKeystroke_ = call (externalFunctionSymbol "vte_terminal_set_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnOutput_ = call (externalFunctionSymbol "vte_terminal_set_scroll_on_output") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollSpeed_ = call (externalFunctionSymbol "vte_terminal_set_scroll_speed") (VteTerminalClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setScrollbackLines_ = call (externalFunctionSymbol "vte_terminal_set_scrollback_lines") (VteTerminalClass.PolyML.cPtr &&> GLong.PolyML.cVal --> cVoid)
      val setSize_ =
        call (externalFunctionSymbol "vte_terminal_set_size")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val setTextBlinkMode_ = call (externalFunctionSymbol "vte_terminal_set_text_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteTextBlinkMode.PolyML.cVal --> cVoid)
      val setWordCharExceptions_ = call (externalFunctionSymbol "vte_terminal_set_word_char_exceptions") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val spawnSync_ =
        call (externalFunctionSymbol "vte_terminal_spawn_sync")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibSpawnChildSetupFunc.PolyML.cOptDispatchPtr
             &&> GLibSpawnChildSetupFunc.PolyML.cOptPtr
             &&> GLibPid.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unselectAll_ = call (externalFunctionSymbol "vte_terminal_unselect_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val watchChild_ = call (externalFunctionSymbol "vte_terminal_watch_child") (VteTerminalClass.PolyML.cPtr &&> GLibPid.PolyML.cVal --> cVoid)
      val writeContentsSync_ =
        call (externalFunctionSymbol "vte_terminal_write_contents_sync")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GioOutputStreamClass.PolyML.cPtr
             &&> VteWriteFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
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
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val bellSig =
          {
            name = "bell",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
      in
        val charSizeChangedSig =
          {
            name = "char-size-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & width
                         & height =>
                          () & (width, height),
                      fn
                        self & (width, height) =>
                          VteTerminalClass.toBase self
                           & width
                           & height,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t &&&> parIn 1 int ---> retVoid
      in
        val childExitedSig =
          {
            name = "child-exited",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & status => () & status,
                      fn self & status => VteTerminalClass.toBase self & status,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 string
           &&&> parIn 2 uint
           ---> retVoid
      in
        val commitSig =
          {
            name = "commit",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & text
                         & size =>
                          () & (text, size),
                      fn
                        self & (text, size) =>
                          VteTerminalClass.toBase self
                           & text
                           & size,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val contentsChangedSig =
          {
            name = "contents-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val copyClipboardSig =
          {
            name = "copy-clipboard",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val currentDirectoryUriChangedSig =
          {
            name = "current-directory-uri-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val currentFileUriChangedSig =
          {
            name = "current-file-uri-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val cursorMovedSig =
          {
            name = "cursor-moved",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val decreaseFontSizeSig =
          {
            name = "decrease-font-size",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val deiconifyWindowSig =
          {
            name = "deiconify-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val encodingChangedSig =
          {
            name = "encoding-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val eofSig =
          {
            name = "eof",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 string
           &&&> parIn 2 GdkRectangleRecord.t
           ---> retVoid
      in
        val hyperlinkHoverUriChangedSig =
          {
            name = "hyperlink-hover-uri-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & uri
                         & bbox =>
                          () & (uri, bbox),
                      fn
                        self & (uri, bbox) =>
                          VteTerminalClass.toBase self
                           & uri
                           & bbox,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val iconTitleChangedSig =
          {
            name = "icon-title-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val iconifyWindowSig =
          {
            name = "iconify-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val increaseFontSizeSig =
          {
            name = "increase-font-size",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val lowerWindowSig =
          {
            name = "lower-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val maximizeWindowSig =
          {
            name = "maximize-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
      in
        val moveWindowSig =
          {
            name = "move-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & x
                         & y =>
                          () & (x, y),
                      fn
                        self & (x, y) =>
                          VteTerminalClass.toBase self
                           & x
                           & y,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 string
           &&&> parIn 2 stringOpt
           ---> retVoid
      in
        val notificationReceivedSig =
          {
            name = "notification-received",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & summary
                         & body =>
                          () & (summary, body),
                      fn
                        self & (summary, body) =>
                          VteTerminalClass.toBase self
                           & summary
                           & body,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val pasteClipboardSig =
          {
            name = "paste-clipboard",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val raiseWindowSig =
          {
            name = "raise-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val refreshWindowSig =
          {
            name = "refresh-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst VteTerminalClass.t
           &&&> parIn 1 uint
           &&&> parIn 2 uint
           ---> retVoid
      in
        val resizeWindowSig =
          {
            name = "resize-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & width
                         & height =>
                          () & (width, height),
                      fn
                        self & (width, height) =>
                          VteTerminalClass.toBase self
                           & width
                           & height,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val restoreWindowSig =
          {
            name = "restore-window",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val selectionChangedSig =
          {
            name = "selection-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val shellPrecmdSig =
          {
            name = "shell-precmd",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val shellPreexecSig =
          {
            name = "shell-preexec",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val textDeletedSig =
          {
            name = "text-deleted",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val textInsertedSig =
          {
            name = "text-inserted",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val textModifiedSig =
          {
            name = "text-modified",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t &&&> parIn 1 int ---> retVoid
      in
        val textScrolledSig =
          {
            name = "text-scrolled",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & delta => () & delta,
                      fn self & delta => VteTerminalClass.toBase self & delta,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst VteTerminalClass.t ---> retVoid
      in
        val windowTitleChangedSig =
          {
            name = "window-title-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => VteTerminalClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
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
