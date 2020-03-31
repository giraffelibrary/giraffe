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
      val getType_ = call (getSymbol "gdk_pixbuf_loader_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gdk_pixbuf_loader_new") (cVoid --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithMimeType_ = call (getSymbol "gdk_pixbuf_loader_new_with_mime_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val newWithType_ = call (getSymbol "gdk_pixbuf_loader_new_with_type") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufLoaderClass.PolyML.cPtr)
      val close_ = call (getSymbol "gdk_pixbuf_loader_close") (GdkPixbufPixbufLoaderClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val getAnimation_ = call (getSymbol "gdk_pixbuf_loader_get_animation") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufAnimationClass.PolyML.cPtr)
      val getFormat_ = call (getSymbol "gdk_pixbuf_loader_get_format") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufFormatRecord.PolyML.cOptPtr)
      val getPixbuf_ = call (getSymbol "gdk_pixbuf_loader_get_pixbuf") (GdkPixbufPixbufLoaderClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val setSize_ =
        call (getSymbol "gdk_pixbuf_loader_set_size")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val write_ =
        call (getSymbol "gdk_pixbuf_loader_write")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val writeBytes_ =
        call (getSymbol "gdk_pixbuf_loader_write_bytes")
          (
            GdkPixbufPixbufLoaderClass.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
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
    fun close self = (GdkPixbufPixbufLoaderClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) close_ (self & [])
    fun getAnimation self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufAnimationClass.FFI.fromPtr false) getAnimation_ self
    fun getFormat self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufFormatRecord.FFI.fromOptPtr false) getFormat_ self
    fun getPixbuf self = (GdkPixbufPixbufLoaderClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun setSize self (width, height) =
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
        val count = GUInt8CArrayN.length buf
        val () =
          (
            GdkPixbufPixbufLoaderClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> ignore
          )
            write_
            (
              self
               & buf
               & count
               & []
            )
      in
        ()
      end
    fun writeBytes self buffer =
      (
        GdkPixbufPixbufLoaderClass.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        writeBytes_
        (
          self
           & buffer
           & []
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
                f
                  (
                    x,
                    y,
                    width,
                    height
                  )
          )
      fun closedSig f = signal "closed" (void ---> ret_void) f
      fun sizePreparedSig f = signal "size-prepared" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn width & height => f (width, height))
    end
  end
