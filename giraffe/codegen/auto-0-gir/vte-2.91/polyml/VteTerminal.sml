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
      val getType_ = call (load_sym libvte "vte_terminal_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libvte "vte_terminal_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val copyClipboard_ = call (load_sym libvte "vte_terminal_copy_clipboard") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val copyPrimary_ = call (load_sym libvte "vte_terminal_copy_primary") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val feedChild_ =
        call (load_sym libvte "vte_terminal_feed_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.SSize.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getAllowBold_ = call (load_sym libvte "vte_terminal_get_allow_bold") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getAudibleBell_ = call (load_sym libvte "vte_terminal_get_audible_bell") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCharHeight_ = call (load_sym libvte "vte_terminal_get_char_height") (GObjectObjectClass.PolyML.PTR --> FFI.Long.PolyML.VAL)
      val getCharWidth_ = call (load_sym libvte "vte_terminal_get_char_width") (GObjectObjectClass.PolyML.PTR --> FFI.Long.PolyML.VAL)
      val getCjkAmbiguousWidth_ = call (load_sym libvte "vte_terminal_get_cjk_ambiguous_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getColumnCount_ = call (load_sym libvte "vte_terminal_get_column_count") (GObjectObjectClass.PolyML.PTR --> FFI.Long.PolyML.VAL)
      val getCurrentDirectoryUri_ = call (load_sym libvte "vte_terminal_get_current_directory_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getCurrentFileUri_ = call (load_sym libvte "vte_terminal_get_current_file_uri") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getCursorBlinkMode_ = call (load_sym libvte "vte_terminal_get_cursor_blink_mode") (GObjectObjectClass.PolyML.PTR --> VteCursorBlinkMode.PolyML.VAL)
      val getCursorPosition_ =
        call (load_sym libvte "vte_terminal_get_cursor_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Long.PolyML.REF
             &&> FFI.Long.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getCursorShape_ = call (load_sym libvte "vte_terminal_get_cursor_shape") (GObjectObjectClass.PolyML.PTR --> VteCursorShape.PolyML.VAL)
      val getEncoding_ = call (load_sym libvte "vte_terminal_get_encoding") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getFont_ = call (load_sym libvte "vte_terminal_get_font") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getFontScale_ = call (load_sym libvte "vte_terminal_get_font_scale") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getGeometryHints_ =
        call (load_sym libvte "vte_terminal_get_geometry_hints")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkGeometryRecord.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getHasSelection_ = call (load_sym libvte "vte_terminal_get_has_selection") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIconTitle_ = call (load_sym libvte "vte_terminal_get_icon_title") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getInputEnabled_ = call (load_sym libvte "vte_terminal_get_input_enabled") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getMouseAutohide_ = call (load_sym libvte "vte_terminal_get_mouse_autohide") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPty_ = call (load_sym libvte "vte_terminal_get_pty") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getRewrapOnResize_ = call (load_sym libvte "vte_terminal_get_rewrap_on_resize") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getRowCount_ = call (load_sym libvte "vte_terminal_get_row_count") (GObjectObjectClass.PolyML.PTR --> FFI.Long.PolyML.VAL)
      val getWindowTitle_ = call (load_sym libvte "vte_terminal_get_window_title") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val matchAddGregex_ =
        call (load_sym libvte "vte_terminal_match_add_gregex")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibRegexRecord.PolyML.PTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.Int.PolyML.VAL
          )
      val matchCheck_ =
        call (load_sym libvte "vte_terminal_match_check")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Long.PolyML.VAL
             &&> FFI.Long.PolyML.VAL
             &&> FFI.Int.PolyML.REF
             --> FFI.String.PolyML.RETPTR
          )
      val matchCheckEvent_ =
        call (load_sym libvte "vte_terminal_match_check_event")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkEvent.PolyML.PTR
             &&> FFI.Int.PolyML.REF
             --> FFI.String.PolyML.RETPTR
          )
      val matchRemove_ = call (load_sym libvte "vte_terminal_match_remove") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val matchRemoveAll_ = call (load_sym libvte "vte_terminal_match_remove_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val matchSetCursorName_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_name")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val matchSetCursorType_ =
        call (load_sym libvte "vte_terminal_match_set_cursor_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> GdkCursorType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val pasteClipboard_ = call (load_sym libvte "vte_terminal_paste_clipboard") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val pastePrimary_ = call (load_sym libvte "vte_terminal_paste_primary") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val ptyNewSync_ =
        call (load_sym libvte "vte_terminal_pty_new_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> VtePtyFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val reset_ =
        call (load_sym libvte "vte_terminal_reset")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val searchFindNext_ = call (load_sym libvte "vte_terminal_search_find_next") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val searchFindPrevious_ = call (load_sym libvte "vte_terminal_search_find_previous") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val searchGetGregex_ = call (load_sym libvte "vte_terminal_search_get_gregex") (GObjectObjectClass.PolyML.PTR --> GLibRegexRecord.PolyML.PTR)
      val searchGetWrapAround_ = call (load_sym libvte "vte_terminal_search_get_wrap_around") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val searchSetGregex_ =
        call (load_sym libvte "vte_terminal_search_set_gregex")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibRegexRecord.PolyML.OPTPTR
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val searchSetWrapAround_ = call (load_sym libvte "vte_terminal_search_set_wrap_around") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val selectAll_ = call (load_sym libvte "vte_terminal_select_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setAllowBold_ = call (load_sym libvte "vte_terminal_set_allow_bold") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setAudibleBell_ = call (load_sym libvte "vte_terminal_set_audible_bell") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setBackspaceBinding_ = call (load_sym libvte "vte_terminal_set_backspace_binding") (GObjectObjectClass.PolyML.PTR &&> VteEraseBinding.PolyML.VAL --> FFI.PolyML.VOID)
      val setCjkAmbiguousWidth_ = call (load_sym libvte "vte_terminal_set_cjk_ambiguous_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setColorBackground_ = call (load_sym libvte "vte_terminal_set_color_background") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setColorBold_ = call (load_sym libvte "vte_terminal_set_color_bold") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setColorCursor_ = call (load_sym libvte "vte_terminal_set_color_cursor") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setColorForeground_ = call (load_sym libvte "vte_terminal_set_color_foreground") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setColorHighlight_ = call (load_sym libvte "vte_terminal_set_color_highlight") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setColorHighlightForeground_ = call (load_sym libvte "vte_terminal_set_color_highlight_foreground") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setCursorBlinkMode_ = call (load_sym libvte "vte_terminal_set_cursor_blink_mode") (GObjectObjectClass.PolyML.PTR &&> VteCursorBlinkMode.PolyML.VAL --> FFI.PolyML.VOID)
      val setCursorShape_ = call (load_sym libvte "vte_terminal_set_cursor_shape") (GObjectObjectClass.PolyML.PTR &&> VteCursorShape.PolyML.VAL --> FFI.PolyML.VOID)
      val setDefaultColors_ = call (load_sym libvte "vte_terminal_set_default_colors") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setDeleteBinding_ = call (load_sym libvte "vte_terminal_set_delete_binding") (GObjectObjectClass.PolyML.PTR &&> VteEraseBinding.PolyML.VAL --> FFI.PolyML.VOID)
      val setEncoding_ =
        call (load_sym libvte "vte_terminal_set_encoding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setFont_ = call (load_sym libvte "vte_terminal_set_font") (GObjectObjectClass.PolyML.PTR &&> PangoFontDescriptionRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setFontScale_ = call (load_sym libvte "vte_terminal_set_font_scale") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setGeometryHintsForWindow_ = call (load_sym libvte "vte_terminal_set_geometry_hints_for_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setInputEnabled_ = call (load_sym libvte "vte_terminal_set_input_enabled") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setMouseAutohide_ = call (load_sym libvte "vte_terminal_set_mouse_autohide") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPty_ = call (load_sym libvte "vte_terminal_set_pty") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setRewrapOnResize_ = call (load_sym libvte "vte_terminal_set_rewrap_on_resize") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setScrollOnKeystroke_ = call (load_sym libvte "vte_terminal_set_scroll_on_keystroke") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setScrollOnOutput_ = call (load_sym libvte "vte_terminal_set_scroll_on_output") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setScrollbackLines_ = call (load_sym libvte "vte_terminal_set_scrollback_lines") (GObjectObjectClass.PolyML.PTR &&> FFI.Long.PolyML.VAL --> FFI.PolyML.VOID)
      val setSize_ =
        call (load_sym libvte "vte_terminal_set_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Long.PolyML.VAL
             &&> FFI.Long.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val unselectAll_ = call (load_sym libvte "vte_terminal_unselect_all") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val watchChild_ = call (load_sym libvte "vte_terminal_watch_child") (GObjectObjectClass.PolyML.PTR &&> GLibPid.PolyML.VAL --> FFI.PolyML.VOID)
      val writeContentsSync_ =
        call (load_sym libvte "vte_terminal_write_contents_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> VteWriteFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
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
         &&&> FFI.String.C.withConstPtr
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
    fun getCurrentDirectoryUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCurrentFileUri_ self
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
    fun getEncoding self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getEncoding_ self
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
    fun getIconTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getIconTitle_ self
    fun getInputEnabled self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPty self = (GObjectObjectClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPty_ self
    fun getRewrapOnResize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (GObjectObjectClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getWindowTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWindowTitle_ self
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
             ---> FFI.Int.C.fromVal && FFI.String.C.fromPtr true
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
             ---> FFI.Int.C.fromVal && FFI.String.C.fromPtr true
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
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstOptPtr
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
