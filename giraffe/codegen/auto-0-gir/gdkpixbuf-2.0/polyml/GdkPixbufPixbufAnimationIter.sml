structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val advance_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_advance") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr &&> GLibTimeValRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDelayTime_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_delay_time") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPixbuf_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_pixbuf") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val onCurrentlyLoadingFrame_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_on_currently_loading_frame") (GdkPixbufPixbufAnimationIterClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GdkPixbufPixbufAnimationIterClass.class
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun advance self currentTime = (GdkPixbufPixbufAnimationIterClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> FFI.Int.C.fromVal) getDelayTime_ self
    fun getPixbuf self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GdkPixbufPixbufAnimationIterClass.C.withPtr ---> FFI.Bool.C.fromVal) onCurrentlyLoadingFrame_ self
  end
