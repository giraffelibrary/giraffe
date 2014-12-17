signature GTK_SELECTION_DATA =
  sig
    type record_t
    type 'a textbufferclass_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val getDataType : record_t -> Gdk.AtomRecord.t
    val getDisplay : record_t -> base Gdk.DisplayClass.t
    val getFormat : record_t -> LargeInt.int
    val getLength : record_t -> LargeInt.int
    val getPixbuf : record_t -> base GdkPixbuf.PixbufClass.t
    val getSelection : record_t -> Gdk.AtomRecord.t
    val getTarget : record_t -> Gdk.AtomRecord.t
    val getText : record_t -> string
    val setPixbuf :
      record_t
       -> 'a GdkPixbuf.PixbufClass.t
       -> bool
    val setText :
      record_t
       -> string
       -> LargeInt.int
       -> bool
    val targetsIncludeImage :
      record_t
       -> bool
       -> bool
    val targetsIncludeRichText :
      record_t
       -> 'a textbufferclass_t
       -> bool
    val targetsIncludeText : record_t -> bool
    val targetsIncludeUri : record_t -> bool
  end
