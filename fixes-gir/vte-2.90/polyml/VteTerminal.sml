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
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "vte_terminal_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (externalFunctionSymbol "vte_terminal_new") (cVoid --> VteTerminalClass.PolyML.cPtr)
      val copyClipboard_ = call (externalFunctionSymbol "vte_terminal_copy_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val copyPrimary_ = call (externalFunctionSymbol "vte_terminal_copy_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val feed_ =
        call (externalFunctionSymbol "vte_terminal_feed")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val feedChild_ =
        call (externalFunctionSymbol "vte_terminal_feed_child")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val feedChildBinary_ =
        call (externalFunctionSymbol "vte_terminal_feed_child_binary")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val forkCommandFull_ =
        call (externalFunctionSymbol "vte_terminal_fork_command_full")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibSpawnChildSetupFunc.PolyML.cOptDispatchPtr
             &&> GLibSpawnChildSetupFunc.PolyML.cOptPtr
             &&> GLibPid.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getAllowBold_ = call (externalFunctionSymbol "vte_terminal_get_allow_bold") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAudibleBell_ = call (externalFunctionSymbol "vte_terminal_get_audible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCharHeight_ = call (externalFunctionSymbol "vte_terminal_get_char_height") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getCharWidth_ = call (externalFunctionSymbol "vte_terminal_get_char_width") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getChildExitStatus_ = call (externalFunctionSymbol "vte_terminal_get_child_exit_status") (VteTerminalClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getColumnCount_ = call (externalFunctionSymbol "vte_terminal_get_column_count") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getCurrentDirectoryUri_ = call (externalFunctionSymbol "vte_terminal_get_current_directory_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCurrentFileUri_ = call (externalFunctionSymbol "vte_terminal_get_current_file_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCursorBlinkMode_ = call (externalFunctionSymbol "vte_terminal_get_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorBlinkMode.PolyML.cVal)
      val getCursorPosition_ =
        call (externalFunctionSymbol "vte_terminal_get_cursor_position")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cRef
             &&> GLong.PolyML.cRef
             --> cVoid
          )
      val getCursorShape_ = call (externalFunctionSymbol "vte_terminal_get_cursor_shape") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorShape.PolyML.cVal)
      val getDefaultEmulation_ = call (externalFunctionSymbol "vte_terminal_get_default_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmulation_ = call (externalFunctionSymbol "vte_terminal_get_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEncoding_ = call (externalFunctionSymbol "vte_terminal_get_encoding") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (externalFunctionSymbol "vte_terminal_get_font") (VteTerminalClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHasSelection_ = call (externalFunctionSymbol "vte_terminal_get_has_selection") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconTitle_ = call (externalFunctionSymbol "vte_terminal_get_icon_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMouseAutohide_ = call (externalFunctionSymbol "vte_terminal_get_mouse_autohide") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPtyObject_ = call (externalFunctionSymbol "vte_terminal_get_pty_object") (VteTerminalClass.PolyML.cPtr --> VtePtyClass.PolyML.cPtr)
      val getRewrapOnResize_ = call (externalFunctionSymbol "vte_terminal_get_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowCount_ = call (externalFunctionSymbol "vte_terminal_get_row_count") (VteTerminalClass.PolyML.cPtr --> GLong.PolyML.cVal)
      val getStatusLine_ = call (externalFunctionSymbol "vte_terminal_get_status_line") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleBell_ = call (externalFunctionSymbol "vte_terminal_get_visible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWindowTitle_ = call (externalFunctionSymbol "vte_terminal_get_window_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isWordChar_ = call (externalFunctionSymbol "vte_terminal_is_word_char") (VteTerminalClass.PolyML.cPtr &&> GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val matchAddGregex_ =
        call (externalFunctionSymbol "vte_terminal_match_add_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val matchCheck_ =
        call (externalFunctionSymbol "vte_terminal_match_check")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchClearAll_ = call (externalFunctionSymbol "vte_terminal_match_clear_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val matchRemove_ = call (externalFunctionSymbol "vte_terminal_match_remove") (VteTerminalClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
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
      val ptyNew_ =
        call (externalFunctionSymbol "vte_terminal_pty_new")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
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
      val searchGetWrapAround_ = call (externalFunctionSymbol "vte_terminal_search_get_wrap_around") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchSetGregex_ = call (externalFunctionSymbol "vte_terminal_search_set_gregex") (VteTerminalClass.PolyML.cPtr &&> GLibRegexRecord.PolyML.cOptPtr --> cVoid)
      val searchSetWrapAround_ = call (externalFunctionSymbol "vte_terminal_search_set_wrap_around") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val selectAll_ = call (externalFunctionSymbol "vte_terminal_select_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val selectNone_ = call (externalFunctionSymbol "vte_terminal_select_none") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setAllowBold_ = call (externalFunctionSymbol "vte_terminal_set_allow_bold") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAudibleBell_ = call (externalFunctionSymbol "vte_terminal_set_audible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackspaceBinding_ = call (externalFunctionSymbol "vte_terminal_set_backspace_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> cVoid)
      val setColorBackground_ = call (externalFunctionSymbol "vte_terminal_set_color_background") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorBackgroundRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_background_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorBold_ = call (externalFunctionSymbol "vte_terminal_set_color_bold") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorBoldRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_bold_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursor_ = call (externalFunctionSymbol "vte_terminal_set_color_cursor") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursorRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_cursor_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorDim_ = call (externalFunctionSymbol "vte_terminal_set_color_dim") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorDimRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_dim_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorForeground_ = call (externalFunctionSymbol "vte_terminal_set_color_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorForegroundRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_foreground_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorHighlight_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForeground_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForegroundRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight_foreground_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightRgba_ = call (externalFunctionSymbol "vte_terminal_set_color_highlight_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColors_ =
        call (externalFunctionSymbol "vte_terminal_set_colors")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecordCArrayN.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val setColorsRgba_ =
        call (externalFunctionSymbol "vte_terminal_set_colors_rgba")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecordCArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> cVoid
          )
      val setCursorBlinkMode_ = call (externalFunctionSymbol "vte_terminal_set_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorBlinkMode.PolyML.cVal --> cVoid)
      val setCursorShape_ = call (externalFunctionSymbol "vte_terminal_set_cursor_shape") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorShape.PolyML.cVal --> cVoid)
      val setDefaultColors_ = call (externalFunctionSymbol "vte_terminal_set_default_colors") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setDeleteBinding_ = call (externalFunctionSymbol "vte_terminal_set_delete_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> cVoid)
      val setEmulation_ = call (externalFunctionSymbol "vte_terminal_set_emulation") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setEncoding_ = call (externalFunctionSymbol "vte_terminal_set_encoding") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setFont_ = call (externalFunctionSymbol "vte_terminal_set_font") (VteTerminalClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val setFontFromString_ = call (externalFunctionSymbol "vte_terminal_set_font_from_string") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMouseAutohide_ = call (externalFunctionSymbol "vte_terminal_set_mouse_autohide") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPtyObject_ = call (externalFunctionSymbol "vte_terminal_set_pty_object") (VteTerminalClass.PolyML.cPtr &&> VtePtyClass.PolyML.cOptPtr --> cVoid)
      val setRewrapOnResize_ = call (externalFunctionSymbol "vte_terminal_set_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnKeystroke_ = call (externalFunctionSymbol "vte_terminal_set_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnOutput_ = call (externalFunctionSymbol "vte_terminal_set_scroll_on_output") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollbackLines_ = call (externalFunctionSymbol "vte_terminal_set_scrollback_lines") (VteTerminalClass.PolyML.cPtr &&> GLong.PolyML.cVal --> cVoid)
      val setSize_ =
        call (externalFunctionSymbol "vte_terminal_set_size")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             --> cVoid
          )
      val setVisibleBell_ = call (externalFunctionSymbol "vte_terminal_set_visible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWordChars_ = call (externalFunctionSymbol "vte_terminal_set_word_chars") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val watchChild_ = call (externalFunctionSymbol "vte_terminal_watch_child") (VteTerminalClass.PolyML.cPtr &&> GLibPid.PolyML.cVal --> cVoid)
      val writeContents_ =
        call (externalFunctionSymbol "vte_terminal_write_contents")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GioOutputStreamClass.PolyML.cPtr
             &&> VteTerminalWriteFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a VteTerminalClass.class
    type pty_flags_t = VtePtyFlags.t
    type terminal_write_flags_t = VteTerminalWriteFlags.t
    type terminal_cursor_blink_mode_t = VteTerminalCursorBlinkMode.t
    type terminal_cursor_shape_t = VteTerminalCursorShape.t
    type terminal_erase_binding_t = VteTerminalEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
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
      val backgroundImageFileProp =
        {
          name = "background-image-file",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val backgroundImagePixbufProp =
        {
          name = "background-image-pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn _ => fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn _ => fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val backgroundOpacityProp =
        {
          name = "background-opacity",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val backgroundSaturationProp =
        {
          name = "background-saturation",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val backgroundTintColorProp =
        {
          name = "background-tint-color",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn _ => fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn _ => fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val backgroundTransparentProp =
        {
          name = "background-transparent",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backspaceBindingProp =
        {
          name = "backspace-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn _ => fn x => fn () => C.get VteTerminalEraseBinding.t x,
          set = fn _ => fn x => C.set VteTerminalEraseBinding.t x,
          init = fn x => C.set VteTerminalEraseBinding.t x
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
          gtype = fn () => C.gtype VteTerminalCursorBlinkMode.t (),
          get = fn _ => fn x => fn () => C.get VteTerminalCursorBlinkMode.t x,
          set = fn _ => fn x => C.set VteTerminalCursorBlinkMode.t x,
          init = fn x => C.set VteTerminalCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          name = "cursor-shape",
          gtype = fn () => C.gtype VteTerminalCursorShape.t (),
          get = fn _ => fn x => fn () => C.get VteTerminalCursorShape.t x,
          set = fn _ => fn x => C.set VteTerminalCursorShape.t x,
          init = fn x => C.set VteTerminalCursorShape.t x
        }
      val deleteBindingProp =
        {
          name = "delete-binding",
          gtype = fn () => C.gtype VteTerminalEraseBinding.t (),
          get = fn _ => fn x => fn () => C.get VteTerminalEraseBinding.t x,
          set = fn _ => fn x => C.set VteTerminalEraseBinding.t x,
          init = fn x => C.set VteTerminalEraseBinding.t x
        }
      val emulationProp =
        {
          name = "emulation",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
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
      val iconTitleProp =
        {
          name = "icon-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
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
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val ptyObjectProp =
        {
          name = "pty-object",
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
      val scrollBackgroundProp =
        {
          name = "scroll-background",
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
      val scrollbackLinesProp =
        {
          name = "scrollback-lines",
          gtype = fn () => C.gtype uint (),
          get = fn _ => fn x => fn () => C.get uint x,
          set = fn _ => fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val visibleBellProp =
        {
          name = "visible-bell",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val windowTitleProp =
        {
          name = "window-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => ignore,
          init = ignore
        }
      val wordCharsProp =
        {
          name = "word-chars",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
