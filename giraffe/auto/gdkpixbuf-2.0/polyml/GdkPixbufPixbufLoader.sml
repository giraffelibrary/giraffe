structure GdkPixbufPixbufLoader :>
  GDK_PIXBUF_PIXBUF_LOADER
    where type 'a class_t = 'a GdkPixbufPixbufLoaderClass.t
    where type 'a pixbufanimationclass_t = 'a GdkPixbufPixbufAnimationClass.t
    where type pixbufformatrecord_t = GdkPixbufPixbufFormatRecord.t
    where type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithMimeType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new_with_mime_type") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newWithType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_new_with_type") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val close_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_close") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val getAnimation_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_animation") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFormat_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_format") (GObjectObjectClass.PolyML.PTR --> GdkPixbufPixbufFormatRecord.PolyML.PTR)
      val getPixbuf_ = call (load_sym libgdkpixbuf "gdk_pixbuf_loader_get_pixbuf") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setSize_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_loader_set_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GdkPixbufPixbufLoaderClass.t
    type 'a pixbufanimationclass_t = 'a GdkPixbufPixbufAnimationClass.t
    type pixbufformatrecord_t = GdkPixbufPixbufFormatRecord.t
    type 'a pixbufclass_t = 'a GdkPixbufPixbufClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) new_ ()
    fun newWithMimeType mimeType = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithMimeType_ (mimeType & [])
    fun newWithType imageType = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithType_ (imageType & [])
    fun close self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun getAnimation self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufAnimationClass.C.fromPtr false) getAnimation_ self
    fun getFormat self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufFormatRecord.C.fromPtr true) getFormat_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun setSize self width height =
      (
        GObjectObjectClass.C.withPtr
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