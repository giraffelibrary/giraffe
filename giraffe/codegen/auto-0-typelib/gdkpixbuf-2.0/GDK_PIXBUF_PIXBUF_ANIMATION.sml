signature GDK_PIXBUF_PIXBUF_ANIMATION =
  sig
    type 'a class_t
    type 'a pixbufanimationiterclass_t
    type 'a pixbufclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val newFromFile : string -> base class_t
    val getHeight : 'a class_t -> LargeInt.int
    val getIter :
      'a class_t
       -> GLib.TimeValRecord.t
       -> base pixbufanimationiterclass_t
    val getStaticImage : 'a class_t -> base pixbufclass_t
    val getWidth : 'a class_t -> LargeInt.int
    val isStaticImage : 'a class_t -> bool
  end
