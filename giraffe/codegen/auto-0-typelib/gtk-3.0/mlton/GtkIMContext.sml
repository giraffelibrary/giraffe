structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class_t = 'a GtkIMContextClass.t =
  struct
    val getType_ = _import "gtk_im_context_get_type" : unit -> GObjectType.C.val_;
    val deleteSurrounding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_im_context_delete_surrounding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val filterKeypress_ = fn x1 & x2 => (_import "gtk_im_context_filter_keypress" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val focusIn_ = _import "gtk_im_context_focus_in" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val focusOut_ = _import "gtk_im_context_focus_out" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getPreeditString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_get_preedit_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               * (unit, PangoAttrListRecord.C.notnull) PangoAttrListRecord.C.r
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val reset_ = _import "gtk_im_context_reset" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setClientWindow_ = fn x1 & x2 => (_import "gtk_im_context_set_client_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setCursorLocation_ = fn x1 & x2 => (_import "gtk_im_context_set_cursor_location" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val setSurrounding_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_set_surrounding" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setUsePreedit_ = fn x1 & x2 => (_import "gtk_im_context_set_use_preedit" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkIMContextClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun deleteSurrounding self offset nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        deleteSurrounding_
        (
          self
           & offset
           & nChars
        )
    fun filterKeypress self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) filterKeypress_ (self & event)
    fun focusIn self = (GObjectObjectClass.C.withPtr ---> I) focusIn_ self
    fun focusOut self = (GObjectObjectClass.C.withPtr ---> I) focusOut_ self
    fun getPreeditString self =
      let
        val str
         & attrs
         & cursorPos
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.String.C.fromPtr true
                   && PangoAttrListRecord.C.fromPtr true
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreeditString_
            (
              self
               & NONE
               & NONE
               & FFI.Int32.null
            )
      in
        (
          str,
          attrs,
          cursorPos
        )
      end
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
    fun setClientWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setClientWindow_ (self & window)
    fun setCursorLocation self area = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) setCursorLocation_ (self & area)
    fun setSurrounding self text len cursorIndex =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setSurrounding_
        (
          self
           & text
           & len
           & cursorIndex
        )
    fun setUsePreedit self usePreedit = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUsePreedit_ (self & usePreedit)
    local
      open ClosureMarshal Signal
    in
      fun commitSig f = signal "commit" (get 0w1 string ---> ret_void) f
      fun deleteSurroundingSig f = signal "delete-surrounding" (get 0w1 int &&&> get 0w2 int ---> ret boolean) (fn offset & nChars => f offset nChars)
      fun preeditChangedSig f = signal "preedit-changed" (void ---> ret_void) f
      fun preeditEndSig f = signal "preedit-end" (void ---> ret_void) f
      fun preeditStartSig f = signal "preedit-start" (void ---> ret_void) f
      fun retrieveSurroundingSig f = signal "retrieve-surrounding" (void ---> ret boolean) f
    end
  end
