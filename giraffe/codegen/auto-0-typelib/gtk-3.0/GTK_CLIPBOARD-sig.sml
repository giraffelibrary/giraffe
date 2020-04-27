signature GTK_CLIPBOARD =
  sig
    type 'a class
    type target_entry_record_c_array_n_t
    type selection_data_t
    type 'a text_buffer_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val get : Gdk.AtomRecord.t -> base class
    val getDefault : 'a Gdk.DisplayClass.class -> base class
    val getForDisplay : 'a Gdk.DisplayClass.class * Gdk.AtomRecord.t -> base class
    val clear : 'a class -> unit
    val getDisplay : 'a class -> base Gdk.DisplayClass.class
    val getOwner : 'a class -> base GObject.ObjectClass.class option
    val setCanStore :
      'a class
       -> target_entry_record_c_array_n_t option
       -> unit
    val setImage :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val store : 'a class -> unit
    val waitForContents :
      'a class
       -> Gdk.AtomRecord.t
       -> selection_data_t option
    val waitForImage : 'a class -> base GdkPixbuf.PixbufClass.class option
    val waitForRichText :
      'a class
       -> 'b text_buffer_class
       -> GUInt8CArrayN.t option * Gdk.AtomRecord.t
    val waitForTargets : 'a class -> GdkAtomRecordCPtrArrayN.t option
    val waitForText : 'a class -> string option
    val waitForUris : 'a class -> Utf8CPtrArray.t option
    val waitIsImageAvailable : 'a class -> bool
    val waitIsRichTextAvailable :
      'a class
       -> 'b text_buffer_class
       -> bool
    val waitIsTargetAvailable :
      'a class
       -> Gdk.AtomRecord.t
       -> bool
    val waitIsTextAvailable : 'a class -> bool
    val waitIsUrisAvailable : 'a class -> bool
    val ownerChangeSig : (Gdk.EventOwnerChangeRecord.t -> unit) -> 'a class Signal.t
  end
