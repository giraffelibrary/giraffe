structure GdkPixbufPixbufAnimation :>
  GDK_PIXBUF_PIXBUF_ANIMATION
    where type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    where type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_animation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFromFile_ = call (getSymbol "gdk_pixbuf_animation_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufAnimationClass.PolyML.cPtr)
      val getHeight_ = call (getSymbol "gdk_pixbuf_animation_get_height") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIter_ = call (getSymbol "gdk_pixbuf_animation_get_iter") (GdkPixbufPixbufAnimationClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> GdkPixbufPixbufAnimationIterClass.PolyML.cPtr)
      val getStaticImage_ = call (getSymbol "gdk_pixbuf_animation_get_static_image") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getWidth_ = call (getSymbol "gdk_pixbuf_animation_get_width") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val isStaticImage_ = call (getSymbol "gdk_pixbuf_animation_is_static_image") (GdkPixbufPixbufAnimationClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GdkPixbufPixbufAnimationClass.class
    type 'a pixbuf_animation_iter_class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromFile filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufAnimationClass.FFI.fromPtr true) newFromFile_ (filename & [])
    fun getHeight self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getIter self startTime = (GdkPixbufPixbufAnimationClass.FFI.withPtr &&&> GLibTimeValRecord.FFI.withPtr ---> GdkPixbufPixbufAnimationIterClass.FFI.fromPtr true) getIter_ (self & startTime)
    fun getStaticImage self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getStaticImage_ self
    fun getWidth self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun isStaticImage self = (GdkPixbufPixbufAnimationClass.FFI.withPtr ---> GBool.FFI.fromVal) isStaticImage_ self
  end
