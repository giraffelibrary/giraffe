structure GtkClipboard :>
  GTK_CLIPBOARD
    where type 'a class = 'a GtkClipboardClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_clipboard_get_type" : unit -> GObjectType.C.val_;
    val get_ = _import "gtk_clipboard_get" : GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getForDisplay_ = fn x1 & x2 => (_import "gtk_clipboard_get_for_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val clear_ = _import "gtk_clipboard_clear" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getDisplay_ = _import "gtk_clipboard_get_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getOwner_ = _import "gtk_clipboard_get_owner" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setImage_ = fn x1 & x2 => (_import "gtk_clipboard_set_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_clipboard_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val store_ = _import "gtk_clipboard_store" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val waitForContents_ = fn x1 & x2 => (_import "gtk_clipboard_wait_for_contents" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p;) (x1, x2)
    val waitForImage_ = _import "gtk_clipboard_wait_for_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val waitForText_ = _import "gtk_clipboard_wait_for_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val waitIsImageAvailable_ = _import "gtk_clipboard_wait_is_image_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val waitIsRichTextAvailable_ = fn x1 & x2 => (_import "gtk_clipboard_wait_is_rich_text_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val waitIsTargetAvailable_ = fn x1 & x2 => (_import "gtk_clipboard_wait_is_target_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val waitIsTextAvailable_ = _import "gtk_clipboard_wait_is_text_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val waitIsUrisAvailable_ = _import "gtk_clipboard_wait_is_uris_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GtkClipboardClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
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
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
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
    fun waitForText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) waitForText_ self
    fun waitIsImageAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) waitIsImageAvailable_ self
    fun waitIsRichTextAvailable self buffer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) waitIsRichTextAvailable_ (self & buffer)
    fun waitIsTargetAvailable self target = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.C.fromVal) waitIsTargetAvailable_ (self & target)
    fun waitIsTextAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) waitIsTextAvailable_ self
    fun waitIsUrisAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) waitIsUrisAvailable_ self
    local
      open ClosureMarshal Signal
    in
      fun ownerChangeSig f = signal "owner-change" (get 0w1 GdkEventOwnerChangeRecord.t ---> ret_void) f
    end
  end
