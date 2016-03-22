structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class = 'a GdkPixbufPixbufClass.class
    where type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    where type interp_type_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    val getType_ = _import "gdk_pixbuf_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new" :
              GdkPixbufColorspace.C.val_
               * FFI.Bool.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromFileAtScale_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file_at_scale" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromFileAtSize_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5 =>
          (
            _import "mlton_gdk_pixbuf_new_from_file_at_size" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val newFromStream_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_pixbuf_new_from_stream" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromStreamAtScale_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gdk_pixbuf_new_from_stream_at_scale" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_new_from_stream_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;) (x1, x2)
    val newFromXpmData_ = _import "mlton_gdk_pixbuf_new_from_xpm_data" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val gettext_ = _import "mlton_gdk_pixbuf_gettext" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> Utf8.C.notnull Utf8.C.out_p;
    val saveToStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_save_to_stream_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val addAlpha_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_add_alpha" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Bool.C.val_
               * FFI.UInt8.C.val_
               * FFI.UInt8.C.val_
               * FFI.UInt8.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val applyEmbeddedOrientation_ = _import "gdk_pixbuf_apply_embedded_orientation" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val composite_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12 =>
          (
            _import "gdk_pixbuf_composite" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12
            )
    val compositeColor_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15
         & x16
         & x17 =>
          (
            _import "gdk_pixbuf_composite_color" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13,
              x14,
              x15,
              x16,
              x17
            )
    val compositeColorSimple_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gdk_pixbuf_composite_color_simple" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val copy_ = _import "gdk_pixbuf_copy" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
    val copyArea_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gdk_pixbuf_copy_area" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val fill_ = fn x1 & x2 => (_import "gdk_pixbuf_fill" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val flip_ = fn x1 & x2 => (_import "gdk_pixbuf_flip" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p * FFI.Bool.C.val_ -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;) (x1, x2)
    val getBitsPerSample_ = _import "gdk_pixbuf_get_bits_per_sample" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Int.C.val_;
    val getColorspace_ = _import "gdk_pixbuf_get_colorspace" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> GdkPixbufColorspace.C.val_;
    val getHasAlpha_ = _import "gdk_pixbuf_get_has_alpha" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Bool.C.val_;
    val getHeight_ = _import "gdk_pixbuf_get_height" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Int.C.val_;
    val getNChannels_ = _import "gdk_pixbuf_get_n_channels" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Int.C.val_;
    val getOption_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_get_option" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowstride_ = _import "gdk_pixbuf_get_rowstride" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Int.C.val_;
    val getWidth_ = _import "gdk_pixbuf_get_width" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> FFI.Int.C.val_;
    val newSubpixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new_subpixbuf" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val rotateSimple_ = fn x1 & x2 => (_import "gdk_pixbuf_rotate_simple" : GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p * GdkPixbufPixbufRotation.C.val_ -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;) (x1, x2)
    val saturateAndPixelate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_saturate_and_pixelate" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Float.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val scale_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "gdk_pixbuf_scale" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * GdkPixbufInterpType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val scaleSimple_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_scale_simple" :
              GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * GdkPixbufInterpType.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GdkPixbufPixbufClass.class
    type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    type interp_type_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new colorspace hasAlpha bitsPerSample width height =
      (
        GdkPixbufColorspace.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        new_
        (
          colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
        )
    fun newFromFile filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale filename width height preserveAspectRatio =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        newFromFileAtScale_
        (
          filename
           & width
           & height
           & preserveAspectRatio
           & []
        )
    fun newFromFileAtSize filename width height =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        newFromFileAtSize_
        (
          filename
           & width
           & height
           & []
        )
    fun newFromStream stream cancellable =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        newFromStream_
        (
          stream
           & cancellable
           & []
        )
    fun newFromStreamAtScale stream width height preserveAspectRatio cancellable =
      (
        GioInputStreamClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        newFromStreamAtScale_
        (
          stream
           & width
           & height
           & preserveAspectRatio
           & cancellable
           & []
        )
    fun newFromStreamFinish asyncResult = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (Utf8.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) newFromXpmData_ data
    fun gettext msgid = (Utf8.C.withPtr ---> Utf8.C.fromPtr false) gettext_ msgid
    fun saveToStreamFinish asyncResult = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha self substituteColor r g b =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt8.C.withVal
         &&&> FFI.UInt8.C.withVal
         &&&> FFI.UInt8.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        addAlpha_
        (
          self
           & substituteColor
           & r
           & g
           & b
        )
    fun applyEmbeddedOrientation self = (GdkPixbufPixbufClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) applyEmbeddedOrientation_ self
    fun composite self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType overallAlpha =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        composite_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
           & overallAlpha
        )
    fun compositeColor self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType overallAlpha checkX checkY checkSize color1 color2 =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        compositeColor_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
           & overallAlpha
           & checkX
           & checkY
           & checkSize
           & color1
           & color2
        )
    fun compositeColorSimple self destWidth destHeight interpType overallAlpha checkSize color1 color2 =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        compositeColorSimple_
        (
          self
           & destWidth
           & destHeight
           & interpType
           & overallAlpha
           & checkSize
           & color1
           & color2
        )
    fun copy self = (GdkPixbufPixbufClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) copy_ self
    fun copyArea self srcX srcY width height destPixbuf destX destY =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        copyArea_
        (
          self
           & srcX
           & srcY
           & width
           & height
           & destPixbuf
           & destX
           & destY
        )
    fun fill self pixel = (GdkPixbufPixbufClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GdkPixbufPixbufClass.C.withPtr &&&> FFI.Bool.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Int.C.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GdkPixbufPixbufClass.C.withPtr ---> GdkPixbufColorspace.C.fromVal) getColorspace_ self
    fun getHasAlpha self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasAlpha_ self
    fun getHeight self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getNChannels self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Int.C.fromVal) getNChannels_ self
    fun getOption self key = (GdkPixbufPixbufClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getOption_ (self & key)
    fun getRowstride self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Int.C.fromVal) getRowstride_ self
    fun getWidth self = (GdkPixbufPixbufClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun newSubpixbuf self srcX srcY width height =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        newSubpixbuf_
        (
          self
           & srcX
           & srcY
           & width
           & height
        )
    fun rotateSimple self angle = (GdkPixbufPixbufClass.C.withPtr &&&> GdkPixbufPixbufRotation.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate self dest saturation pixelate =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        saturateAndPixelate_
        (
          self
           & dest
           & saturation
           & pixelate
        )
    fun scale self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         ---> I
      )
        scale_
        (
          self
           & dest
           & destX
           & destY
           & destWidth
           & destHeight
           & offsetX
           & offsetY
           & scaleX
           & scaleY
           & interpType
        )
    fun scaleSimple self destWidth destHeight interpType =
      (
        GdkPixbufPixbufClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        scaleSimple_
        (
          self
           & destWidth
           & destHeight
           & interpType
        )
    local
      open Property
    in
      val bitsPerSampleProp =
        {
          get = fn x => get "bits-per-sample" int x,
          set = fn x => set "bits-per-sample" int x
        }
      val colorspaceProp =
        {
          get = fn x => get "colorspace" GdkPixbufColorspace.t x,
          set = fn x => set "colorspace" GdkPixbufColorspace.t x
        }
      val hasAlphaProp =
        {
          get = fn x => get "has-alpha" boolean x,
          set = fn x => set "has-alpha" boolean x
        }
      val heightProp =
        {
          get = fn x => get "height" int x,
          set = fn x => set "height" int x
        }
      val nChannelsProp =
        {
          get = fn x => get "n-channels" int x,
          set = fn x => set "n-channels" int x
        }
      val rowstrideProp =
        {
          get = fn x => get "rowstride" int x,
          set = fn x => set "rowstride" int x
        }
      val widthProp =
        {
          get = fn x => get "width" int x,
          set = fn x => set "width" int x
        }
    end
  end
