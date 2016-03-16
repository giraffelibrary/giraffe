structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    where type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newFromFile_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val getHeight_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getIter_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_iter") (GObjectObjectClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStaticImage_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_static_image") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getWidth_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val isStaticImage_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_is_static_image") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufAnimationClass.C.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getIter self startTime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> GdkPixbufPixbufAnimationIterClass.C.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getStaticImage_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun isStaticImage self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isStaticImage_ self
  end
