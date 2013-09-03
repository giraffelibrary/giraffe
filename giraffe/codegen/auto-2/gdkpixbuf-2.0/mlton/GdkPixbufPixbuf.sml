structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class_t = 'a GdkPixbufPixbufClass.t
    where type pixbufrotation_t = GdkPixbufPixbufRotation.t
    where type interptype_t = GdkPixbufInterpType.t
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
               * FFI.Bool.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Bool.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * FFI.Int32.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Bool.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newFromStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_new_from_stream_finish" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newFromXpmData_ = _import "mlton_gdk_pixbuf_new_from_xpm_data" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val gettext_ = _import "mlton_gdk_pixbuf_gettext" : cstring * unit CPointer.t -> FFI.String.notnull FFI.String.out_p;
    val saveToStreamFinish_ = fn x1 & x2 => (_import "gdk_pixbuf_save_to_stream_finish" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.val_;) (x1, x2)
    val addAlpha_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_add_alpha" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.val_
               * FFI.UInt8.val_
               * FFI.UInt8.val_
               * FFI.UInt8.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val applyEmbeddedOrientation_ = _import "gdk_pixbuf_apply_embedded_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * GdkPixbufInterpType.C.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.UInt32.val_
               * FFI.UInt32.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val copy_ = _import "gdk_pixbuf_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
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
    val fill_ = fn x1 & x2 => (_import "gdk_pixbuf_fill" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    val flip_ = fn x1 & x2 => (_import "gdk_pixbuf_flip" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getBitsPerSample_ = _import "gdk_pixbuf_get_bits_per_sample" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getColorspace_ = _import "gdk_pixbuf_get_colorspace" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkPixbufColorspace.C.val_;
    val getHasAlpha_ = _import "gdk_pixbuf_get_has_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getHeight_ = _import "gdk_pixbuf_get_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getNChannels_ = _import "gdk_pixbuf_get_n_channels" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getOption_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_get_option" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getRowstride_ = _import "gdk_pixbuf_get_rowstride" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getWidth_ = _import "gdk_pixbuf_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val newSubpixbuf_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_pixbuf_new_subpixbuf" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val rotateSimple_ = fn x1 & x2 => (_import "gdk_pixbuf_rotate_simple" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkPixbufPixbufRotation.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val saturateAndPixelate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_pixbuf_saturate_and_pixelate" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.val_
               * FFI.Bool.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
               * FFI.Double.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * GdkPixbufInterpType.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GdkPixbufPixbufClass.t
    type pixbufrotation_t = GdkPixbufPixbufRotation.t
    type interptype_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new colorspace hasAlpha bitsPerSample width height =
      (
        GdkPixbufColorspace.C.withVal
         &&&> FFI.Bool.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
    fun newFromFile filename = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale filename width height preserveAspectRatio =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Bool.withVal
         &&&> GLibErrorRecord.C.handleError
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
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Bool.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
    fun newFromStreamFinish asyncResult = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (FFI.String.withConstPtr ---> GdkPixbufPixbufClass.C.fromPtr true) newFromXpmData_ data
    fun gettext msgid = (FFI.String.withConstPtr ---> FFI.String.fromPtr false) gettext_ msgid
    fun saveToStreamFinish asyncResult = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha self substituteColor r g b =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.UInt8.withVal
         &&&> FFI.UInt8.withVal
         &&&> FFI.UInt8.withVal
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
    fun applyEmbeddedOrientation self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) applyEmbeddedOrientation_ self
    fun composite self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType overallAlpha =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.UInt32.withVal
         &&&> FFI.UInt32.withVal
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
    fun copy self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) copy_ self
    fun copyArea self srcX srcY width height destPixbuf destX destY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
    fun fill self pixel = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GObjectObjectClass.C.withPtr ---> GdkPixbufColorspace.C.fromVal) getColorspace_ self
    fun getHasAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHasAlpha_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getHeight_ self
    fun getNChannels self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNChannels_ self
    fun getOption self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) getOption_ (self & key)
    fun getRowstride self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getRowstride_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getWidth_ self
    fun newSubpixbuf self srcX srcY width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
    fun rotateSimple self angle = (GObjectObjectClass.C.withPtr &&&> GdkPixbufPixbufRotation.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate self dest saturation pixelate =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Float.withVal
         &&&> FFI.Bool.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
