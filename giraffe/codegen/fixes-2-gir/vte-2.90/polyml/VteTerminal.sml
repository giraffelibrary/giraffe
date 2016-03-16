structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class_t = 'a VteTerminalClass.t
    where type pty_flags_t = VtePtyFlags.t
    where type terminal_write_flags_t = VteTerminalWriteFlags.t
    where type terminal_cursor_blink_mode_t = VteTerminalCursorBlinkMode.t
    where type terminal_cursor_shape_t = VteTerminalCursorShape.t
    where type terminal_erase_binding_t = VteTerminalEraseBinding.t
    where type 'a pty_class_t = 'a VtePtyClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_terminal_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libvte "vte_terminal_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val copyClipboard_ = call (load_sym libvte "vte_terminal_copy_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copyPrimary_ = call (load_sym libvte "vte_terminal_copy_primary") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val feed_ =
        call (load_sym libvte "vte_terminal_feed")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val feedChild_ =
        call (load_sym libvte "vte_terminal_feed_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val feedChildBinary_ =
        call (load_sym libvte "vte_terminal_feed_child_binary")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val forkCommandFull_ =
        call (load_sym libgiraffevte "giraffe_vte_terminal_fork_command_full")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibPid.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getAllowBold_ = call (load_sym libvte "vte_terminal_get_allow_bold") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAudibleBell_ = call (load_sym libvte "vte_terminal_get_audible_bell") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCharHeight_ = call (load_sym libvte "vte_terminal_get_char_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCharWidth_ = call (load_sym libvte "vte_terminal_get_char_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getChildExitStatus_ = call (load_sym libvte "vte_terminal_get_child_exit_status") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getColumnCount_ = call (load_sym libvte "vte_terminal_get_column_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCursorBlinkMode_ = call (load_sym libvte "vte_terminal_get_cursor_blink_mode") (GObjectObjectClass.PolyML.cPtr --> VteTerminalCursorBlinkMode.PolyML.cVal)
      val getCursorShape_ = call (load_sym libvte "vte_terminal_get_cursor_shape") (GObjectObjectClass.PolyML.cPtr --> VteTerminalCursorShape.PolyML.cVal)
      val getDefaultEmulation_ = call (load_sym libvte "vte_terminal_get_default_emulation") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmulation_ = call (load_sym libvte "vte_terminal_get_emulation") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEncoding_ = call (load_sym libvte "vte_terminal_get_encoding") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (load_sym libvte "vte_terminal_get_font") (GObjectObjectClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHasSelection_ = call (load_sym libvte "vte_terminal_get_has_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIconTitle_ = call (load_sym libvte "vte_terminal_get_icon_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMouseAutohide_ = call (load_sym libvte "vte_terminal_get_mouse_autohide") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPtyObject_ = call (load_sym libvte "vte_terminal_get_pty_object") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getRowCount_ = call (load_sym libvte "vte_terminal_get_row_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getStatusLine_ = call (load_sym libvte "vte_terminal_get_status_line") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleBell_ = call (load_sym libvte "vte_terminal_get_visible_bell") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWindowTitle_ = call (load_sym libvte "vte_terminal_get_window_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val imAppendMenuitems_ = call (load_sym libvte "vte_terminal_im_append_menuitems") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val isWordChar_ = call (load_sym libvte "vte_terminal_is_word_char") (GObjectObjectClass.PolyML.cPtr &&> FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val matchAddGregex_ =
        call (load_sym libvte "vte_terminal_match_add_gregex")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val matchCheck_ =
        call (load_sym libvte "vte_terminal_match_check")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchClearAll_ = call (load_sym libvte "vte_terminal_match_clear_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val matchRemove_ = call (load_sym libvte "vte_terminal_match_remove") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val matchSetCursor_ =
        call (load_sym libvte "vte_terminal_match_set_cursor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val matchSetCursorName_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val matchSetCursorType_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GdkCursorType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val pasteClipboard_ = call (load_sym libvte "vte_terminal_paste_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val pastePrimary_ = call (load_sym libvte "vte_terminal_paste_primary") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ptyNew_ =
        call (load_sym libvte "vte_terminal_pty_new")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val reset_ =
        call (load_sym libvte "vte_terminal_reset")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val searchFindNext_ = call (load_sym libvte "vte_terminal_search_find_next") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchFindPrevious_ = call (load_sym libvte "vte_terminal_search_find_previous") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchGetGregex_ = call (load_sym libvte "vte_terminal_search_get_gregex") (GObjectObjectClass.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val searchGetWrapAround_ = call (load_sym libvte "vte_terminal_search_get_wrap_around") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchSetGregex_ = call (load_sym libvte "vte_terminal_search_set_gregex") (GObjectObjectClass.PolyML.cPtr &&> GLibRegexRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val searchSetWrapAround_ = call (load_sym libvte "vte_terminal_search_set_wrap_around") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectAll_ = call (load_sym libvte "vte_terminal_select_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectNone_ = call (load_sym libvte "vte_terminal_select_none") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAllowBold_ = call (load_sym libvte "vte_terminal_set_allow_bold") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setAudibleBell_ = call (load_sym libvte "vte_terminal_set_audible_bell") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackgroundImage_ = call (load_sym libvte "vte_terminal_set_background_image") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setBackgroundImageFile_ = call (load_sym libvte "vte_terminal_set_background_image_file") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setBackgroundSaturation_ = call (load_sym libvte "vte_terminal_set_background_saturation") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackgroundTintColor_ = call (load_sym libvte "vte_terminal_set_background_tint_color") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBackgroundTransparent_ = call (load_sym libvte "vte_terminal_set_background_transparent") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackspaceBinding_ = call (load_sym libvte "vte_terminal_set_backspace_binding") (GObjectObjectClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColorBackground_ = call (load_sym libvte "vte_terminal_set_color_background") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBackgroundRgba_ = call (load_sym libvte "vte_terminal_set_color_background_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBold_ = call (load_sym libvte "vte_terminal_set_color_bold") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBoldRgba_ = call (load_sym libvte "vte_terminal_set_color_bold_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorCursor_ = call (load_sym libvte "vte_terminal_set_color_cursor") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorCursorRgba_ = call (load_sym libvte "vte_terminal_set_color_cursor_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorDim_ = call (load_sym libvte "vte_terminal_set_color_dim") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorDimRgba_ = call (load_sym libvte "vte_terminal_set_color_dim_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorForeground_ = call (load_sym libvte "vte_terminal_set_color_foreground") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorForegroundRgba_ = call (load_sym libvte "vte_terminal_set_color_foreground_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorHighlight_ = call (load_sym libvte "vte_terminal_set_color_highlight") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorHighlightRgba_ = call (load_sym libvte "vte_terminal_set_color_highlight_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColors_ =
        call (load_sym libgiraffevte "giraffe_vte_terminal_set_colors")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setCursorBlinkMode_ = call (load_sym libvte "vte_terminal_set_cursor_blink_mode") (GObjectObjectClass.PolyML.cPtr &&> VteTerminalCursorBlinkMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursorShape_ = call (load_sym libvte "vte_terminal_set_cursor_shape") (GObjectObjectClass.PolyML.cPtr &&> VteTerminalCursorShape.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultColors_ = call (load_sym libvte "vte_terminal_set_default_colors") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDeleteBinding_ = call (load_sym libvte "vte_terminal_set_delete_binding") (GObjectObjectClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEmulation_ = call (load_sym libvte "vte_terminal_set_emulation") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setEncoding_ = call (load_sym libvte "vte_terminal_set_encoding") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setFont_ = call (load_sym libvte "vte_terminal_set_font") (GObjectObjectClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFontFromString_ = call (load_sym libvte "vte_terminal_set_font_from_string") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMouseAutohide_ = call (load_sym libvte "vte_terminal_set_mouse_autohide") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpacity_ = call (load_sym libvte "vte_terminal_set_opacity") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPtyObject_ = call (load_sym libvte "vte_terminal_set_pty_object") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setScrollBackground_ = call (load_sym libvte "vte_terminal_set_scroll_background") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollOnKeystroke_ = call (load_sym libvte "vte_terminal_set_scroll_on_keystroke") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollOnOutput_ = call (load_sym libvte "vte_terminal_set_scroll_on_output") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollbackLines_ = call (load_sym libvte "vte_terminal_set_scrollback_lines") (GObjectObjectClass.PolyML.cPtr &&> FFI.Long.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSize_ =
        call (load_sym libvte "vte_terminal_set_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setVisibleBell_ = call (load_sym libvte "vte_terminal_set_visible_bell") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWordChars_ = call (load_sym libvte "vte_terminal_set_word_chars") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val watchChild_ = call (load_sym libvte "vte_terminal_watch_child") (GObjectObjectClass.PolyML.cPtr &&> GLibPid.PolyML.cVal --> FFI.PolyML.cVoid)
      val writeContents_ =
        call (load_sym libvte "vte_terminal_write_contents")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> VteTerminalWriteFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a VteTerminalClass.t
    type pty_flags_t = VtePtyFlags.t
    type terminal_write_flags_t = VteTerminalWriteFlags.t
    type terminal_cursor_blink_mode_t = VteTerminalCursorBlinkMode.t
    type terminal_cursor_shape_t = VteTerminalCursorShape.t
    type terminal_erase_binding_t = VteTerminalEraseBinding.t
    type 'a pty_class_t = 'a VtePtyClass.t
    type t = base class_t
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun getAllowBold self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowBold_ self
    fun getAudibleBell self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAudibleBell_ self
    fun getCharHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getCharHeight_ self
    fun getCharWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getColumnCount_ self
    fun getCursorBlinkMode self = (GObjectObjectClass.C.withPtr ---> VteTerminalCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorShape self = (GObjectObjectClass.C.withPtr ---> VteTerminalCursorShape.C.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultEmulation_ self
    fun getEmulation self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getEmulation_ self
    fun getEncoding self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFont self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getHasSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getIconTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconTitle_ self
    fun getMouseAutohide self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (GObjectObjectClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPtyObject_ self
    fun getRowCount self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getStatusLine self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getStatusLine_ self
    fun getVisibleBell self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getWindowTitle_ self
    fun imAppendMenuitems self menushell = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) imAppendMenuitems_ (self & menushell)
    fun isWordChar self c = (GObjectObjectClass.C.withPtr &&&> FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self regex flags =
      (
        GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun matchClearAll self = (GObjectObjectClass.C.withPtr ---> I) matchClearAll_ self
    fun matchRemove self tag = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self tag cursor =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
        GObjectObjectClass.C.withPtr
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
    fun pasteClipboard self = (GObjectObjectClass.C.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (GObjectObjectClass.C.withPtr ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun searchFindNext self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (GObjectObjectClass.C.withPtr ---> GLibRegexRecord.C.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (GObjectObjectClass.C.withPtr &&&> GLibRegexRecord.C.withOptPtr ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun selectNone self = (GObjectObjectClass.C.withPtr ---> I) selectNone_ self
    fun setAllowBold self allowBold = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackgroundImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setBackgroundImage_ (self & image)
    fun setBackgroundImageFile self path = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setBackgroundImageFile_ (self & path)
    fun setBackgroundSaturation self saturation = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setBackgroundSaturation_ (self & saturation)
    fun setBackgroundTintColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundTintColor_ (self & color)
    fun setBackgroundTransparent self transparent = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBackgroundTransparent_ (self & transparent)
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
    fun setCursorBlinkMode self mode = (GObjectObjectClass.C.withPtr &&&> VteTerminalCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (GObjectObjectClass.C.withPtr &&&> VteTerminalCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (GObjectObjectClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (GObjectObjectClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setOpacity self opacity = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPtyObject self pty = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setPtyObject_ (self & pty)
    fun setScrollBackground self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollBackground_ (self & scroll)
    fun setScrollOnKeystroke self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (GObjectObjectClass.C.withPtr &&&> FFI.Long.C.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self columns rows =
      (
        GObjectObjectClass.C.withPtr
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
    fun setVisibleBell self isVisible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (GObjectObjectClass.C.withPtr &&&> GLibPid.C.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents self stream flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> VteTerminalWriteFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
