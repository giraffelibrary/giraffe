signature GTK_ICON_SET =
  sig
    type record_t
    type 'a stylecontextclass_t
    type iconsourcerecord_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val newFromPixbuf : 'a GdkPixbuf.PixbufClass.t -> record_t
    val addSource :
      record_t
       -> iconsourcerecord_t
       -> unit
    val copy : record_t -> record_t
    val renderIconPixbuf :
      record_t
       -> 'a stylecontextclass_t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
  end
