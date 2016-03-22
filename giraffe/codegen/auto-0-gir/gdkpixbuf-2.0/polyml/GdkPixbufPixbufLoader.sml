structure GdkPixbufPixbufLoader :>
  GDK_PIXBUF_PIXBUF_LOADER
    where type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new") (FFI.PolyML.cVoid --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithMimeType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new_with_mime_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new_with_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val close_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_close") (GdkPixbufPixbufLoaderClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val getAnimation_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_animation") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufAnimationClass.PolyML.cPtr)
      val getFormat_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_format") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufFormatRecord.PolyML.cPtr)
      val getPixbuf_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_pixbuf") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val setSize_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_loader_set_size")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) new_ ()
    fun newWithMimeType mimeType = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithMimeType_ (mimeType & [])
    fun newWithType imageType = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithType_ (imageType & [])
    fun close self = (GdkPixbufPixbufLoaderClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun getAnimation self = (GdkPixbufPixbufLoaderClass.C.withPtr ---> GdkPixbufPixbufAnimationClass.C.fromPtr false) getAnimation_ self
    fun getFormat self = (GdkPixbufPixbufLoaderClass.C.withPtr ---> GdkPixbufPixbufFormatRecord.C.fromPtr true) getFormat_ self
    fun getPixbuf self = (GdkPixbufPixbufLoaderClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun setSize self width height =
      (
        GdkPixbufPixbufLoaderClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    local
      open ClosureMarshal Signal
    in
      fun areaPreparedSig f = signal "area-prepared" (void ---> ret_void) f
      fun areaUpdatedSig f =
        signal "area-updated"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 int
             &&&> get 0w4 int
             ---> ret_void
          )
          (
            fn
              x
               & y
               & width
               & height =>
                f x y width height
          )
      fun closedSig f = signal "closed" (void ---> ret_void) f
      fun sizePreparedSig f = signal "size-prepared" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn width & height => f width height)
    end
  end
