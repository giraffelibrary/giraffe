structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class = 'a GdkPixbufPixbufClass.class
    where type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    where type interp_type_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "gdk_pixbuf_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new" :
              GdkPixbufColorspace.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_new_from_stream_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val newFromXpmData_ = _import "mlton_gdk_pixbuf_new_from_xpm_data" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val gettext_ = _import "mlton_gdk_pixbuf_gettext" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val saveToStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_save_to_stream_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val addAlpha_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_add_alpha" :
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GBool.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               * GUInt8.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val applyEmbeddedOrientation_ = _import "gdk_pixbuf_apply_embedded_orientation" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
    val copy_ = _import "gdk_pixbuf_copy" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
    val fill_ = fn x1 & x2 => (_import "gdk_pixbuf_fill" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val flip_ = fn x1 & x2 => (_import "gdk_pixbuf_flip" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p * GBool.FFI.val_ -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getBitsPerSample_ = _import "gdk_pixbuf_get_bits_per_sample" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getColorspace_ = _import "gdk_pixbuf_get_colorspace" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GdkPixbufColorspace.FFI.val_;
    val getHasAlpha_ = _import "gdk_pixbuf_get_has_alpha" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GBool.FFI.val_;
    val getHeight_ = _import "gdk_pixbuf_get_height" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getNChannels_ = _import "gdk_pixbuf_get_n_channels" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getOption_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_get_option" :
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowstride_ = _import "gdk_pixbuf_get_rowstride" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val getWidth_ = _import "gdk_pixbuf_get_width" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GInt32.FFI.val_;
    val newSubpixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new_subpixbuf" :
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val rotateSimple_ = fn x1 & x2 => (_import "gdk_pixbuf_rotate_simple" : GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p * GdkPixbufPixbufRotation.FFI.val_ -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val saturateAndPixelate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_saturate_and_pixelate" :
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GFloat.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val savev_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10 =>
          (
            _import "mlton_gdk_pixbuf_savev" :
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              x10
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GdkPixbufInterpType.FFI.val_
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
              GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkPixbufInterpType.FFI.val_
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        colorspace,
        hasAlpha,
        bitsPerSample,
        width,
        height
      ) =
      (
        GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        new_
        (
          colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
        )
    fun newFromFile filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale
      (
        filename,
        width,
        height,
        preserveAspectRatio
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromFileAtScale_
        (
          filename
           & width
           & height
           & preserveAspectRatio
           & []
        )
    fun newFromFileAtSize
      (
        filename,
        width,
        height
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromFileAtSize_
        (
          filename
           & width
           & height
           & []
        )
    fun newFromStream (stream, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromStream_
        (
          stream
           & cancellable
           & []
        )
    fun newFromStreamAtScale
      (
        stream,
        width,
        height,
        preserveAspectRatio,
        cancellable
      ) =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
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
    fun newFromStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (Utf8.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromXpmData_ data
    fun gettext msgid = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) gettext_ msgid
    fun saveToStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha
      self
      (
        substituteColor,
        r,
        g,
        b
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         &&&> GUInt8.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        addAlpha_
        (
          self
           & substituteColor
           & r
           & g
           & b
        )
    fun applyEmbeddedOrientation self = (GdkPixbufPixbufClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr true) applyEmbeddedOrientation_ self
    fun composite
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType,
        overallAlpha
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun compositeColor
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType,
        overallAlpha,
        checkX,
        checkY,
        checkSize,
        color1,
        color2
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
    fun compositeColorSimple
      self
      (
        destWidth,
        destHeight,
        interpType,
        overallAlpha,
        checkSize,
        color1,
        color2
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
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
    fun copy self = (GdkPixbufPixbufClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr true) copy_ self
    fun copyArea
      self
      (
        srcX,
        srcY,
        width,
        height,
        destPixbuf,
        destX,
        destY
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun fill self pixel = (GdkPixbufPixbufClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GdkPixbufPixbufClass.FFI.withPtr &&&> GBool.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt32.FFI.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GdkPixbufPixbufClass.FFI.withPtr ---> GdkPixbufColorspace.FFI.fromVal) getColorspace_ self
    fun getHasAlpha self = (GdkPixbufPixbufClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasAlpha_ self
    fun getHeight self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getNChannels self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNChannels_ self
    fun getOption self key = (GdkPixbufPixbufClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getOption_ (self & key)
    fun getRowstride self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt32.FFI.fromVal) getRowstride_ self
    fun getWidth self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun newSubpixbuf
      self
      (
        srcX,
        srcY,
        width,
        height
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newSubpixbuf_
        (
          self
           & srcX
           & srcY
           & width
           & height
        )
    fun rotateSimple self angle = (GdkPixbufPixbufClass.FFI.withPtr &&&> GdkPixbufPixbufRotation.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate
      self
      (
        dest,
        saturation,
        pixelate
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GFloat.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        saturateAndPixelate_
        (
          self
           & dest
           & saturation
           & pixelate
        )
    fun savev
      self
      (
        filename,
        type',
        optionKeys,
        optionValues
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        savev_
        (
          self
           & filename
           & type'
           & optionKeys
           & optionValues
           & []
        )
    fun scale
      self
      (
        dest,
        destX,
        destY,
        destWidth,
        destHeight,
        offsetX,
        offsetY,
        scaleX,
        scaleY,
        interpType
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
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
    fun scaleSimple
      self
      (
        destWidth,
        destHeight,
        interpType
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
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
