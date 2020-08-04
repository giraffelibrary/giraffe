structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class = 'a GtkIMContextClass.class
    where type input_hints_t = GtkInputHints.t
    where type input_purpose_t = GtkInputPurpose.t =
  struct
    val getType_ = _import "gtk_im_context_get_type" : unit -> GObjectType.FFI.val_;
    val deleteSurrounding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_im_context_delete_surrounding" :
              GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val filterKeypress_ = fn x1 & x2 => (_import "gtk_im_context_filter_keypress" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p * GdkEventKeyRecord.FFI.non_opt GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val focusIn_ = _import "gtk_im_context_focus_in" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p -> unit;
    val focusOut_ = _import "gtk_im_context_focus_out" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p -> unit;
    val getPreeditString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_get_preedit_string" :
              GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (PangoAttrListRecord.FFI.opt, PangoAttrListRecord.FFI.non_opt) PangoAttrListRecord.FFI.r
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getSurrounding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_im_context_get_surrounding" :
              GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val reset_ = _import "gtk_im_context_reset" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p -> unit;
    val setClientWindow_ = fn x1 & x2 => (_import "gtk_im_context_set_client_window" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p * GdkWindowClass.FFI.opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setCursorLocation_ = fn x1 & x2 => (_import "gtk_im_context_set_cursor_location" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val setSurrounding_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_im_context_set_surrounding" :
              GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setUsePreedit_ = fn x1 & x2 => (_import "gtk_im_context_set_use_preedit" : GtkIMContextClass.FFI.non_opt GtkIMContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkIMContextClass.class
    type input_hints_t = GtkInputHints.t
    type input_purpose_t = GtkInputPurpose.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deleteSurrounding self (offset, nChars) =
      (
        GtkIMContextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        deleteSurrounding_
        (
          self
           & offset
           & nChars
        )
    fun filterKeypress self event = (GtkIMContextClass.FFI.withPtr false &&&> GdkEventKeyRecord.FFI.withPtr false ---> GBool.FFI.fromVal) filterKeypress_ (self & event)
    fun focusIn self = (GtkIMContextClass.FFI.withPtr false ---> I) focusIn_ self
    fun focusOut self = (GtkIMContextClass.FFI.withPtr false ---> I) focusOut_ self
    fun getPreeditString self =
      let
        val str
         & attrs
         & cursorPos
         & () =
          (
            GtkIMContextClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> PangoAttrListRecord.FFI.withRefOptPtr true
             &&&> GInt32.FFI.withRefVal
             ---> Utf8.FFI.fromPtr ~1
                   && PangoAttrListRecord.FFI.fromPtr true
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreeditString_
            (
              self
               & NONE
               & NONE
               & GInt32.null
            )
      in
        (
          str,
          attrs,
          cursorPos
        )
      end
    fun getSurrounding self =
      let
        val text
         & cursorIndex
         & retVal =
          (
            GtkIMContextClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> Utf8.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSurrounding_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (text, cursorIndex) else NONE
      end
    fun reset self = (GtkIMContextClass.FFI.withPtr false ---> I) reset_ self
    fun setClientWindow self window = (GtkIMContextClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withOptPtr false ---> I) setClientWindow_ (self & window)
    fun setCursorLocation self area = (GtkIMContextClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> I) setCursorLocation_ (self & area)
    fun setSurrounding
      self
      (
        text,
        len,
        cursorIndex
      ) =
      (
        GtkIMContextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setSurrounding_
        (
          self
           & text
           & len
           & cursorIndex
        )
    fun setUsePreedit self usePreedit = (GtkIMContextClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUsePreedit_ (self & usePreedit)
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
    local
      open Property
    in
      val inputHintsProp =
        {
          get = fn x => get "input-hints" GtkInputHints.t x,
          set = fn x => set "input-hints" GtkInputHints.t x,
          new = fn x => new "input-hints" GtkInputHints.t x
        }
      val inputPurposeProp =
        {
          get = fn x => get "input-purpose" GtkInputPurpose.t x,
          set = fn x => set "input-purpose" GtkInputPurpose.t x,
          new = fn x => new "input-purpose" GtkInputPurpose.t x
        }
    end
  end
