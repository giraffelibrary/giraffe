structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class = 'a GtkIMContextClass.class =
  struct
    val getType_ = _import "gtk_im_context_get_type" : unit -> GObjectType.FFI.val_;
    val deleteSurrounding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_im_context_delete_surrounding" :
              GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val filterKeypress_ = fn x1 & x2 => (_import "gtk_im_context_filter_keypress" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p * GdkEventKeyRecord.FFI.notnull GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val focusIn_ = _import "gtk_im_context_focus_in" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p -> unit;
    val focusOut_ = _import "gtk_im_context_focus_out" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p -> unit;
    val getPreeditString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_get_preedit_string" :
              GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, PangoAttrListRecord.FFI.notnull) PangoAttrListRecord.FFI.r
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val reset_ = _import "gtk_im_context_reset" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p -> unit;
    val setClientWindow_ = fn x1 & x2 => (_import "gtk_im_context_set_client_window" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p * unit GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setCursorLocation_ = fn x1 & x2 => (_import "gtk_im_context_set_cursor_location" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val setSurrounding_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_set_surrounding" :
              GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setUsePreedit_ = fn x1 & x2 => (_import "gtk_im_context_set_use_preedit" : GtkIMContextClass.FFI.notnull GtkIMContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkIMContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deleteSurrounding self (offset, nChars) =
      (
        GtkIMContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        deleteSurrounding_
        (
          self
           & offset
           & nChars
        )
    fun filterKeypress self event = (GtkIMContextClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) filterKeypress_ (self & event)
    fun focusIn self = (GtkIMContextClass.FFI.withPtr ---> I) focusIn_ self
    fun focusOut self = (GtkIMContextClass.FFI.withPtr ---> I) focusOut_ self
    fun getPreeditString self =
      let
        val str
         & attrs
         & cursorPos
         & () =
          (
            GtkIMContextClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> PangoAttrListRecord.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 1
                   && PangoAttrListRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && I
          )
            getPreeditString_
            (
              self
               & NONE
               & NONE
               & GInt.null
            )
      in
        (
          str,
          attrs,
          cursorPos
        )
      end
    fun reset self = (GtkIMContextClass.FFI.withPtr ---> I) reset_ self
    fun setClientWindow self window = (GtkIMContextClass.FFI.withPtr &&&> GdkWindowClass.FFI.withOptPtr ---> I) setClientWindow_ (self & window)
    fun setCursorLocation self area = (GtkIMContextClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withPtr ---> I) setCursorLocation_ (self & area)
    fun setSurrounding
      self
      (
        text,
        len,
        cursorIndex
      ) =
      (
        GtkIMContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setSurrounding_
        (
          self
           & text
           & len
           & cursorIndex
        )
    fun setUsePreedit self usePreedit = (GtkIMContextClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUsePreedit_ (self & usePreedit)
    local
      open ClosureMarshal Signal
    in
      fun commitSig f = signal "commit" (get 0w1 string ---> ret_void) f
      fun deleteSurroundingSig f = signal "delete-surrounding" (get 0w1 int &&&> get 0w2 int ---> ret boolean) (fn offset & nChars => f (offset, nChars))
      fun preeditChangedSig f = signal "preedit-changed" (void ---> ret_void) f
      fun preeditEndSig f = signal "preedit-end" (void ---> ret_void) f
      fun preeditStartSig f = signal "preedit-start" (void ---> ret_void) f
      fun retrieveSurroundingSig f = signal "retrieve-surrounding" (void ---> ret boolean) f
    end
  end
