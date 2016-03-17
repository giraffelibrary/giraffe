signature GTK_SELECTION_DATA =
  sig
    type t
    type 'a text_buffer_class
    val getType : unit -> GObject.Type.t
    val copy : t -> t
    val getDataType : t -> Gdk.AtomRecord.t
    val getDisplay : t -> base Gdk.DisplayClass.class
    val getFormat : t -> LargeInt.int
    val getLength : t -> LargeInt.int
    val getPixbuf : t -> base GdkPixbuf.PixbufClass.class
    val getSelection : t -> Gdk.AtomRecord.t
    val getTarget : t -> Gdk.AtomRecord.t
    val getText : t -> string
    val setPixbuf :
      t
       -> 'a GdkPixbuf.PixbufClass.class
       -> bool
    val setText :
      t
       -> string
       -> LargeInt.int
       -> bool
    val targetsIncludeImage :
      t
       -> bool
       -> bool
    val targetsIncludeRichText :
      t
       -> 'a text_buffer_class
       -> bool
    val targetsIncludeText : t -> bool
    val targetsIncludeUri : t -> bool
  end
