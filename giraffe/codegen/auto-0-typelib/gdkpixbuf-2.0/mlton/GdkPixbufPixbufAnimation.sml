structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    where type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_animation_get_type" : unit -> GObjectType.C.val_;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_animation_new_from_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getHeight_ = _import "gdk_pixbuf_animation_get_height" : GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p -> FFI.Int32.C.val_;
    val getIter_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_get_iter" : GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> GdkPixbufPixbufAnimationIterClass.C.notnull GdkPixbufPixbufAnimationIterClass.C.p;) (x1, x2)
    val getStaticImage_ = _import "gdk_pixbuf_animation_get_static_image" : GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val getWidth_ = _import "gdk_pixbuf_animation_get_width" : GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p -> FFI.Int32.C.val_;
    val isStaticImage_ = _import "gdk_pixbuf_animation_is_static_image" : GdkPixbufPixbufAnimationClass.C.notnull GdkPixbufPixbufAnimationClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufAnimationClass.C.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GdkPixbufPixbufAnimationClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getIter self startTime = (GdkPixbufPixbufAnimationClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> GdkPixbufPixbufAnimationIterClass.C.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GdkPixbufPixbufAnimationClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getStaticImage_ self
    fun getWidth self = (GdkPixbufPixbufAnimationClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun isStaticImage self = (GdkPixbufPixbufAnimationClass.C.withPtr ---> FFI.Bool.C.fromVal) isStaticImage_ self
  end
