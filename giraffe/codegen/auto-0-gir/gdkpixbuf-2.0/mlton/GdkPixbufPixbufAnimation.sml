structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    where type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t =
  struct
    val getType_ = _import "gdk_pixbuf_animation_get_type" : unit -> GObjectType.C.val_;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_animation_new_from_file" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getHeight_ = _import "gdk_pixbuf_animation_get_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getIter_ = fn x1 & x2 => (_import "gdk_pixbuf_animation_get_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getStaticImage_ = _import "gdk_pixbuf_animation_get_static_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getWidth_ = _import "gdk_pixbuf_animation_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val isStaticImage_ = _import "gdk_pixbuf_animation_is_static_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile filename = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufAnimationClass.C.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getIter self startTime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> GdkPixbufPixbufAnimationIterClass.C.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getStaticImage_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun isStaticImage self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isStaticImage_ self
  end
