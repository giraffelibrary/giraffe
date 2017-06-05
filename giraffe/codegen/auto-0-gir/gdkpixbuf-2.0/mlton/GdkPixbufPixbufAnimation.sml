structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    where type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_animation_get_type" : unit -> GObjectType.FFI.val_;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_animation_new_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getHeight_ = _import "gdk_pixbuf_animation_get_height" : GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p -> GInt.FFI.val_;
    val getIter_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_get_iter" : GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p * GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> GdkPixbufPixbufAnimationIterClass.FFI.notnull GdkPixbufPixbufAnimationIterClass.FFI.p;) (x1, x2)
    val getStaticImage_ = _import "gdk_pixbuf_animation_get_static_image" : GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getWidth_ = _import "gdk_pixbuf_animation_get_width" : GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p -> GInt.FFI.val_;
    val isStaticImage_ = _import "gdk_pixbuf_animation_is_static_image" : GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromFile filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufAnimationClass.FFI.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GInt.FFI.fromVal) getHeight_ self
    fun getIter self startTime = (GdkPixbufPixbufAnimationClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GdkPixbufPixbufAnimationIterClass.FFI.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getStaticImage_ self
    fun getWidth self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidth_ self
    fun isStaticImage self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GBool.FFI.fromVal) isStaticImage_ self
  end
