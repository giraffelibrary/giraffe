structure GdkPixbufPixbufLoader :>
  GDK_PIXBUF_PIXBUF_LOADER
    where type 'a class = 'a GdkPixbufPixbufLoaderClass.class
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type 'a pixbuf_class = 'a GdkPixbufPixbufClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_loader_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gdk_pixbuf_loader_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMimeType_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_loader_new_with_mime_type" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val close_ = fn x1 & x2 => (_import "gdk_pixbuf_loader_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val getAnimation_ = _import "gdk_pixbuf_loader_get_animation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFormat_ = _import "gdk_pixbuf_loader_get_format" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p;
    val getPixbuf_ = _import "gdk_pixbuf_loader_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_loader_set_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) new_ ()
    fun newWithMimeType mimeType = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithMimeType_ (mimeType & [])
    fun newWithType imageType = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufLoaderClass.C.fromPtr true) newWithType_ (imageType & [])
    fun close self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) close_ (self & [])
    fun getAnimation self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufAnimationClass.C.fromPtr false) getAnimation_ self
    fun getFormat self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufFormatRecord.C.fromPtr true) getFormat_ self
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun setSize self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
