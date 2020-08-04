structure GtkClipboard :>
  GTK_CLIPBOARD
    where type 'a class = 'a GtkClipboardClass.class
    where type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    where type selection_data_t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_clipboard_get_type" : unit -> GObjectType.FFI.val_;
    val get_ = _import "gtk_clipboard_get" : GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p;
    val getDefault_ = _import "gtk_clipboard_get_default" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p;
    val getForDisplay_ = fn x1 & x2 => (_import "gtk_clipboard_get_for_display" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p;) (x1, x2)
    val clear_ = _import "gtk_clipboard_clear" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> unit;
    val getDisplay_ = _import "gtk_clipboard_get_display" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p;
    val getOwner_ = _import "gtk_clipboard_get_owner" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p;
    val setCanStore_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_clipboard_set_can_store" :
              GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p
               * GtkTargetEntryRecordCArrayN.MLton.p1
               * GtkTargetEntryRecordCArrayN.FFI.opt GtkTargetEntryRecordCArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setImage_ = fn x1 & x2 => (_import "gtk_clipboard_set_image" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_clipboard_set_text" :
              GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val store_ = _import "gtk_clipboard_store" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> unit;
    val waitForContents_ = fn x1 & x2 => (_import "gtk_clipboard_wait_for_contents" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GtkSelectionDataRecord.FFI.opt GtkSelectionDataRecord.FFI.p;) (x1, x2)
    val waitForImage_ = _import "gtk_clipboard_wait_for_image" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val waitForRichText_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_clipboard_wait_for_rich_text" :
              GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p
               * GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p
               * (GdkAtomRecord.FFI.opt, GdkAtomRecord.FFI.non_opt) GdkAtomRecord.FFI.r
               * GUInt64.FFI.ref_
               -> GUInt8CArrayN.FFI.opt GUInt8CArrayN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val waitForTargets_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_clipboard_wait_for_targets" :
              GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p
               * GdkAtomRecordCPtrArrayN.MLton.r1
               * (GdkAtomRecordCPtrArrayN.FFI.opt, GdkAtomRecordCPtrArrayN.FFI.non_opt) GdkAtomRecordCPtrArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val waitForText_ = _import "gtk_clipboard_wait_for_text" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val waitForUris_ = _import "gtk_clipboard_wait_for_uris" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> Utf8CPtrArray.FFI.opt Utf8CPtrArray.FFI.out_p;
    val waitIsImageAvailable_ = _import "gtk_clipboard_wait_is_image_available" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GBool.FFI.val_;
    val waitIsRichTextAvailable_ = fn x1 & x2 => (_import "gtk_clipboard_wait_is_rich_text_available" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p * GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val waitIsTargetAvailable_ = fn x1 & x2 => (_import "gtk_clipboard_wait_is_target_available" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val waitIsTextAvailable_ = _import "gtk_clipboard_wait_is_text_available" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GBool.FFI.val_;
    val waitIsUrisAvailable_ = _import "gtk_clipboard_wait_is_uris_available" : GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GtkClipboardClass.class
    type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    type selection_data_t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun get selection = (GdkAtomRecord.FFI.withPtr false ---> GtkClipboardClass.FFI.fromPtr false) get_ selection
    fun getDefault display = (GdkDisplayClass.FFI.withPtr false ---> GtkClipboardClass.FFI.fromPtr false) getDefault_ display
    fun getForDisplay (display, selection) = (GdkDisplayClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GtkClipboardClass.FFI.fromPtr false) getForDisplay_ (display & selection)
    fun clear self = (GtkClipboardClass.FFI.withPtr false ---> I) clear_ self
    fun getDisplay self = (GtkClipboardClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getOwner self = (GtkClipboardClass.FFI.withPtr false ---> GObjectObjectClass.FFI.fromOptPtr false) getOwner_ self
    fun setCanStore self targets =
      let
        val nTargets =
          case targets of
            SOME targets => LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
          | NONE => GInt32.null
        val () =
          (
            GtkClipboardClass.FFI.withPtr false
             &&&> GtkTargetEntryRecordCArrayN.FFI.withOptPtr 0
             &&&> GInt32.FFI.withVal
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
    fun setImage self pixbuf = (GtkClipboardClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) setImage_ (self & pixbuf)
    fun setText self (text, len) =
      (
        GtkClipboardClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & len
        )
    fun store self = (GtkClipboardClass.FFI.withPtr false ---> I) store_ self
    fun waitForContents self target = (GtkClipboardClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GtkSelectionDataRecord.FFI.fromOptPtr true) waitForContents_ (self & target)
    fun waitForImage self = (GtkClipboardClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) waitForImage_ self
    fun waitForRichText self buffer =
      let
        val format
         & length
         & retVal =
          (
            GtkClipboardClass.FFI.withPtr false
             &&&> GtkTextBufferClass.FFI.withPtr false
             &&&> GdkAtomRecord.FFI.withRefOptPtr false
             &&&> GUInt64.FFI.withRefVal
             ---> GdkAtomRecord.FFI.fromPtr false
                   && GUInt64.FFI.fromVal
                   && GUInt8CArrayN.FFI.fromOptPtr ~1
          )
            waitForRichText_
            (
              self
               & buffer
               & NONE
               & GUInt64.null
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
            GtkClipboardClass.FFI.withPtr false
             &&&> GdkAtomRecordCPtrArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GdkAtomRecordCPtrArrayN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            waitForTargets_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (targets (LargeInt.toInt nTargets)) else NONE
      end
    fun waitForText self = (GtkClipboardClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) waitForText_ self
    fun waitForUris self = (GtkClipboardClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromOptPtr ~1) waitForUris_ self
    fun waitIsImageAvailable self = (GtkClipboardClass.FFI.withPtr false ---> GBool.FFI.fromVal) waitIsImageAvailable_ self
    fun waitIsRichTextAvailable self buffer = (GtkClipboardClass.FFI.withPtr false &&&> GtkTextBufferClass.FFI.withPtr false ---> GBool.FFI.fromVal) waitIsRichTextAvailable_ (self & buffer)
    fun waitIsTargetAvailable self target = (GtkClipboardClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GBool.FFI.fromVal) waitIsTargetAvailable_ (self & target)
    fun waitIsTextAvailable self = (GtkClipboardClass.FFI.withPtr false ---> GBool.FFI.fromVal) waitIsTextAvailable_ self
    fun waitIsUrisAvailable self = (GtkClipboardClass.FFI.withPtr false ---> GBool.FFI.fromVal) waitIsUrisAvailable_ self
    local
      open ClosureMarshal Signal
    in
      fun ownerChangeSig f = signal "owner-change" (get 0w1 GdkEventOwnerChangeRecord.t ---> ret_void) f
    end
  end
