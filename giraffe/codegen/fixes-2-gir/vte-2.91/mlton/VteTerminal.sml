structure VteTerminal :>
  VTE_TERMINAL
    where type 'a class = 'a VteTerminalClass.class
    where type pty_flags_t = VtePtyFlags.t
    where type write_flags_t = VteWriteFlags.t
    where type cursor_blink_mode_t = VteCursorBlinkMode.t
    where type cursor_shape_t = VteCursorShape.t
    where type erase_binding_t = VteEraseBinding.t
    where type 'a pty_class = 'a VtePtyClass.class =
  struct
    val getType_ = _import "vte_terminal_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "vte_terminal_new" : unit -> VteTerminalClass.C.notnull VteTerminalClass.C.p;
    val copyClipboard_ = _import "vte_terminal_copy_clipboard" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val copyPrimary_ = _import "vte_terminal_copy_primary" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val feedChild_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_feed_child" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.SSize.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAllowBold_ = _import "vte_terminal_get_allow_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getAudibleBell_ = _import "vte_terminal_get_audible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getCharHeight_ = _import "vte_terminal_get_char_height" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getCharWidth_ = _import "vte_terminal_get_char_width" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getCjkAmbiguousWidth_ = _import "vte_terminal_get_cjk_ambiguous_width" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Int.C.val_;
    val getColumnCount_ = _import "vte_terminal_get_column_count" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getCurrentDirectoryUri_ = _import "vte_terminal_get_current_directory_uri" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getCurrentFileUri_ = _import "vte_terminal_get_current_file_uri" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getCursorBlinkMode_ = _import "vte_terminal_get_cursor_blink_mode" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VteCursorBlinkMode.C.val_;
    val getCursorPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_get_cursor_position" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Long.C.ref_
               * FFI.Long.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getCursorShape_ = _import "vte_terminal_get_cursor_shape" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VteCursorShape.C.val_;
    val getEncoding_ = _import "vte_terminal_get_encoding" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFont_ = _import "vte_terminal_get_font" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getFontScale_ = _import "vte_terminal_get_font_scale" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Double.C.val_;
    val getGeometryHints_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_terminal_get_geometry_hints" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GdkGeometryRecord.C.notnull GdkGeometryRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getHasSelection_ = _import "vte_terminal_get_has_selection" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getIconTitle_ = _import "vte_terminal_get_icon_title" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getInputEnabled_ = _import "vte_terminal_get_input_enabled" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getMouseAutohide_ = _import "vte_terminal_get_mouse_autohide" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getPty_ = _import "vte_terminal_get_pty" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> VtePtyClass.C.notnull VtePtyClass.C.p;
    val getRewrapOnResize_ = _import "vte_terminal_get_rewrap_on_resize" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val getRowCount_ = _import "vte_terminal_get_row_count" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Long.C.val_;
    val getWindowTitle_ = _import "vte_terminal_get_window_title" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val matchAddGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_match_add_gregex" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GLibRegexRecord.C.notnull GLibRegexRecord.C.p
               * GLibRegexMatchFlags.C.val_
               -> FFI.Int.C.val_;
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Long.C.val_
               * FFI.Long.C.val_
               * FFI.Int.C.ref_
               -> Utf8.C.notnull Utf8.C.out_p;
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               * FFI.Int.C.ref_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val matchRemove_ = fn x1 & x2 => (_import "vte_terminal_match_remove" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val matchRemoveAll_ = _import "vte_terminal_match_remove_all" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val matchSetCursorName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_vte_terminal_match_set_cursor_name" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Int.C.val_
               * GdkCursorType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteClipboard_ = _import "vte_terminal_paste_clipboard" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val pastePrimary_ = _import "vte_terminal_paste_primary" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val ptyNewSync_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_terminal_pty_new_sync" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * VtePtyFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> VtePtyClass.C.notnull VtePtyClass.C.p;
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
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchFindNext_ = _import "vte_terminal_search_find_next" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchFindPrevious_ = _import "vte_terminal_search_find_previous" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchGetGregex_ = _import "vte_terminal_search_get_gregex" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> GLibRegexRecord.C.notnull GLibRegexRecord.C.p;
    val searchGetWrapAround_ = _import "vte_terminal_search_get_wrap_around" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> FFI.Bool.C.val_;
    val searchSetGregex_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_search_set_gregex" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * unit GLibRegexRecord.C.p
               * GLibRegexMatchFlags.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val searchSetWrapAround_ = fn x1 & x2 => (_import "vte_terminal_search_set_wrap_around" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val selectAll_ = _import "vte_terminal_select_all" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val setAllowBold_ = fn x1 & x2 => (_import "vte_terminal_set_allow_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setAudibleBell_ = fn x1 & x2 => (_import "vte_terminal_set_audible_bell" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBackspaceBinding_ = fn x1 & x2 => (_import "vte_terminal_set_backspace_binding" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteEraseBinding.C.val_ -> unit;) (x1, x2)
    val setCjkAmbiguousWidth_ = fn x1 & x2 => (_import "vte_terminal_set_cjk_ambiguous_width" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setColorBackground_ = fn x1 & x2 => (_import "vte_terminal_set_color_background" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorBold_ = fn x1 & x2 => (_import "vte_terminal_set_color_bold" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorCursor_ = fn x1 & x2 => (_import "vte_terminal_set_color_cursor" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_foreground" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorHighlight_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColorHighlightForeground_ = fn x1 & x2 => (_import "vte_terminal_set_color_highlight_foreground" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setColors_ =
      fn
        x1 & x2 & x3 =>
          (
            _import "giraffe_vte_terminal_set_colors" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GdkRgbaRecord.C.p
               * unit GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCursorBlinkMode_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_blink_mode" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteCursorBlinkMode.C.val_ -> unit;) (x1, x2)
    val setCursorShape_ = fn x1 & x2 => (_import "vte_terminal_set_cursor_shape" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteCursorShape.C.val_ -> unit;) (x1, x2)
    val setDefaultColors_ = _import "vte_terminal_set_default_colors" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val setDeleteBinding_ = fn x1 & x2 => (_import "vte_terminal_set_delete_binding" : VteTerminalClass.C.notnull VteTerminalClass.C.p * VteEraseBinding.C.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_vte_terminal_set_encoding" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFont_ = fn x1 & x2 => (_import "vte_terminal_set_font" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setFontScale_ = fn x1 & x2 => (_import "vte_terminal_set_font_scale" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setGeometryHintsForWindow_ = fn x1 & x2 => (_import "vte_terminal_set_geometry_hints_for_window" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GtkWindowClass.C.notnull GtkWindowClass.C.p -> unit;) (x1, x2)
    val setInputEnabled_ = fn x1 & x2 => (_import "vte_terminal_set_input_enabled" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMouseAutohide_ = fn x1 & x2 => (_import "vte_terminal_set_mouse_autohide" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPty_ = fn x1 & x2 => (_import "vte_terminal_set_pty" : VteTerminalClass.C.notnull VteTerminalClass.C.p * unit VtePtyClass.C.p -> unit;) (x1, x2)
    val setRewrapOnResize_ = fn x1 & x2 => (_import "vte_terminal_set_rewrap_on_resize" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollOnKeystroke_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_keystroke" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollOnOutput_ = fn x1 & x2 => (_import "vte_terminal_set_scroll_on_output" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScrollbackLines_ = fn x1 & x2 => (_import "vte_terminal_set_scrollback_lines" : VteTerminalClass.C.notnull VteTerminalClass.C.p * FFI.Long.C.val_ -> unit;) (x1, x2)
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_terminal_set_size" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * FFI.Long.C.val_
               * FFI.Long.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val spawnSync_ =
      fn x1 & x2 & (x3, x4) & (x5, x6) & (x7, x8) & x9 & x10 & x11 & x12 & x13 =>
        (
          _import "giraffe_vte_terminal_spawn_sync" :
            VteTerminalClass.C.notnull VteTerminalClass.C.p
             * VtePtyFlags.C.val_
             * Utf8.MLton.p1
             * unit Utf8.MLton.p2
             * Utf8CVector.MLton.p1
             * Utf8CVector.C.notnull Utf8CVector.MLton.p2
             * Utf8CVector.MLton.p1
             * unit Utf8CVector.MLton.p2
             * GLibSpawnFlags.C.val_
             * GLibSpawnChildSetupFunc.C.callback
             * GLibPid.C.ref_
             * unit GioCancellableClass.C.p
             * (unit, unit) GLibErrorRecord.C.r
             -> FFI.Bool.C.val_;
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
    val unselectAll_ = _import "vte_terminal_unselect_all" : VteTerminalClass.C.notnull VteTerminalClass.C.p -> unit;
    val watchChild_ = fn x1 & x2 => (_import "vte_terminal_watch_child" : VteTerminalClass.C.notnull VteTerminalClass.C.p * GLibPid.C.val_ -> unit;) (x1, x2)
    val writeContentsSync_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "vte_terminal_write_contents_sync" :
              VteTerminalClass.C.notnull VteTerminalClass.C.p
               * GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * VteWriteFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
    type write_flags_t = VteWriteFlags.t
    type cursor_blink_mode_t = VteCursorBlinkMode.t
    type cursor_shape_t = VteCursorShape.t
    type erase_binding_t = VteEraseBinding.t
    type 'a pty_class = 'a VtePtyClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> VteTerminalClass.C.fromPtr false) new_ ()
    fun copyClipboard self = (VteTerminalClass.C.withPtr ---> I) copyClipboard_ self
    fun copyPrimary self = (VteTerminalClass.C.withPtr ---> I) copyPrimary_ self
    fun feedChild self text length =
      (
        VteTerminalClass.C.withPtr
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
    fun getAllowBold self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAllowBold_ self
    fun getAudibleBell self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getAudibleBell_ self
    fun getCharHeight self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharHeight_ self
    fun getCharWidth self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getCharWidth_ self
    fun getCjkAmbiguousWidth self = (VteTerminalClass.C.withPtr ---> FFI.Int.C.fromVal) getCjkAmbiguousWidth_ self
    fun getColumnCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getColumnCount_ self
    fun getCurrentDirectoryUri self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentDirectoryUri_ self
    fun getCurrentFileUri self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentFileUri_ self
    fun getCursorBlinkMode self = (VteTerminalClass.C.withPtr ---> VteCursorBlinkMode.C.fromVal) getCursorBlinkMode_ self
    fun getCursorPosition self =
      let
        val column
         & row
         & () =
          (
            VteTerminalClass.C.withPtr
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
    fun getCursorShape self = (VteTerminalClass.C.withPtr ---> VteCursorShape.C.fromVal) getCursorShape_ self
    fun getEncoding self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFont self = (VteTerminalClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ self
    fun getFontScale self = (VteTerminalClass.C.withPtr ---> FFI.Double.C.fromVal) getFontScale_ self
    fun getGeometryHints self minRows minColumns =
      let
        val hints & () =
          (
            VteTerminalClass.C.withPtr
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
    fun getHasSelection self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasSelection_ self
    fun getIconTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getIconTitle_ self
    fun getInputEnabled self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getInputEnabled_ self
    fun getMouseAutohide self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getMouseAutohide_ self
    fun getPty self = (VteTerminalClass.C.withPtr ---> VtePtyClass.C.fromPtr false) getPty_ self
    fun getRewrapOnResize self = (VteTerminalClass.C.withPtr ---> FFI.Bool.C.fromVal) getRewrapOnResize_ self
    fun getRowCount self = (VteTerminalClass.C.withPtr ---> FFI.Long.C.fromVal) getRowCount_ self
    fun getWindowTitle self = (VteTerminalClass.C.withPtr ---> Utf8.C.fromPtr false) getWindowTitle_ self
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
    fun matchCheckEvent self event =
      let
        val tag & retVal =
          (
            VteTerminalClass.C.withPtr
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
    fun matchRemove self tag = (VteTerminalClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) matchRemove_ (self & tag)
    fun matchRemoveAll self = (VteTerminalClass.C.withPtr ---> I) matchRemoveAll_ self
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
    fun ptyNewSync self flags cancellable =
      (
        VteTerminalClass.C.withPtr
         &&&> VtePtyFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
    fun searchSetGregex self regex flags =
      (
        VteTerminalClass.C.withPtr
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
    fun searchSetWrapAround self wrapAround = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) searchSetWrapAround_ (self & wrapAround)
    fun selectAll self = (VteTerminalClass.C.withPtr ---> I) selectAll_ self
    fun setAllowBold self allowBold = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAllowBold_ (self & allowBold)
    fun setAudibleBell self isAudible = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAudibleBell_ (self & isAudible)
    fun setBackspaceBinding self binding = (VteTerminalClass.C.withPtr &&&> VteEraseBinding.C.withVal ---> I) setBackspaceBinding_ (self & binding)
    fun setCjkAmbiguousWidth self width = (VteTerminalClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCjkAmbiguousWidth_ (self & width)
    fun setColorBackground self background = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorBackground_ (self & background)
    fun setColorBold self bold = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorBold_ (self & bold)
    fun setColorCursor self cursorBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorCursor_ (self & cursorBackground)
    fun setColorForeground self foreground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setColorForeground_ (self & foreground)
    fun setColorHighlight self highlightBackground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlight_ (self & highlightBackground)
    fun setColorHighlightForeground self highlightForeground = (VteTerminalClass.C.withPtr &&&> GdkRgbaRecord.C.withOptPtr ---> I) setColorHighlightForeground_ (self & highlightForeground)
    fun setColors self foreground background =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkRgbaRecord.C.withOptPtr
         &&&> GdkRgbaRecord.C.withOptPtr
         ---> I
      )
        setColors_
        (
          self
           & foreground
           & background
        )
    fun setCursorBlinkMode self mode = (VteTerminalClass.C.withPtr &&&> VteCursorBlinkMode.C.withVal ---> I) setCursorBlinkMode_ (self & mode)
    fun setCursorShape self shape = (VteTerminalClass.C.withPtr &&&> VteCursorShape.C.withVal ---> I) setCursorShape_ (self & shape)
    fun setDefaultColors self = (VteTerminalClass.C.withPtr ---> I) setDefaultColors_ self
    fun setDeleteBinding self binding = (VteTerminalClass.C.withPtr &&&> VteEraseBinding.C.withVal ---> I) setDeleteBinding_ (self & binding)
    fun setEncoding self codeset =
      (
        VteTerminalClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setEncoding_
        (
          self
           & codeset
           & []
        )
    fun setFont self fontDesc = (VteTerminalClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFont_ (self & fontDesc)
    fun setFontScale self scale = (VteTerminalClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFontScale_ (self & scale)
    fun setGeometryHintsForWindow self window = (VteTerminalClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) setGeometryHintsForWindow_ (self & window)
    fun setInputEnabled self enabled = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInputEnabled_ (self & enabled)
    fun setMouseAutohide self setting = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMouseAutohide_ (self & setting)
    fun setPty self pty = (VteTerminalClass.C.withPtr &&&> VtePtyClass.C.withOptPtr ---> I) setPty_ (self & pty)
    fun setRewrapOnResize self rewrap = (VteTerminalClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRewrapOnResize_ (self & rewrap)
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
    fun spawnSync terminal ptyFlags workingDirectory argv envv spawnFlags childSetup cancellable =
      let
        val
          childPid
           & _ =
          (
            VteTerminalClass.C.withPtr
             &&&> VtePtyFlags.C.withVal
             &&&> Utf8.C.withOptPtr
             &&&> Utf8CVector.C.withPtr
             &&&> Utf8CVector.C.withOptPtr
             &&&> GLibSpawnFlags.C.withVal
             &&&> GLibSpawnChildSetupFunc.C.withOptCallback
             &&&> GLibPid.C.withRefVal
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GLibPid.C.fromVal
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
               & childSetup
               & GLibPid.null
               & cancellable
               & [GLibSpawnError.handler]
            )
      in
        childPid
      end
    fun unselectAll self = (VteTerminalClass.C.withPtr ---> I) unselectAll_ self
    fun watchChild self childPid = (VteTerminalClass.C.withPtr &&&> GLibPid.C.withVal ---> I) watchChild_ (self & childPid)
    fun writeContentsSync self stream flags cancellable =
      (
        VteTerminalClass.C.withPtr
         &&&> GioOutputStreamClass.C.withPtr
         &&&> VteWriteFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
