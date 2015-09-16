signature GDK_PIXBUF_PIXBUF_ANIMATION_ITER =
  sig
    type 'a class_t
    type 'a pixbuf_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val advance :
      'a class_t
       -> GLib.TimeValRecord.t
       -> bool
    val getDelayTime : 'a class_t -> LargeInt.int
    val getPixbuf : 'a class_t -> base pixbuf_class_t
    val onCurrentlyLoadingFrame : 'a class_t -> bool
  end
