structure GdkPixbufPixbufLoader :>
  GDK_PIXBUF_PIXBUF_LOADER
    where type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_loader_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gdk_pixbuf_loader_new" : unit -> GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p;
    val newWithMimeType_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_loader_new_with_mime_type" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithType_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_loader_new_with_type" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val close_ = fn x1 & x2 => (_import "gdk_pixbuf_loader_close" : GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val getAnimation_ = _import "gdk_pixbuf_loader_get_animation" : GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p -> GdkPixbufPixbufAnimationClass.FFI.notnull GdkPixbufPixbufAnimationClass.FFI.p;
    val getFormat_ = _import "gdk_pixbuf_loader_get_format" : GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p -> unit GdkPixbufPixbufFormatRecord.FFI.p;
    val getPixbuf_ = _import "gdk_pixbuf_loader_get_pixbuf" : GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_loader_set_size" :
              GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val write_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gdk_pixbuf_loader_write" :
              GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val writeBytes_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_loader_write_bytes" :
              GdkPixbufPixbufLoaderClass.FFI.notnull GdkPixbufPixbufLoaderClass.FFI.p
               * GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        val count = LargeInt.fromInt (GUInt8CArrayN.length buf)
        val () =
          (
            GdkPixbufPixbufLoaderClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
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
