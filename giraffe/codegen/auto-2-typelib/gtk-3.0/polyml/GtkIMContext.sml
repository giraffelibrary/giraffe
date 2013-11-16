structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class_t = 'a GtkIMContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val deleteSurrounding_ =
        call (load_sym libgtk "gtk_im_context_delete_surrounding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val filterKeypress_ = call (load_sym libgtk "gtk_im_context_filter_keypress") (GObjectObjectClass.PolyML.PTR &&> GdkEventKeyRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val focusIn_ = call (load_sym libgtk "gtk_im_context_focus_in") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val focusOut_ = call (load_sym libgtk "gtk_im_context_focus_out") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getPreeditString_ =
        call (load_sym libgtk "gtk_im_context_get_preedit_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.OUTREF
             &&> PangoAttrListRecord.PolyML.OUTREF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val reset_ = call (load_sym libgtk "gtk_im_context_reset") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setClientWindow_ = call (load_sym libgtk "gtk_im_context_set_client_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setCursorLocation_ = call (load_sym libgtk "gtk_im_context_set_cursor_location") (GObjectObjectClass.PolyML.PTR &&> CairoRectangleIntRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setSurrounding_ =
        call (load_sym libgtk "gtk_im_context_set_surrounding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setUsePreedit_ = call (load_sym libgtk "gtk_im_context_set_use_preedit") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkIMContextClass.t
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
               & 0
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
