structure GtkClipboard :>
  GTK_CLIPBOARD
    where type 'a class_t = 'a GtkClipboardClass.t
    where type selectiondatarecord_t = GtkSelectionDataRecord.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_clipboard_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val get_ = call (load_sym libgtk "gtk_clipboard_get") (GdkAtomRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getForDisplay_ = call (load_sym libgtk "gtk_clipboard_get_for_display") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val clear_ = call (load_sym libgtk "gtk_clipboard_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getDisplay_ = call (load_sym libgtk "gtk_clipboard_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getOwner_ = call (load_sym libgtk "gtk_clipboard_get_owner") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setImage_ = call (load_sym libgtk "gtk_clipboard_set_image") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setText_ =
        call (load_sym libgtk "gtk_clipboard_set_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val store_ = call (load_sym libgtk "gtk_clipboard_store") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val waitForContents_ = call (load_sym libgtk "gtk_clipboard_wait_for_contents") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> GtkSelectionDataRecord.PolyML.PTR)
      val waitForImage_ = call (load_sym libgtk "gtk_clipboard_wait_for_image") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val waitForText_ = call (load_sym libgtk "gtk_clipboard_wait_for_text") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val waitIsImageAvailable_ = call (load_sym libgtk "gtk_clipboard_wait_is_image_available") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val waitIsRichTextAvailable_ = call (load_sym libgtk "gtk_clipboard_wait_is_rich_text_available") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val waitIsTargetAvailable_ = call (load_sym libgtk "gtk_clipboard_wait_is_target_available") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val waitIsTextAvailable_ = call (load_sym libgtk "gtk_clipboard_wait_is_text_available") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val waitIsUrisAvailable_ = call (load_sym libgtk "gtk_clipboard_wait_is_uris_available") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GtkClipboardClass.t
    type selectiondatarecord_t = GtkSelectionDataRecord.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get selection = (GdkAtomRecord.C.withPtr ---> GtkClipboardClass.C.fromPtr false) get_ selection
    fun getForDisplay display selection = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> GtkClipboardClass.C.fromPtr false) getForDisplay_ (display & selection)
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getOwner self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getOwner_ self
    fun setImage self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setImage_ (self & pixbuf)
    fun setText self text len =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun store self = (GObjectObjectClass.C.withPtr ---> I) store_ self
    fun waitForContents self target = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> GtkSelectionDataRecord.C.fromPtr true) waitForContents_ (self & target)
    fun waitForImage self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) waitForImage_ self
    fun waitForText self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) waitForText_ self
    fun waitIsImageAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) waitIsImageAvailable_ self
    fun waitIsRichTextAvailable self buffer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) waitIsRichTextAvailable_ (self & buffer)
    fun waitIsTargetAvailable self target = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.fromVal) waitIsTargetAvailable_ (self & target)
    fun waitIsTextAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) waitIsTextAvailable_ self
    fun waitIsUrisAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) waitIsUrisAvailable_ self
    local
      open ClosureMarshal Signal
    in
      fun ownerChangeSig f = signal "owner-change" (get 0w1 GdkEventOwnerChangeRecord.t ---> ret_void) f
    end
  end
