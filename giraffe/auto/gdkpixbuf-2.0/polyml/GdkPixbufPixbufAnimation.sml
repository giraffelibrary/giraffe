structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    where type 'a pixbufanimationiterclass_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFromFile_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_new_from_file") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val getHeight_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getIter_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_iter") (GObjectObjectClass.PolyML.PTR &&> GLibTimeValRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getStaticImage_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_static_image") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getWidth_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val isStaticImage_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_is_static_image") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GdkPixbufPixbufAnimationClass.t
    type 'a pixbufanimationiterclass_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromFile filename = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufAnimationClass.C.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getIter self startTime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> GdkPixbufPixbufAnimationIterClass.C.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getStaticImage_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun isStaticImage self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isStaticImage_ self
  end
