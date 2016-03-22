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
      val getType_ = call (load_sym libvte "vte_terminal_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libvte "vte_terminal_new") (FFI.PolyML.cVoid --> VteTerminalClass.PolyML.cPtr)
      val copyClipboard_ = call (load_sym libvte "vte_terminal_copy_clipboard") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copyPrimary_ = call (load_sym libvte "vte_terminal_copy_primary") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val feed_ =
        call (load_sym libvte "vte_terminal_feed")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val feedChild_ =
        call (load_sym libvte "vte_terminal_feed_child")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val feedChildBinary_ =
        call (load_sym libvte "vte_terminal_feed_child_binary")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getAllowBold_ = call (load_sym libvte "vte_terminal_get_allow_bold") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAudibleBell_ = call (load_sym libvte "vte_terminal_get_audible_bell") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCharHeight_ = call (load_sym libvte "vte_terminal_get_char_height") (VteTerminalClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCharWidth_ = call (load_sym libvte "vte_terminal_get_char_width") (VteTerminalClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getChildExitStatus_ = call (load_sym libvte "vte_terminal_get_child_exit_status") (VteTerminalClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getColumnCount_ = call (load_sym libvte "vte_terminal_get_column_count") (VteTerminalClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCursorBlinkMode_ = call (load_sym libvte "vte_terminal_get_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorBlinkMode.PolyML.cVal)
      val getCursorShape_ = call (load_sym libvte "vte_terminal_get_cursor_shape") (VteTerminalClass.PolyML.cPtr --> VteTerminalCursorShape.PolyML.cVal)
      val getDefaultEmulation_ = call (load_sym libvte "vte_terminal_get_default_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmulation_ = call (load_sym libvte "vte_terminal_get_emulation") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEncoding_ = call (load_sym libvte "vte_terminal_get_encoding") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (load_sym libvte "vte_terminal_get_font") (VteTerminalClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHasSelection_ = call (load_sym libvte "vte_terminal_get_has_selection") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIconTitle_ = call (load_sym libvte "vte_terminal_get_icon_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMouseAutohide_ = call (load_sym libvte "vte_terminal_get_mouse_autohide") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPtyObject_ = call (load_sym libvte "vte_terminal_get_pty_object") (VteTerminalClass.PolyML.cPtr --> VtePtyClass.PolyML.cPtr)
      val getRowCount_ = call (load_sym libvte "vte_terminal_get_row_count") (VteTerminalClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getStatusLine_ = call (load_sym libvte "vte_terminal_get_status_line") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleBell_ = call (load_sym libvte "vte_terminal_get_visible_bell") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWindowTitle_ = call (load_sym libvte "vte_terminal_get_window_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val imAppendMenuitems_ = call (load_sym libvte "vte_terminal_im_append_menuitems") (VteTerminalClass.PolyML.cPtr &&> GtkMenuShellClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val isWordChar_ = call (load_sym libvte "vte_terminal_is_word_char") (VteTerminalClass.PolyML.cPtr &&> FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val matchAddGregex_ =
        call (load_sym libvte "vte_terminal_match_add_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val matchCheck_ =
        call (load_sym libvte "vte_terminal_match_check")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Int.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchClearAll_ = call (load_sym libvte "vte_terminal_match_clear_all") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val matchRemove_ = call (load_sym libvte "vte_terminal_match_remove") (VteTerminalClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val matchSetCursor_ =
        call (load_sym libvte "vte_terminal_match_set_cursor")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GdkCursorClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val matchSetCursorName_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_name")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val matchSetCursorType_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_type")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GdkCursorType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val pasteClipboard_ = call (load_sym libvte "vte_terminal_paste_clipboard") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val pastePrimary_ = call (load_sym libvte "vte_terminal_paste_primary") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ptyNew_ =
        call (load_sym libvte "vte_terminal_pty_new")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val reset_ =
        call (load_sym libvte "vte_terminal_reset")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val searchFindNext_ = call (load_sym libvte "vte_terminal_search_find_next") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchFindPrevious_ = call (load_sym libvte "vte_terminal_search_find_previous") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchGetGregex_ = call (load_sym libvte "vte_terminal_search_get_gregex") (VteTerminalClass.PolyML.cPtr --> GLibRegexRecord.PolyML.cPtr)
      val searchGetWrapAround_ = call (load_sym libvte "vte_terminal_search_get_wrap_around") (VteTerminalClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val searchSetGregex_ = call (load_sym libvte "vte_terminal_search_set_gregex") (VteTerminalClass.PolyML.cPtr &&> GLibRegexRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val searchSetWrapAround_ = call (load_sym libvte "vte_terminal_search_set_wrap_around") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectAll_ = call (load_sym libvte "vte_terminal_select_all") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectNone_ = call (load_sym libvte "vte_terminal_select_none") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAllowBold_ = call (load_sym libvte "vte_terminal_set_allow_bold") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setAudibleBell_ = call (load_sym libvte "vte_terminal_set_audible_bell") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackgroundImage_ = call (load_sym libvte "vte_terminal_set_background_image") (VteTerminalClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setBackgroundImageFile_ = call (load_sym libvte "vte_terminal_set_background_image_file") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setBackgroundSaturation_ = call (load_sym libvte "vte_terminal_set_background_saturation") (VteTerminalClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackgroundTintColor_ = call (load_sym libvte "vte_terminal_set_background_tint_color") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBackgroundTransparent_ = call (load_sym libvte "vte_terminal_set_background_transparent") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackspaceBinding_ = call (load_sym libvte "vte_terminal_set_backspace_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColorBackground_ = call (load_sym libvte "vte_terminal_set_color_background") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBackgroundRgba_ = call (load_sym libvte "vte_terminal_set_color_background_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBold_ = call (load_sym libvte "vte_terminal_set_color_bold") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBoldRgba_ = call (load_sym libvte "vte_terminal_set_color_bold_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorCursor_ = call (load_sym libvte "vte_terminal_set_color_cursor") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorCursorRgba_ = call (load_sym libvte "vte_terminal_set_color_cursor_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorDim_ = call (load_sym libvte "vte_terminal_set_color_dim") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorDimRgba_ = call (load_sym libvte "vte_terminal_set_color_dim_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorForeground_ = call (load_sym libvte "vte_terminal_set_color_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorForegroundRgba_ = call (load_sym libvte "vte_terminal_set_color_foreground_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorHighlight_ = call (load_sym libvte "vte_terminal_set_color_highlight") (VteTerminalClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorHighlightRgba_ = call (load_sym libvte "vte_terminal_set_color_highlight_rgba") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setCursorBlinkMode_ = call (load_sym libvte "vte_terminal_set_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorBlinkMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursorShape_ = call (load_sym libvte "vte_terminal_set_cursor_shape") (VteTerminalClass.PolyML.cPtr &&> VteTerminalCursorShape.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultColors_ = call (load_sym libvte "vte_terminal_set_default_colors") (VteTerminalClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDeleteBinding_ = call (load_sym libvte "vte_terminal_set_delete_binding") (VteTerminalClass.PolyML.cPtr &&> VteTerminalEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEmulation_ = call (load_sym libvte "vte_terminal_set_emulation") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setEncoding_ = call (load_sym libvte "vte_terminal_set_encoding") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setFont_ = call (load_sym libvte "vte_terminal_set_font") (VteTerminalClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFontFromString_ = call (load_sym libvte "vte_terminal_set_font_from_string") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setMouseAutohide_ = call (load_sym libvte "vte_terminal_set_mouse_autohide") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOpacity_ = call (load_sym libvte "vte_terminal_set_opacity") (VteTerminalClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPtyObject_ = call (load_sym libvte "vte_terminal_set_pty_object") (VteTerminalClass.PolyML.cPtr &&> VtePtyClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setScrollBackground_ = call (load_sym libvte "vte_terminal_set_scroll_background") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollOnKeystroke_ = call (load_sym libvte "vte_terminal_set_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollOnOutput_ = call (load_sym libvte "vte_terminal_set_scroll_on_output") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScrollbackLines_ = call (load_sym libvte "vte_terminal_set_scrollback_lines") (VteTerminalClass.PolyML.cPtr &&> FFI.Long.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSize_ =
        call (load_sym libvte "vte_terminal_set_size")
          (
            VteTerminalClass.PolyML.cPtr
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Long.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setVisibleBell_ = call (load_sym libvte "vte_terminal_set_visible_bell") (VteTerminalClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWordChars_ = call (load_sym libvte "vte_terminal_set_word_chars") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val watchChild_ = call (load_sym libvte "vte_terminal_watch_child") (VteTerminalClass.PolyML.cPtr &&> GLibPid.PolyML.cVal --> FFI.PolyML.cVoid)
      val writeContents_ =
        call (load_sym libvte "vte_terminal_write_contents")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GioOutputStreamClass.PolyML.cPtr
             &&> VteTerminalWriteFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
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
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.C.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.C.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.C.withPtr ---> I) copyPrimary_ self
    fun feed self data length =
      (
        VteTerminalClass.C.withPtr
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
        VteTerminalClass.C.withPtr
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
        VteTerminalClass.C.withPtr
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
    fun getAllowBold self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharWidth_ self
    fun getChildExitStatus self = (VteTerminalClass.C.withPtr ---> FFI.Int.C.fromVal) getChildExitStatus_ self
    fun getColumnCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getColumnCount_ self
    fun getCursorBlinkMode self = (VteTerminalClass.C.withPtr ---> VteTerminalCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorShape self = (VteTerminalClass.C.withPtr ---> VteTerminalCursorShape.C.fromVal) getCursorShape_ self
    fun getDefaultEmulation self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultEmulation_ self
    fun getEmulation self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getEmulation_ self
    fun getEncoding self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFont self = (VteTerminalClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getHasSelection self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getIconTitle_ self
    fun getMouseAutohide self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPtyObject self = (VteTerminalClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPtyObject_ self
    fun getRowCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getStatusLine self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getStatusLine_ self
    fun getVisibleBell self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibleBell_ self
    fun getWindowTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getWindowTitle_ self
    fun imAppendMenuitems self menushell = (VteTerminalClass.C.withPtr &&&> GtkMenuShellClass.C.withPtr ---> I) imAppendMenuitems_ (self & menushell)
    fun isWordChar self c = (VteTerminalClass.C.withPtr &&&> FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) isWordChar_ (self & c)
    fun matchAddGregex self regex flags =
      (
        VteTerminalClass.C.withPtr
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
            VteTerminalClass.C.withPtr
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
    fun matchClearAll self = (VteTerminalClass.C.withPtr ---> I) matchClearAll_ self
    fun matchRemove self tag = (VteTerminalClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) matchRemove_ (self & tag)
    fun matchSetCursor self tag cursor =
      (
        VteTerminalClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GdkCursorClass.C.withOptPtr
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
        VteTerminalClass.C.withPtr
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
        VteTerminalClass.C.withPtr
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
    fun pasteClipboard self = (VteTerminalClass.C.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (VteTerminalClass.C.withPtr ---> I) pastePrimary_ self
    fun ptyNew self flags =
      (
        VteTerminalClass.C.withPtr
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
        VteTerminalClass.C.withPtr
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
    fun searchFindNext self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindNext_ self
    fun searchFindPrevious self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchFindPrevious_ self
    fun searchGetGregex self = (VteTerminalClass.C.withPtr ---> GLibRegexRecord.C.fromPtr false) searchGetGregex_ self
    fun searchGetWrapAround self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self regex = (VteTerminalClass.C.withPtr &&&> GLibRegexRecord.C.withOptPtr ---> I) searchSetGregex_ (self & regex)
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.C.withPtr ---> I) selectAll_ self
    fun selectNone self = (VteTerminalClass.C.withPtr ---> I) selectNone_ self
    fun setAllowBold self allowBold = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackgroundImage self image = (VteTerminalClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withOptPtr ---> I) setBackgroundImage_ (self & image)
    fun setBackgroundImageFile self path = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setBackgroundImageFile_ (self & path)
    fun setBackgroundSaturation self saturation = (VteTerminalClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setBackgroundSaturation_ (self & saturation)
    fun setBackgroundTintColor self color = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setBackgroundTintColor_ (self & color)
    fun setBackgroundTransparent self transparent = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBackgroundTransparent_ (self & transparent)
    fun setBackspaceBinding self binding = (VteTerminalClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setColorBackground self background = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBackgroundRgba self background = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorBackgroundRgba_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorBold_ (self & bold)
    fun setColorBoldRgba self bold = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorBoldRgba_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorRgba self cursorBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorCursorRgba_ (self & cursorBackground)
    fun setColorDim self dim = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorDim_ (self & dim)
    fun setColorDimRgba self dim = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorDimRgba_ (self & dim)
    fun setColorForeground self foreground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorForegroundRgba self foreground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorForegroundRgba_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.C.withPtr &&&> GdkColorRecord.C.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightRgba self highlightBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlightRgba_ (self & highlightBackground)
    fun setCursorBlinkMode self mode = (VteTerminalClass.C.withPtr &&&> VteTerminalCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.C.withPtr &&&> VteTerminalCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.C.withPtr &&&> VteTerminalEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEmulation self emulation = (VteTerminalClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEmulation_ (self & emulation)
    fun setEncoding self codeset = (VteTerminalClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setEncoding_ (self & codeset)
    fun setFont self fontDesc = (VteTerminalClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontFromString self name = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFontFromString_ (self & name)
    fun setMouseAutohide self setting = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setOpacity self opacity = (VteTerminalClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setOpacity_ (self & opacity)
    fun setPtyObject self pty = (VteTerminalClass.C.withPtr &&&> VtePtyClass.C.withOptPtr ---> I) setPtyObject_ (self & pty)
    fun setScrollBackground self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollBackground_ (self & scroll)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollbackLines self lines = (VteTerminalClass.C.withPtr &&&> FFI.Long.C.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self columns rows =
      (
        VteTerminalClass.C.withPtr
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
    fun setVisibleBell self isVisible = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibleBell_ (self & isVisible)
    fun setWordChars self spec = (VteTerminalClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setWordChars_ (self & spec)
    fun watchChild self childPid = (VteTerminalClass.C.withPtr &&&> GLibPid.C.withVal ---> I) watchChild_ (self & childPid)
    fun writeContents self stream flags cancellable =
      (
        VteTerminalClass.C.withPtr
         &&&> GioOutputStreamClass.C.withPtr
         &&&> VteTerminalWriteFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
