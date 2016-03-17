signature GDK_PIXBUF_PIXBUF_ANIMATION_ITER =
  sig
    type 'a class
    type 'a pixbuf_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val advance :
      'a class
       -> GLib.TimeValRecord.t
       -> bool
    val getDelayTime : 'a class -> LargeInt.int
    val getPixbuf : 'a class -> base pixbuf_class
    val onCurrentlyLoadingFrame : 'a class -> bool
  end
