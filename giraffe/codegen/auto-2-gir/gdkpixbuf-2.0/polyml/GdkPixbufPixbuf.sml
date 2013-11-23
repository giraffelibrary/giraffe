structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class_t = 'a GdkPixbufPixbufClass.t
    where type pixbufrotation_t = GdkPixbufPixbufRotation.t
    where type interptype_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new")
          (
            GdkPixbufColorspace.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromFile_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newFromFileAtScale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file_at_scale")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromFileAtSize_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file_at_size")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromStream_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromStreamAtScale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream_at_scale")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newFromStreamFinish_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newFromXpmData_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_xpm_data") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val gettext_ = call (load_sym libgdkpixbuf "gdk_pixbuf_gettext") (FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val saveToStreamFinish_ = call (load_sym libgdkpixbuf "gdk_pixbuf_save_to_stream_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val addAlpha_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_add_alpha")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt8.PolyML.VAL
             &&> FFI.UInt8.PolyML.VAL
             &&> FFI.UInt8.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val applyEmbeddedOrientation_ = call (load_sym libgdkpixbuf "gdk_pixbuf_apply_embedded_orientation") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val composite_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> GdkPixbufInterpType.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val compositeColor_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> GdkPixbufInterpType.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val compositeColorSimple_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite_color_simple")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GdkPixbufInterpType.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val copy_ = call (load_sym libgdkpixbuf "gdk_pixbuf_copy") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val copyArea_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_copy_area")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val fill_ = call (load_sym libgdkpixbuf "gdk_pixbuf_fill") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val flip_ = call (load_sym libgdkpixbuf "gdk_pixbuf_flip") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getBitsPerSample_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_bits_per_sample") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getColorspace_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_colorspace") (GObjectObjectClass.PolyML.PTR --> GdkPixbufColorspace.PolyML.VAL)
      val getHasAlpha_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_has_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getHeight_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getNChannels_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_n_channels") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getOption_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_option") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getRowstride_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_rowstride") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getWidth_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val newSubpixbuf_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_subpixbuf")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val rotateSimple_ = call (load_sym libgdkpixbuf "gdk_pixbuf_rotate_simple") (GObjectObjectClass.PolyML.PTR &&> GdkPixbufPixbufRotation.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val saturateAndPixelate_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_saturate_and_pixelate")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Float.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val scale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_scale")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> GdkPixbufInterpType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val scaleSimple_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_scale_simple")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GdkPixbufInterpType.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GdkPixbufPixbufClass.t
    type pixbufrotation_t = GdkPixbufPixbufRotation.t
    type interptype_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
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
    fun newFromFile filename = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale filename width height preserveAspectRatio =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
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
        FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
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
    fun newFromXpmData data = (FFI.String.C.withConstPtr ---> GdkPixbufPixbufClass.C.fromPtr true) newFromXpmData_ data
    fun gettext msgid = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) gettext_ msgid
    fun saveToStreamFinish asyncResult = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha self substituteColor r g b =
      (
        GObjectObjectClass.C.withPtr
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
    fun applyEmbeddedOrientation self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) applyEmbeddedOrientation_ self
    fun composite self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType overallAlpha =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun copy self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) copy_ self
    fun copyArea self srcX srcY width height destPixbuf destX destY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withPtr
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
    fun fill self pixel = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GObjectObjectClass.C.withPtr ---> GdkPixbufColorspace.C.fromVal) getColorspace_ self
    fun getHasAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasAlpha_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getNChannels self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNChannels_ self
    fun getOption self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getOption_ (self & key)
    fun getRowstride self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getRowstride_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun newSubpixbuf self srcX srcY width height =
      (
        GObjectObjectClass.C.withPtr
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
    fun rotateSimple self angle = (GObjectObjectClass.C.withPtr &&&> GdkPixbufPixbufRotation.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate self dest saturation pixelate =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
