signature GTK_CLIPBOARD =
  sig
    type 'a class_t
    type selection_data_record_t
    type 'a text_buffer_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val get : Gdk.AtomRecord.t -> base class_t
    val getForDisplay :
      'a Gdk.DisplayClass.t
       -> Gdk.AtomRecord.t
       -> base class_t
    val clear : 'a class_t -> unit
    val getDisplay : 'a class_t -> base Gdk.DisplayClass.t
    val getOwner : 'a class_t -> base GObject.ObjectClass.t
    val setImage :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t
       -> unit
    val setText :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val store : 'a class_t -> unit
    val waitForContents :
      'a class_t
       -> Gdk.AtomRecord.t
       -> selection_data_record_t
    val waitForImage : 'a class_t -> base GdkPixbuf.PixbufClass.t
    val waitForText : 'a class_t -> string
    val waitIsImageAvailable : 'a class_t -> bool
    val waitIsRichTextAvailable :
      'a class_t
       -> 'b text_buffer_class_t
       -> bool
    val waitIsTargetAvailable :
      'a class_t
       -> Gdk.AtomRecord.t
       -> bool
    val waitIsTextAvailable : 'a class_t -> bool
    val waitIsUrisAvailable : 'a class_t -> bool
    val ownerChangeSig : (Gdk.EventOwnerChangeRecord.t -> unit) -> 'a class_t Signal.signal
  end
