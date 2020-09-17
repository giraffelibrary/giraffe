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
      val getType_ = call (getSymbol "vte_terminal_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "vte_terminal_new") (cVoid --> VteTerminalClass.PolyML.cPtr)
      val copyClipboard_ = call (getSymbol "vte_terminal_copy_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val copyPrimary_ = call (getSymbol "vte_terminal_copy_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val feed_ =
        call (getSymbol "vte_terminal_feed")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val feedChild_ =
        call (getSymbol "vte_terminal_feed_child")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val feedChildBinary_ =
        call (getSymbol "vte_terminal_feed_child_binary")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val getAllowBold_ = call (getSymbol "vte_terminal_get_allow_bold") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAudibleBell_ = call (getSymbol "vte_terminal_get_audible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCharHeight_ = call (getSymbol "vte_terminal_get_char_height") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getCharWidth_ = call (getSymbol "vte_terminal_get_char_width") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getChildExitStatus_ = call (getSymbol "vte_terminal_get_child_exit_status") (VteTerminalClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getColumnCount_ = call (getSymbol "vte_terminal_get_column_count") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getCurrentDirectoryUri_ = call (getSymbol "vte_terminal_get_current_directory_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCurrentFileUri_ = call (getSymbol "vte_terminal_get_current_file_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCursorBlinkMode_ = call (getSymbol "vte_terminal_get_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorBlinkMode.PolyML.cVal)
      val getCursorPosition_ =
        call (getSymbol "vte_terminal_get_cursor_position")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt64.PolyML.cRef
             &&> GInt64.PolyML.cRef
             --> cVoid
          )
      val getCursorShape_ = call (getSymbol "vte_terminal_get_cursor_shape") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorShape.PolyML.cVal)
      val getDefaultEmulation_ = call (getSymbol "vte_terminal_get_default_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmulation_ = call (getSymbol "vte_terminal_get_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEncoding_ = call (getSymbol "vte_terminal_get_encoding") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (getSymbol "vte_terminal_get_font") (VteTerminalClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHasSelection_ = call (getSymbol "vte_terminal_get_has_selection") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconTitle_ = call (getSymbol "vte_terminal_get_icon_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMouseAutohide_ = call (getSymbol "vte_terminal_get_mouse_autohide") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPtyObject_ = call (getSymbol "vte_terminal_get_pty_object") (VteTerminalClass.PolyML.cPtr --> VtePtyClass.PolyML.cPtr)
      val getRewrapOnResize_ = call (getSymbol "vte_terminal_get_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowCount_ = call (getSymbol "vte_terminal_get_row_count") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getStatusLine_ = call (getSymbol "vte_terminal_get_status_line") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleBell_ = call (getSymbol "vte_terminal_get_visible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWindowTitle_ = call (getSymbol "vte_terminal_get_window_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isWordChar_ = call (getSymbol "vte_terminal_is_word_char") (VteTerminalClass.PolyML.cPtr &&> GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val matchAddGregex_ =
        call (getSymbol "vte_terminal_match_add_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val matchCheck_ =
        call (getSymbol "vte_terminal_match_check")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GInt64.PolyML.cVal
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchClearAll_ = call (getSymbol "vte_terminal_match_clear_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val matchRemove_ = call (getSymbol "vte_terminal_match_remove") (VteTerminalClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val matchSetCursor_ =
        call (getSymbol "vte_terminal_match_set_cursor")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GdkCursorClass.PolyML.cOptPtr
             --> cVoid
          )
      val matchSetCursorName_ =
        call (getSymbol "vte_terminal_match_set_cursor_name")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val matchSetCursorType_ =
        call (getSymbol "vte_terminal_match_set_cursor_type")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GdkCursorType.PolyML.cVal
             --> cVoid
          )
      val pasteClipboard_ = call (getSymbol "vte_terminal_paste_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val pastePrimary_ = call (getSymbol "vte_terminal_paste_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val ptyNew_ =
        call (getSymbol "vte_terminal_pty_new")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val reset_ =
        call (getSymbol "vte_terminal_reset")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val searchFindNext_ = call (getSymbol "vte_terminal_search_find_next") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchFindPrevious_ = call (getSymbol "vte_terminal_search_find_previous") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchGetGregex_ = call (getSymbol "vte_terminal_search_get_gregex") (VteTerminalClass.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val searchGetWrapAround_ = call (getSymbol "vte_terminal_search_get_wrap_around") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchSetGregex_ = call (getSymbol "vte_terminal_search_set_gregex") (VteTerminalClass.PolyML.cPtr &&> GLibRegexRecord.PolyML.cOptPtr --> cVoid)
      val searchSetWrapAround_ = call (getSymbol "vte_terminal_search_set_wrap_around") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val selectAll_ = call (getSymbol "vte_terminal_select_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val selectNone_ = call (getSymbol "vte_terminal_select_none") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setAllowBold_ = call (getSymbol "vte_terminal_set_allow_bold") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAudibleBell_ = call (getSymbol "vte_terminal_set_audible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackspaceBinding_ = call (getSymbol "vte_terminal_set_backspace_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> cVoid)
      val setColorBackground_ = call (getSymbol "vte_terminal_set_color_background") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorBackgroundRgba_ = call (getSymbol "vte_terminal_set_color_background_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorBold_ = call (getSymbol "vte_terminal_set_color_bold") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorBoldRgba_ = call (getSymbol "vte_terminal_set_color_bold_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursor_ = call (getSymbol "vte_terminal_set_color_cursor") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursorRgba_ = call (getSymbol "vte_terminal_set_color_cursor_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorDim_ = call (getSymbol "vte_terminal_set_color_dim") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorDimRgba_ = call (getSymbol "vte_terminal_set_color_dim_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorForeground_ = call (getSymbol "vte_terminal_set_color_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setColorForegroundRgba_ = call (getSymbol "vte_terminal_set_color_foreground_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorHighlight_ = call (getSymbol "vte_terminal_set_color_highlight") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForeground_ = call (getSymbol "vte_terminal_set_color_highlight_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForegroundRgba_ = call (getSymbol "vte_terminal_set_color_highlight_foreground_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightRgba_ = call (getSymbol "vte_terminal_set_color_highlight_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColors_ =
        call (getSymbol "vte_terminal_set_colors")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecordCArrayN.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val setColorsRgba_ =
        call (getSymbol "vte_terminal_set_colors_rgba")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecordCArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setCursorBlinkMode_ = call (getSymbol "vte_terminal_set_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorBlinkMode.PolyML.cVal --> cVoid)
      val setCursorShape_ = call (getSymbol "vte_terminal_set_cursor_shape") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorShape.PolyML.cVal --> cVoid)
      val setDefaultColors_ = call (getSymbol "vte_terminal_set_default_colors") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setDeleteBinding_ = call (getSymbol "vte_terminal_set_delete_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> cVoid)
      val setEmulation_ = call (getSymbol "vte_terminal_set_emulation") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setEncoding_ = call (getSymbol "vte_terminal_set_encoding") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setFont_ = call (getSymbol "vte_terminal_set_font") (VteTerminalClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val setFontFromString_ = call (getSymbol "vte_terminal_set_font_from_string") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMouseAutohide_ = call (getSymbol "vte_terminal_set_mouse_autohide") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPtyObject_ = call (getSymbol "vte_terminal_set_pty_object") (VteTerminalClass.PolyML.cPtr &&> VtePtyClass.PolyML.cOptPtr --> cVoid)
      val setRewrapOnResize_ = call (getSymbol "vte_terminal_set_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnKeystroke_ = call (getSymbol "vte_terminal_set_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnOutput_ = call (getSymbol "vte_terminal_set_scroll_on_output") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollbackLines_ = call (getSymbol "vte_terminal_set_scrollback_lines") (VteTerminalClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setSize_ =
        call (getSymbol "vte_terminal_set_size")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val setVisibleBell_ = call (getSymbol "vte_terminal_set_visible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWordChars_ = call (getSymbol "vte_terminal_set_word_chars") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val watchChild_ = call (getSymbol "vte_terminal_watch_child") (VteTerminalClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val writeContents_ =
        call (getSymbol "vte_terminal_write_contents")
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
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
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
         &&&> GInt64.FFI.withVal
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
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (VteTerminalClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentDirectoryUri_ self before VteTerminalClass.FFI.touchPtr self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentFileUri_ self before VteTerminalClass.FFI.touchPtr self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
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
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr false ---> VteTerminalCursorShape.FFI.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDefaultEmulation_ self before VteTerminalClass.FFI.touchPtr self
    fun getEmulation self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEmulation_ self before VteTerminalClass.FFI.touchPtr self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEncoding_ self before VteTerminalClass.FFI.touchPtr self
    fun getFont self = (VteTerminalClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self before VteTerminalClass.FFI.touchPtr self
    fun getHasSelection self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getIconTitle_ self before VteTerminalClass.FFI.touchPtr self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (VteTerminalClass.FFI.withPtr false ---> VtePtyClass.FFI.fromPtr false) getPtyObject_ self before VteTerminalClass.FFI.touchPtr self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr false ---> GInt64.FFI.fromVal) getRowCount_ self
    fun getStatusLine self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStatusLine_ self before VteTerminalClass.FFI.touchPtr self
    fun getVisibleBell self = (VteTerminalClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getWindowTitle_ self before VteTerminalClass.FFI.touchPtr self
    fun isWordChar self c = (VteTerminalClass.FFI.withPtr false &&&> GChar.FFI.withVal ---> GBool.FFI.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self (regex, flags) =
      (
        VteTerminalClass.FFI.withPtr false
         &&&> GLibRegexRecord.FFI.withPtr false
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GInt32.FFI.fromVal
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
    fun matchClearAll self = (VteTerminalClass.FFI.withPtr false ---> I) matchClearAll_ self
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) matchRemove_ (self & tag)
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
    fun searchGetGregex self = (VteTerminalClass.FFI.withPtr false ---> GLibRegexRecord.FFI.fromPtr false) searchGetGregex_ self before VteTerminalClass.FFI.touchPtr self
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
             &&&> GInt64.FFI.withVal
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
        val paletteSize = LargeInt.fromInt (GdkRgbaRecordCArrayN.length palette)
        val () =
          (
            VteTerminalClass.FFI.withPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecordCArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
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
    fun setVisibleBell self isVisible = (VteTerminalClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (VteTerminalClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) watchChild_ (self & childPid)
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
