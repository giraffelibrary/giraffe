structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class_t = 'a VteTerminalClass.t
    where type pty_flags_t = VtePtyFlags.t
    where type write_flags_t = VteWriteFlags.t
    where type cursor_blink_mode_t = VteCursorBlinkMode.t
    where type cursor_shape_t = VteCursorShape.t
    where type erase_binding_t = VteEraseBinding.t
    where type 'a pty_class_t = 'a VtePtyClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_terminal_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libvte "vte_terminal_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val copyClipboard_ = call (load_sym libvte "vte_terminal_copy_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val copyPrimary_ = call (load_sym libvte "vte_terminal_copy_primary") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val feedChild_ =
        call (load_sym libvte "vte_terminal_feed_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getAllowBold_ = call (load_sym libvte "vte_terminal_get_allow_bold") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAudibleBell_ = call (load_sym libvte "vte_terminal_get_audible_bell") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCharHeight_ = call (load_sym libvte "vte_terminal_get_char_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCharWidth_ = call (load_sym libvte "vte_terminal_get_char_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCjkAmbiguousWidth_ = call (load_sym libvte "vte_terminal_get_cjk_ambiguous_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getColumnCount_ = call (load_sym libvte "vte_terminal_get_column_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getCurrentDirectoryUri_ = call (load_sym libvte "vte_terminal_get_current_directory_uri") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCurrentFileUri_ = call (load_sym libvte "vte_terminal_get_current_file_uri") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCursorBlinkMode_ = call (load_sym libvte "vte_terminal_get_cursor_blink_mode") (GObjectObjectClass.PolyML.cPtr --> VteCursorBlinkMode.PolyML.cVal)
      val getCursorPosition_ =
        call (load_sym libvte "vte_terminal_get_cursor_position")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Long.PolyML.cRef
             &&> FFI.Long.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getCursorShape_ = call (load_sym libvte "vte_terminal_get_cursor_shape") (GObjectObjectClass.PolyML.cPtr --> VteCursorShape.PolyML.cVal)
      val getEncoding_ = call (load_sym libvte "vte_terminal_get_encoding") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFont_ = call (load_sym libvte "vte_terminal_get_font") (GObjectObjectClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontScale_ = call (load_sym libvte "vte_terminal_get_font_scale") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getGeometryHints_ =
        call (load_sym libvte "vte_terminal_get_geometry_hints")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkGeometryRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getHasSelection_ = call (load_sym libvte "vte_terminal_get_has_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIconTitle_ = call (load_sym libvte "vte_terminal_get_icon_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getInputEnabled_ = call (load_sym libvte "vte_terminal_get_input_enabled") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMouseAutohide_ = call (load_sym libvte "vte_terminal_get_mouse_autohide") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPty_ = call (load_sym libvte "vte_terminal_get_pty") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getRewrapOnResize_ = call (load_sym libvte "vte_terminal_get_rewrap_on_resize") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowCount_ = call (load_sym libvte "vte_terminal_get_row_count") (GObjectObjectClass.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getWindowTitle_ = call (load_sym libvte "vte_terminal_get_window_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
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
      val matchCheckEvent_ =
        call (load_sym libvte "vte_terminal_match_check_event")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             --> Utf8.PolyML.cOutPtr
          )
      val matchRemove_ = call (load_sym libvte "vte_terminal_match_remove") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val matchRemoveAll_ = call (load_sym libvte "vte_terminal_match_remove_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
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
      val ptyNewSync_ =
        call (load_sym libvte "vte_terminal_pty_new_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> VtePtyFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
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
      val searchSetGregex_ =
        call (load_sym libvte "vte_terminal_search_set_gregex")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibRegexRecord.PolyML.cOptPtr
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val searchSetWrapAround_ = call (load_sym libvte "vte_terminal_search_set_wrap_around") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectAll_ = call (load_sym libvte "vte_terminal_select_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAllowBold_ = call (load_sym libvte "vte_terminal_set_allow_bold") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setAudibleBell_ = call (load_sym libvte "vte_terminal_set_audible_bell") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBackspaceBinding_ = call (load_sym libvte "vte_terminal_set_backspace_binding") (GObjectObjectClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCjkAmbiguousWidth_ = call (load_sym libvte "vte_terminal_set_cjk_ambiguous_width") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColorBackground_ = call (load_sym libvte "vte_terminal_set_color_background") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorBold_ = call (load_sym libvte "vte_terminal_set_color_bold") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorCursor_ = call (load_sym libvte "vte_terminal_set_color_cursor") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorForeground_ = call (load_sym libvte "vte_terminal_set_color_foreground") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setColorHighlight_ = call (load_sym libvte "vte_terminal_set_color_highlight") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setColorHighlightForeground_ = call (load_sym libvte "vte_terminal_set_color_highlight_foreground") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setCursorBlinkMode_ = call (load_sym libvte "vte_terminal_set_cursor_blink_mode") (GObjectObjectClass.PolyML.cPtr &&> VteCursorBlinkMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCursorShape_ = call (load_sym libvte "vte_terminal_set_cursor_shape") (GObjectObjectClass.PolyML.cPtr &&> VteCursorShape.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultColors_ = call (load_sym libvte "vte_terminal_set_default_colors") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDeleteBinding_ = call (load_sym libvte "vte_terminal_set_delete_binding") (GObjectObjectClass.PolyML.cPtr &&> VteEraseBinding.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEncoding_ =
        call (load_sym libvte "vte_terminal_set_encoding")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setFont_ = call (load_sym libvte "vte_terminal_set_font") (GObjectObjectClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFontScale_ = call (load_sym libvte "vte_terminal_set_font_scale") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setGeometryHintsForWindow_ = call (load_sym libvte "vte_terminal_set_geometry_hints_for_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setInputEnabled_ = call (load_sym libvte "vte_terminal_set_input_enabled") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMouseAutohide_ = call (load_sym libvte "vte_terminal_set_mouse_autohide") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPty_ = call (load_sym libvte "vte_terminal_set_pty") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setRewrapOnResize_ = call (load_sym libvte "vte_terminal_set_rewrap_on_resize") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
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
      val unselectAll_ = call (load_sym libvte "vte_terminal_unselect_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val watchChild_ = call (load_sym libvte "vte_terminal_watch_child") (GObjectObjectClass.PolyML.cPtr &&> GLibPid.PolyML.cVal --> FFI.PolyML.cVoid)
      val writeContentsSync_ =
        call (load_sym libvte "vte_terminal_write_contents_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> VteWriteFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a VteTerminalClass.t
    type pty_flags_t = VtePtyFlags.t
    type write_flags_t = VteWriteFlags.t
    type cursor_blink_mode_t = VteCursorBlinkMode.t
    type cursor_shape_t = VteCursorShape.t
    type erase_binding_t = VteEraseBinding.t
    type 'a pty_class_t = 'a VtePtyClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.C.fromPtr false) new_ ()
    fun copyClipboard self = (GObjectObjectClass.C.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (GObjectObjectClass.C.withPtr ---> I) copyPrimary_ self
    fun feedChild self text length =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         ---> I
      )
        feedChild_
        (
          self
           & text
           & length
        )
    fun getAllowBold self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowBold_ self
    fun getAudibleBell self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAudibleBell_ self
    fun getCharHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getCharHeight_ self
    fun getCharWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getCharWidth_ self
    fun getCjkAmbiguousWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCjkAmbiguousWidth_ self
    fun getColumnCount self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (GObjectObjectClass.C.withPtr ---> VteCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Long.C.withRefVal
             &&&> FFI.Long.C.withRefVal
             ---> FFI.Long.C.fromVal
                   && FFI.Long.C.fromVal
                   && I
          )
            getCursorPosition_
            (
              self
               & FFI.Long.null
               & FFI.Long.null
            )
      in
        (column, row)
      end
    fun getCursorShape self = (GObjectObjectClass.C.withPtr ---> VteCursorShape.C.fromVal) getCursorShape_ self
    fun getEncoding self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFont self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getFontScale self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getFontScale_ self
    fun getGeometryHints self minRows minColumns =
      let
        val hints & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GdkGeometryRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             ---> GdkGeometryRecord.C.fromPtr true && I
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
    fun getHasSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getIconTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getIconTitle_ self
    fun getInputEnabled self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPty self = (GObjectObjectClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPty_ self
    fun getRewrapOnResize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getWindowTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getWindowTitle_ self
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
    fun matchCheckEvent self event =
      let
        val tag & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GdkEvent.C.withPtr
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal && Utf8.C.fromPtr true
          )
            matchCheckEvent_
            (
              self
               & event
               & FFI.Int.null
            )
      in
        (retVal, tag)
      end
    fun matchRemove self tag = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) matchRemove_ (self & tag)
    fun matchRemoveAll self = (GObjectObjectClass.C.withPtr ---> I) matchRemoveAll_ self
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
    fun ptyNewSync self flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> VtePtyFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> VtePtyClass.C.fromPtr true
      )
        ptyNewSync_
        (
          self
           & flags
           & cancellable
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
    fun searchSetGregex self regex flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibRegexRecord.C.withOptPtr
         &&&> GLibRegexMatchFlags.C.withVal
         ---> I
      )
        searchSetGregex_
        (
          self
           & regex
           & flags
        )
    fun searchSetWrapAround self wrapAround = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (GObjectObjectClass.C.withPtr ---> I) selectAll_ self
    fun setAllowBold self allowBold = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (GObjectObjectClass.C.withPtr &&&> VteEraseBinding.C.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setCjkAmbiguousWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCjkAmbiguousWidth_ (self & width)
    fun setColorBackground self background = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBold self bold = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorBold_ (self & bold)
    fun setColorCursor self cursorBackground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorForeground self foreground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorHighlight self highlightBackground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlightForeground_ (self & highlightForeground)
    fun setCursorBlinkMode self mode = (GObjectObjectClass.C.withPtr &&&> VteCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (GObjectObjectClass.C.withPtr &&&> VteCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (GObjectObjectClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (GObjectObjectClass.C.withPtr &&&> VteEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEncoding self codeset =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        setEncoding_
        (
          self
           & codeset
           & []
        )
    fun setFont self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontScale self scale = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFontScale_ (self & scale)
    fun setGeometryHintsForWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setGeometryHintsForWindow_ (self & window)
    fun setInputEnabled self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInputEnabled_ (self & enabled)
    fun setMouseAutohide self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPty self pty = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setPty_ (self & pty)
    fun setRewrapOnResize self rewrap = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRewrapOnResize_ (self & rewrap)
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
    fun unselectAll self = (GObjectObjectClass.C.withPtr ---> I) unselectAll_ self
    fun watchChild self childPid = (GObjectObjectClass.C.withPtr &&&> GLibPid.C.withVal ---> I) watchChild_ (self & childPid)
    fun writeContentsSync self stream flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> VteWriteFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
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
      fun charSizeChangedSig f = signal "char-size-changed" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f width height)
      fun childExitedSig f = signal "child-exited" (get 0w1 int ---> ret_void) f
      fun commitSig f = signal "commit" (get 0w1 string &&&> get 0w2 uint ---> ret_void) (fn text & size => f text size)
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
      fun moveWindowSig f = signal "move-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn x & y => f x y)
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun raiseWindowSig f = signal "raise-window" (void ---> ret_void) f
      fun refreshWindowSig f = signal "refresh-window" (void ---> ret_void) f
      fun resizeWindowSig f = signal "resize-window" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn width & height => f width height)
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
          set = fn x => set "allow-bold" boolean x
        }
      val audibleBellProp =
        {
          get = fn x => get "audible-bell" boolean x,
          set = fn x => set "audible-bell" boolean x
        }
      val backspaceBindingProp =
        {
          get = fn x => get "backspace-binding" VteEraseBinding.t x,
          set = fn x => set "backspace-binding" VteEraseBinding.t x
        }
      val cjkAmbiguousWidthProp =
        {
          get = fn x => get "cjk-ambiguous-width" int x,
          set = fn x => set "cjk-ambiguous-width" int x
        }
      val currentDirectoryUriProp = {get = fn x => get "current-directory-uri" stringOpt x}
      val currentFileUriProp = {get = fn x => get "current-file-uri" stringOpt x}
      val cursorBlinkModeProp =
        {
          get = fn x => get "cursor-blink-mode" VteCursorBlinkMode.t x,
          set = fn x => set "cursor-blink-mode" VteCursorBlinkMode.t x
        }
      val cursorShapeProp =
        {
          get = fn x => get "cursor-shape" VteCursorShape.t x,
          set = fn x => set "cursor-shape" VteCursorShape.t x
        }
      val deleteBindingProp =
        {
          get = fn x => get "delete-binding" VteEraseBinding.t x,
          set = fn x => set "delete-binding" VteEraseBinding.t x
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
      val fontScaleProp =
        {
          get = fn x => get "font-scale" double x,
          set = fn x => set "font-scale" double x
        }
      val iconTitleProp = {get = fn x => get "icon-title" stringOpt x}
      val inputEnabledProp =
        {
          get = fn x => get "input-enabled" boolean x,
          set = fn x => set "input-enabled" boolean x
        }
      val pointerAutohideProp =
        {
          get = fn x => get "pointer-autohide" boolean x,
          set = fn x => set "pointer-autohide" boolean x
        }
      val ptyProp =
        {
          get = fn x => get "pty" VtePtyClass.tOpt x,
          set = fn x => set "pty" VtePtyClass.tOpt x
        }
      val rewrapOnResizeProp =
        {
          get = fn x => get "rewrap-on-resize" boolean x,
          set = fn x => set "rewrap-on-resize" boolean x
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
      val windowTitleProp = {get = fn x => get "window-title" stringOpt x}
    end
  end
