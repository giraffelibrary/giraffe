structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class_t = 'a GtkIMContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val deleteSurrounding_ =
        call (load_sym libgtk "gtk_im_context_delete_surrounding")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val filterKeypress_ = call (load_sym libgtk "gtk_im_context_filter_keypress") (GObjectObjectClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val focusIn_ = call (load_sym libgtk "gtk_im_context_focus_in") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val focusOut_ = call (load_sym libgtk "gtk_im_context_focus_out") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getPreeditString_ =
        call (load_sym libgtk "gtk_im_context_get_preedit_string")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val reset_ = call (load_sym libgtk "gtk_im_context_reset") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setClientWindow_ = call (load_sym libgtk "gtk_im_context_set_client_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setCursorLocation_ = call (load_sym libgtk "gtk_im_context_set_cursor_location") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setSurrounding_ =
        call (load_sym libgtk "gtk_im_context_set_surrounding")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setUsePreedit_ = call (load_sym libgtk "gtk_im_context_set_use_preedit") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
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
             &&&> Utf8.C.withRefOptPtr
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             ---> Utf8.C.fromPtr true
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
         &&&> Utf8.C.withPtr
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
