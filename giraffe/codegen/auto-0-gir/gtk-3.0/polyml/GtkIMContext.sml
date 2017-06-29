structure GtkIMContext :>
  GTK_I_M_CONTEXT
    where type 'a class = 'a GtkIMContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_im_context_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val deleteSurrounding_ =
        call (getSymbol "gtk_im_context_delete_surrounding")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val filterKeypress_ = call (getSymbol "gtk_im_context_filter_keypress") (GtkIMContextClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val focusIn_ = call (getSymbol "gtk_im_context_focus_in") (GtkIMContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val focusOut_ = call (getSymbol "gtk_im_context_focus_out") (GtkIMContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getPreeditString_ =
        call (getSymbol "gtk_im_context_get_preedit_string")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> PangoAttrListRecord.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val reset_ = call (getSymbol "gtk_im_context_reset") (GtkIMContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setClientWindow_ = call (getSymbol "gtk_im_context_set_client_window") (GtkIMContextClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setCursorLocation_ = call (getSymbol "gtk_im_context_set_cursor_location") (GtkIMContextClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setSurrounding_ =
        call (getSymbol "gtk_im_context_set_surrounding")
          (
            GtkIMContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setUsePreedit_ = call (getSymbol "gtk_im_context_set_use_preedit") (GtkIMContextClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkIMContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deleteSurrounding self offset nChars =
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
    fun setSurrounding self text len cursorIndex =
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
      fun deleteSurroundingSig f = signal "delete-surrounding" (get 0w1 int &&&> get 0w2 int ---> ret boolean) (fn offset & nChars => f offset nChars)
      fun preeditChangedSig f = signal "preedit-changed" (void ---> ret_void) f
      fun preeditEndSig f = signal "preedit-end" (void ---> ret_void) f
      fun preeditStartSig f = signal "preedit-start" (void ---> ret_void) f
      fun retrieveSurroundingSig f = signal "retrieve-surrounding" (void ---> ret boolean) f
    end
  end
