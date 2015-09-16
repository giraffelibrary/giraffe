structure GdkPixbufPixbufAnimationIter :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER
    where type 'a class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val advance_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_advance") (GObjectObjectClass.PolyML.PTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDelayTime_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_delay_time") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPixbuf_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_get_pixbuf") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val onCurrentlyLoadingFrame_ = call (load_sym libgdkpixbuf "gdk_pixbuf_animation_iter_on_currently_loading_frame") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a pixbuf_class_t = 'a GdkPixbufPixbufClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun advance self currentTime = (GObjectObjectClass.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) advance_ (self & currentTime)
    fun getDelayTime self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getDelayTime_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun onCurrentlyLoadingFrame self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) onCurrentlyLoadingFrame_ self
  end
