structure GdkPixbufPixbufLoader :>
  GDK_PIXBUF_PIXBUF_LOADER
    where type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_loader_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gdk_pixbuf_loader_new") (PolyMLFFI.cVoid --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithMimeType_ = call (getSymbol "gdk_pixbuf_loader_new_with_mime_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithType_ = call (getSymbol "gdk_pixbuf_loader_new_with_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val close_ = call (getSymbol "gdk_pixbuf_loader_close") (GdkPixbufPixbufLoaderClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val getAnimation_ = call (getSymbol "gdk_pixbuf_loader_get_animation") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufAnimationClass.PolyML.cPtr)
      val getFormat_ = call (getSymbol "gdk_pixbuf_loader_get_format") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufFormatRecord.PolyML.cPtr)
      val getPixbuf_ = call (getSymbol "gdk_pixbuf_loader_get_pixbuf") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val setSize_ =
        call (getSymbol "gdk_pixbuf_loader_set_size")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val write_ =
        call (getSymbol "gdk_pixbuf_loader_write")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GdkPixbufPixbufLoaderClass.FFI.fromPtr true) new_ ()
    fun newWithMimeType mimeType = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.FFI.fromPtr true) newWithMimeType_ (mimeType & [])
    fun newWithType imageType = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.FFI.fromPtr true) newWithType_ (imageType & [])
    fun close self = (GdkPixbufPixbufLoaderClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) close_ (self & [])
    fun getAnimation self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufAnimationClass.FFI.fromPtr false) getAnimation_ self
    fun getFormat self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufFormatRecord.FFI.fromPtr true) getFormat_ self
    fun getPixbuf self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun setSize self width height =
      (
        GdkPixbufPixbufLoaderClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
        )
    fun write self buf =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buf)
        val retVal =
          (
            GdkPixbufPixbufLoaderClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal
          )
            write_
            (
              self
               & buf
               & count
               & []
            )
      in
        retVal
      end
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
