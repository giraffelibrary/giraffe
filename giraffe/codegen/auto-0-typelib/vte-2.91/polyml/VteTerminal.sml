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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_terminal_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "vte_terminal_new") (cVoid --> VteTerminalClass.PolyML.cPtr)
      val copyClipboard_ = call (getSymbol "vte_terminal_copy_clipboard") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val copyPrimary_ = call (getSymbol "vte_terminal_copy_primary") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val eventCheckGregexSimple_ =
        call (getSymbol "vte_terminal_event_check_gregex_simple")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GLibRegexRecordCPtrArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibRegexMatchFlags.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val eventCheckRegexSimple_ =
        call (getSymbol "vte_terminal_event_check_regex_simple")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> VteRegexRecordCPtrArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GUInt32.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val feed_ =
        call (getSymbol "vte_terminal_feed")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInOptPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val feedChild_ =
        call (getSymbol "vte_terminal_feed_child")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val feedChildBinary_ =
        call (getSymbol "vte_terminal_feed_child_binary")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val getAllowBold_ = call (getSymbol "vte_terminal_get_allow_bold") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAudibleBell_ = call (getSymbol "vte_terminal_get_audible_bell") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCharHeight_ = call (getSymbol "vte_terminal_get_char_height") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getCharWidth_ = call (getSymbol "vte_terminal_get_char_width") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getCjkAmbiguousWidth_ = call (getSymbol "vte_terminal_get_cjk_ambiguous_width") (VteTerminalClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getColumnCount_ = call (getSymbol "vte_terminal_get_column_count") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getCurrentDirectoryUri_ = call (getSymbol "vte_terminal_get_current_directory_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCurrentFileUri_ = call (getSymbol "vte_terminal_get_current_file_uri") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCursorBlinkMode_ = call (getSymbol "vte_terminal_get_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr --> VteCursorBlinkMode.PolyML.cVal)
      val getCursorPosition_ =
        call (getSymbol "vte_terminal_get_cursor_position")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt64.PolyML.cRef
             &&> GInt64.PolyML.cRef
             --> cVoid
          )
      val getCursorShape_ = call (getSymbol "vte_terminal_get_cursor_shape") (VteTerminalClass.PolyML.cPtr --> VteCursorShape.PolyML.cVal)
      val getEncoding_ = call (getSymbol "vte_terminal_get_encoding") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (getSymbol "vte_terminal_get_font") (VteTerminalClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontScale_ = call (getSymbol "vte_terminal_get_font_scale") (VteTerminalClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getGeometryHints_ =
        call (getSymbol "vte_terminal_get_geometry_hints")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val getHasSelection_ = call (getSymbol "vte_terminal_get_has_selection") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconTitle_ = call (getSymbol "vte_terminal_get_icon_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getInputEnabled_ = call (getSymbol "vte_terminal_get_input_enabled") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMouseAutohide_ = call (getSymbol "vte_terminal_get_mouse_autohide") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPty_ = call (getSymbol "vte_terminal_get_pty") (VteTerminalClass.PolyML.cPtr --> VtePtyClass.PolyML.cPtr)
      val getRewrapOnResize_ = call (getSymbol "vte_terminal_get_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowCount_ = call (getSymbol "vte_terminal_get_row_count") (VteTerminalClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getWindowTitle_ = call (getSymbol "vte_terminal_get_window_title") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWordCharExceptions_ = call (getSymbol "vte_terminal_get_word_char_exceptions") (VteTerminalClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val matchAddGregex_ =
        call (getSymbol "vte_terminal_match_add_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val matchAddRegex_ =
        call (getSymbol "vte_terminal_match_add_regex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VteRegexRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
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
      val matchCheckEvent_ =
        call (getSymbol "vte_terminal_match_check_event")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchRemove_ = call (getSymbol "vte_terminal_match_remove") (VteTerminalClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val matchRemoveAll_ = call (getSymbol "vte_terminal_match_remove_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
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
      val ptyNewSync_ =
        call (getSymbol "vte_terminal_pty_new_sync")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
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
      val searchGetRegex_ = call (getSymbol "vte_terminal_search_get_regex") (VteTerminalClass.PolyML.cPtr --> VteRegexRecord.PolyML.cPtr)
      val searchGetWrapAround_ = call (getSymbol "vte_terminal_search_get_wrap_around") (VteTerminalClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val searchSetGregex_ =
        call (getSymbol "vte_terminal_search_set_gregex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cOptPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> cVoid
          )
      val searchSetRegex_ =
        call (getSymbol "vte_terminal_search_set_regex")
          (
            VteTerminalClass.PolyML.cPtr
             &&> VteRegexRecord.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val searchSetWrapAround_ = call (getSymbol "vte_terminal_search_set_wrap_around") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val selectAll_ = call (getSymbol "vte_terminal_select_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setAllowBold_ = call (getSymbol "vte_terminal_set_allow_bold") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAudibleBell_ = call (getSymbol "vte_terminal_set_audible_bell") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBackspaceBinding_ = call (getSymbol "vte_terminal_set_backspace_binding") (VteTerminalClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> cVoid)
      val setCjkAmbiguousWidth_ = call (getSymbol "vte_terminal_set_cjk_ambiguous_width") (VteTerminalClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setColorBackground_ = call (getSymbol "vte_terminal_set_color_background") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorBold_ = call (getSymbol "vte_terminal_set_color_bold") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursor_ = call (getSymbol "vte_terminal_set_color_cursor") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorCursorForeground_ = call (getSymbol "vte_terminal_set_color_cursor_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorForeground_ = call (getSymbol "vte_terminal_set_color_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setColorHighlight_ = call (getSymbol "vte_terminal_set_color_highlight") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColorHighlightForeground_ = call (getSymbol "vte_terminal_set_color_highlight_foreground") (VteTerminalClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> cVoid)
      val setColors_ =
        call (getSymbol "vte_terminal_set_colors")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecordCArrayN.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cVal
             --> cVoid
          )
      val setCursorBlinkMode_ = call (getSymbol "vte_terminal_set_cursor_blink_mode") (VteTerminalClass.PolyML.cPtr &&> VteCursorBlinkMode.PolyML.cVal --> cVoid)
      val setCursorShape_ = call (getSymbol "vte_terminal_set_cursor_shape") (VteTerminalClass.PolyML.cPtr &&> VteCursorShape.PolyML.cVal --> cVoid)
      val setDefaultColors_ = call (getSymbol "vte_terminal_set_default_colors") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val setDeleteBinding_ = call (getSymbol "vte_terminal_set_delete_binding") (VteTerminalClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> cVoid)
      val setEncoding_ =
        call (getSymbol "vte_terminal_set_encoding")
          (
            VteTerminalClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setFont_ = call (getSymbol "vte_terminal_set_font") (VteTerminalClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val setFontScale_ = call (getSymbol "vte_terminal_set_font_scale") (VteTerminalClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setGeometryHintsForWindow_ = call (getSymbol "vte_terminal_set_geometry_hints_for_window") (VteTerminalClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
      val setInputEnabled_ = call (getSymbol "vte_terminal_set_input_enabled") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMouseAutohide_ = call (getSymbol "vte_terminal_set_mouse_autohide") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPty_ = call (getSymbol "vte_terminal_set_pty") (VteTerminalClass.PolyML.cPtr &&> VtePtyClass.PolyML.cOptPtr --> cVoid)
      val setRewrapOnResize_ = call (getSymbol "vte_terminal_set_rewrap_on_resize") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnKeystroke_ = call (getSymbol "vte_terminal_set_scroll_on_keystroke") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollOnOutput_ = call (getSymbol "vte_terminal_set_scroll_on_output") (VteTerminalClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScrollSpeed_ = call (getSymbol "vte_terminal_set_scroll_speed") (VteTerminalClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setScrollbackLines_ = call (getSymbol "vte_terminal_set_scrollback_lines") (VteTerminalClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> cVoid)
      val setSize_ =
        call (getSymbol "vte_terminal_set_size")
          (
            VteTerminalClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GInt64.PolyML.cVal
             --> cVoid
          )
      val setWordCharExceptions_ = call (getSymbol "vte_terminal_set_word_char_exceptions") (VteTerminalClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val unselectAll_ = call (getSymbol "vte_terminal_unselect_all") (VteTerminalClass.PolyML.cPtr --> cVoid)
      val watchChild_ = call (getSymbol "vte_terminal_watch_child") (VteTerminalClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val writeContentsSync_ =
        call (getSymbol "vte_terminal_write_contents_sync")
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
    type regex_record_c_ptr_array_n_t = VteRegexRecordCPtrArrayN.t
    type pty_flags_t = VtePtyFlags.t
    type regex_t = VteRegexRecord.t
    type write_flags_t = VteWriteFlags.t
    type cursor_blink_mode_t = VteCursorBlinkMode.t
    type cursor_shape_t = VteCursorShape.t
    type erase_binding_t = VteEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.FFI.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.FFI.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.FFI.withPtr ---> I) copyPrimary_ self
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
            VteTerminalClass.FFI.withPtr
             &&&> GdkEvent.FFI.withPtr
             &&&> GLibRegexRecordCPtrArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibRegexMatchFlags.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr
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
            VteTerminalClass.FFI.withPtr
             &&&> GdkEvent.FFI.withPtr
             &&&> VteRegexRecordCPtrArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt32.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr
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
            VteTerminalClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withOptPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
            VteTerminalClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withOptPtr
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
    fun getAllowBold self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.FFI.withPtr ---> GInt64.FFI.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.FFI.withPtr ---> GInt64.FFI.fromVal) getCharWidth_ self
    fun getCjkAmbiguousWidth self = (VteTerminalClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCjkAmbiguousWidth_ self
    fun getColumnCount self = (VteTerminalClass.FFI.withPtr ---> GInt64.FFI.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (VteTerminalClass.FFI.withPtr ---> VteCursorBlinkMode.FFI.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            VteTerminalClass.FFI.withPtr
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
    fun getCursorShape self = (VteTerminalClass.FFI.withPtr ---> VteCursorShape.FFI.fromVal) getCursorShape_ self
    fun getEncoding self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFont self = (VteTerminalClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ self
    fun getFontScale self = (VteTerminalClass.FFI.withPtr ---> GDouble.FFI.fromVal) getFontScale_ self
    fun getGeometryHints self (minRows, minColumns) =
      let
        val hints & () =
          (
            VteTerminalClass.FFI.withPtr
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
    fun getHasSelection self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getIconTitle_ self
    fun getInputEnabled self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getMouseAutohide_ self
    fun getPty self = (VteTerminalClass.FFI.withPtr ---> VtePtyClass.FFI.fromPtr false) getPty_ self
    fun getRewrapOnResize self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.FFI.withPtr ---> GInt64.FFI.fromVal) getRowCount_ self
    fun getWindowTitle self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWindowTitle_ self
    fun getWordCharExceptions self = (VteTerminalClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getWordCharExceptions_ self
    fun matchAddGregex self (gregex, gflags) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GLibRegexRecord.FFI.withPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> VteRegexRecord.FFI.withPtr
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
            VteTerminalClass.FFI.withPtr
             &&&> GInt64.FFI.withVal
             &&&> GInt64.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && Utf8.FFI.fromPtr 1
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
            VteTerminalClass.FFI.withPtr
             &&&> GdkEvent.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && Utf8.FFI.fromPtr 1
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
    fun matchRemove self tag = (VteTerminalClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) matchRemove_ (self & tag)
    fun matchRemoveAll self = (VteTerminalClass.FFI.withPtr ---> I) matchRemoveAll_ self
    fun matchSetCursor self (tag, cursor) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
    fun pasteClipboard self = (VteTerminalClass.FFI.withPtr ---> I) pasteClipboard_ self
    fun pastePrimary self = (VteTerminalClass.FFI.withPtr ---> I) pastePrimary_ self
    fun ptyNewSync self (flags, cancellable) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> VtePtyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
    fun searchGetRegex self = (VteTerminalClass.FFI.withPtr ---> VteRegexRecord.FFI.fromPtr false) searchGetRegex_ self
    fun searchGetWrapAround self = (VteTerminalClass.FFI.withPtr ---> GBool.FFI.fromVal) searchGetWrapAround_ self
    fun searchSetGregex self (gregex, gflags) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GLibRegexRecord.FFI.withOptPtr
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
        VteTerminalClass.FFI.withPtr
         &&&> VteRegexRecord.FFI.withOptPtr
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        searchSetRegex_
        (
          self
           & regex
           & flags
        )
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.FFI.withPtr ---> I) selectAll_ self
    fun setAllowBold self allowBold = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.FFI.withPtr &&&> VteEraseBinding.FFI.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setCjkAmbiguousWidth self width = (VteTerminalClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setCjkAmbiguousWidth_ (self & width)
    fun setColorBackground self background = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorBold_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorCursorForeground self cursorForeground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorCursorForeground_ (self & cursorForeground)
    fun setColorForeground self foreground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (VteTerminalClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withOptPtr ---> I) setColorHighlightForeground_ (self & highlightForeground)
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
            VteTerminalClass.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecordCArrayN.FFI.withOptPtr
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
    fun setCursorBlinkMode self mode = (VteTerminalClass.FFI.withPtr &&&> VteCursorBlinkMode.FFI.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.FFI.withPtr &&&> VteCursorShape.FFI.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.FFI.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.FFI.withPtr &&&> VteEraseBinding.FFI.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEncoding self codeset =
      (
        VteTerminalClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setEncoding_
        (
          self
           & codeset
           & []
        )
    fun setFont self fontDesc = (VteTerminalClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontScale self scale = (VteTerminalClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setFontScale_ (self & scale)
    fun setGeometryHintsForWindow self window = (VteTerminalClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) setGeometryHintsForWindow_ (self & window)
    fun setInputEnabled self enabled = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInputEnabled_ (self & enabled)
    fun setMouseAutohide self setting = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPty self pty = (VteTerminalClass.FFI.withPtr &&&> VtePtyClass.FFI.withOptPtr ---> I) setPty_ (self & pty)
    fun setRewrapOnResize self rewrap = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRewrapOnResize_ (self & rewrap)
    fun setScrollOnKeystroke self scroll = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setScrollOnKeystroke_ (self & scroll)
    fun setScrollOnOutput self scroll = (VteTerminalClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setScrollOnOutput_ (self & scroll)
    fun setScrollSpeed self scrollSpeed = (VteTerminalClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setScrollSpeed_ (self & scrollSpeed)
    fun setScrollbackLines self lines = (VteTerminalClass.FFI.withPtr &&&> GInt64.FFI.withVal ---> I) setScrollbackLines_ (self & lines)
    fun setSize self (columns, rows) =
      (
        VteTerminalClass.FFI.withPtr
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
    fun setWordCharExceptions self exceptions = (VteTerminalClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setWordCharExceptions_ (self & exceptions)
    fun unselectAll self = (VteTerminalClass.FFI.withPtr ---> I) unselectAll_ self
    fun watchChild self childPid = (VteTerminalClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) watchChild_ (self & childPid)
    fun writeContentsSync
      self
      (
        stream,
        flags,
        cancellable
      ) =
      (
        VteTerminalClass.FFI.withPtr
         &&&> GioOutputStreamClass.FFI.withPtr
         &&&> VteWriteFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
