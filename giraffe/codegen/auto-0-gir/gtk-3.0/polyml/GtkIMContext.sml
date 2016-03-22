structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class = 'a GtkIMContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_im_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val deleteSurrounding_ =
        call (load_sym libgtk "gtk_im_context_delete_surrounding")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val filterKeypress_ = call (load_sym libgtk "gtk_im_context_filter_keypress") (GtkIMContextClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val focusIn_ = call (load_sym libgtk "gtk_im_context_focus_in") (GtkIMContextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val focusOut_ = call (load_sym libgtk "gtk_im_context_focus_out") (GtkIMContextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getPreeditString_ =
        call (load_sym libgtk "gtk_im_context_get_preedit_string")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> FFI.Int.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val reset_ = call (load_sym libgtk "gtk_im_context_reset") (GtkIMContextClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setClientWindow_ = call (load_sym libgtk "gtk_im_context_set_client_window") (GtkIMContextClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setCursorLocation_ = call (load_sym libgtk "gtk_im_context_set_cursor_location") (GtkIMContextClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setSurrounding_ =
        call (load_sym libgtk "gtk_im_context_set_surrounding")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setUsePreedit_ = call (load_sym libgtk "gtk_im_context_set_use_preedit") (GtkIMContextClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkIMContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun deleteSurrounding self offset nChars =
      (
        GtkIMContextClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        deleteSurrounding_
        (
          self
           & offset
           & nChars
        )
    fun filterKeypress self event = (GtkIMContextClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) filterKeypress_ (self & event)
    fun focusIn self = (GtkIMContextClass.C.withPtr ---> I) focusIn_ self
    fun focusOut self = (GtkIMContextClass.C.withPtr ---> I) focusOut_ self
    fun getPreeditString self =
      let
        val str
         & attrs
         & cursorPos
         & () =
          (
            GtkIMContextClass.C.withPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> PangoAttrListRecord.C.withRefOptPtr
             &&&> FFI.Int.C.withRefVal
             ---> Utf8.C.fromPtr true
                   && PangoAttrListRecord.C.fromPtr true
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreeditString_
            (
              self
               & NONE
               & NONE
               & FFI.Int.null
            )
      in
        (
          str,
          attrs,
          cursorPos
        )
      end
    fun reset self = (GtkIMContextClass.C.withPtr ---> I) reset_ self
    fun setClientWindow self window = (GtkIMContextClass.C.withPtr &&&> GdkWindowClass.C.withOptPtr ---> I) setClientWindow_ (self & window)
    fun setCursorLocation self area = (GtkIMContextClass.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) setCursorLocation_ (self & area)
    fun setSurrounding self text len cursorIndex =
      (
        GtkIMContextClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setSurrounding_
        (
          self
           & text
           & len
           & cursorIndex
        )
    fun setUsePreedit self usePreedit = (GtkIMContextClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUsePreedit_ (self & usePreedit)
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
