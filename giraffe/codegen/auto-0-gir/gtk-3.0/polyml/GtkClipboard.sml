structure GtkClipboard :>
  GTK_CLIPBOARD
    where type 'a class = 'a GtkClipboardClass.class
    where type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    where type selection_data_t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_clipboard_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val get_ = call (getSymbol "gtk_clipboard_get") (GdkAtomRecord.PolyML.cPtr --> GtkClipboardClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "gtk_clipboard_get_default") (GdkDisplayClass.PolyML.cPtr --> GtkClipboardClass.PolyML.cPtr)
      val getForDisplay_ = call (getSymbol "gtk_clipboard_get_for_display") (GdkDisplayClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GtkClipboardClass.PolyML.cPtr)
      val clear_ = call (getSymbol "gtk_clipboard_clear") (GtkClipboardClass.PolyML.cPtr --> cVoid)
      val getDisplay_ = call (getSymbol "gtk_clipboard_get_display") (GtkClipboardClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getOwner_ = call (getSymbol "gtk_clipboard_get_owner") (GtkClipboardClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cOptPtr)
      val setCanStore_ =
        call (getSymbol "gtk_clipboard_set_can_store")
          (
            GtkClipboardClass.PolyML.cPtr
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInOptPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setImage_ = call (getSymbol "gtk_clipboard_set_image") (GtkClipboardClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val setText_ =
        call (getSymbol "gtk_clipboard_set_text")
          (
            GtkClipboardClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val store_ = call (getSymbol "gtk_clipboard_store") (GtkClipboardClass.PolyML.cPtr --> cVoid)
      val waitForContents_ = call (getSymbol "gtk_clipboard_wait_for_contents") (GtkClipboardClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GtkSelectionDataRecord.PolyML.cOptPtr)
      val waitForImage_ = call (getSymbol "gtk_clipboard_wait_for_image") (GtkClipboardClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val waitForRichText_ =
        call (getSymbol "gtk_clipboard_wait_for_rich_text")
          (
            GtkClipboardClass.PolyML.cPtr
             &&> GtkTextBufferClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cOutRef
             &&> GSize.PolyML.cRef
             --> GUInt8CArrayN.PolyML.cOutOptPtr
          )
      val waitForTargets_ =
        call (getSymbol "gtk_clipboard_wait_for_targets")
          (
            GtkClipboardClass.PolyML.cPtr
             &&> GdkAtomRecordCArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val waitForText_ = call (getSymbol "gtk_clipboard_wait_for_text") (GtkClipboardClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val waitForUris_ = call (getSymbol "gtk_clipboard_wait_for_uris") (GtkClipboardClass.PolyML.cPtr --> Utf8CArray.PolyML.cOutOptPtr)
      val waitIsImageAvailable_ = call (getSymbol "gtk_clipboard_wait_is_image_available") (GtkClipboardClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val waitIsRichTextAvailable_ = call (getSymbol "gtk_clipboard_wait_is_rich_text_available") (GtkClipboardClass.PolyML.cPtr &&> GtkTextBufferClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val waitIsTargetAvailable_ = call (getSymbol "gtk_clipboard_wait_is_target_available") (GtkClipboardClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val waitIsTextAvailable_ = call (getSymbol "gtk_clipboard_wait_is_text_available") (GtkClipboardClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val waitIsUrisAvailable_ = call (getSymbol "gtk_clipboard_wait_is_uris_available") (GtkClipboardClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GtkClipboardClass.class
    type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun get selection = (GdkAtomRecord.FFI.withPtr ---> GtkClipboardClass.FFI.fromPtr false) get_ selection
    fun getDefault display = (GdkDisplayClass.FFI.withPtr ---> GtkClipboardClass.FFI.fromPtr false) getDefault_ display
    fun getForDisplay (display, selection) = (GdkDisplayClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> GtkClipboardClass.FFI.fromPtr false) getForDisplay_ (display & selection)
    fun clear self = (GtkClipboardClass.FFI.withPtr ---> I) clear_ self
    fun getDisplay self = (GtkClipboardClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getOwner self = (GtkClipboardClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromOptPtr false) getOwner_ self
    fun setCanStore self targets =
      let
        val nTargets =
          case targets of
            SOME targets => LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
          | NONE => GInt.null
        val () =
          (
            GtkClipboardClass.FFI.withPtr
             &&&> GtkTargetEntryRecordCArrayN.FFI.withOptPtr
             &&&> GInt.FFI.withVal
             ---> I
          )
            setCanStore_
            (
              self
               & targets
               & nTargets
            )
      in
        ()
      end
    fun setImage self pixbuf = (GtkClipboardClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> I) setImage_ (self & pixbuf)
    fun setText self (text, len) =
      (
        GtkClipboardClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun store self = (GtkClipboardClass.FFI.withPtr ---> I) store_ self
    fun waitForContents self target = (GtkClipboardClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> GtkSelectionDataRecord.FFI.fromOptPtr true) waitForContents_ (self & target)
    fun waitForImage self = (GtkClipboardClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) waitForImage_ self
    fun waitForRichText self buffer =
      let
        val format
         & length
         & retVal =
          (
            GtkClipboardClass.FFI.withPtr
             &&&> GtkTextBufferClass.FFI.withPtr
             &&&> GdkAtomRecord.FFI.withRefOptPtr
             &&&> GSize.FFI.withRefVal
             ---> GdkAtomRecord.FFI.fromPtr false
                   && GSize.FFI.fromVal
                   && GUInt8CArrayN.FFI.fromOptPtr 1
          )
            waitForRichText_
            (
              self
               & buffer
               & NONE
               & GSize.null
            )
      in
        (retVal (LargeInt.toInt length), format)
      end
    fun waitForTargets self =
      let
        val targets
         & nTargets
         & retVal =
          (
            GtkClipboardClass.FFI.withPtr
             &&&> GdkAtomRecordCArrayN.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             ---> GdkAtomRecordCArrayN.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            waitForTargets_
            (
              self
               & NONE
               & GInt.null
            )
      in
        if retVal then SOME (targets (LargeInt.toInt nTargets)) else NONE
      end
    fun waitForText self = (GtkClipboardClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) waitForText_ self
    fun waitForUris self = (GtkClipboardClass.FFI.withPtr ---> Utf8CArray.FFI.fromOptPtr 2) waitForUris_ self
    fun waitIsImageAvailable self = (GtkClipboardClass.FFI.withPtr ---> GBool.FFI.fromVal) waitIsImageAvailable_ self
    fun waitIsRichTextAvailable self buffer = (GtkClipboardClass.FFI.withPtr &&&> GtkTextBufferClass.FFI.withPtr ---> GBool.FFI.fromVal) waitIsRichTextAvailable_ (self & buffer)
    fun waitIsTargetAvailable self target = (GtkClipboardClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> GBool.FFI.fromVal) waitIsTargetAvailable_ (self & target)
    fun waitIsTextAvailable self = (GtkClipboardClass.FFI.withPtr ---> GBool.FFI.fromVal) waitIsTextAvailable_ self
    fun waitIsUrisAvailable self = (GtkClipboardClass.FFI.withPtr ---> GBool.FFI.fromVal) waitIsUrisAvailable_ self
    local
      open ClosureMarshal Signal
    in
      fun ownerChangeSig f = signal "owner-change" (get 0w1 GdkEventOwnerChangeRecord.t ---> ret_void) f
    end
  end
