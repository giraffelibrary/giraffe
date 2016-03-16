structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class_t = 'a GdkPixbufPixbufClass.t
    where type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    where type interp_type_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new")
          (
            GdkPixbufColorspace.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromFile_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newFromFileAtScale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file_at_scale")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromFileAtSize_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_file_at_size")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromStream_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromStreamAtScale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream_at_scale")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newFromStreamFinish_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_stream_finish") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newFromXpmData_ = call (load_sym libgdkpixbuf "gdk_pixbuf_new_from_xpm_data") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val gettext_ = call (load_sym libgdkpixbuf "gdk_pixbuf_gettext") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val saveToStreamFinish_ = call (load_sym libgdkpixbuf "gdk_pixbuf_save_to_stream_finish") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val addAlpha_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_add_alpha")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.UInt8.PolyML.cVal
             &&> FFI.UInt8.PolyML.cVal
             &&> FFI.UInt8.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val applyEmbeddedOrientation_ = call (load_sym libgdkpixbuf "gdk_pixbuf_apply_embedded_orientation") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val composite_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val compositeColor_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite_color")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val compositeColorSimple_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_composite_color_simple")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgdkpixbuf "gdk_pixbuf_copy") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val copyArea_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_copy_area")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val fill_ = call (load_sym libgdkpixbuf "gdk_pixbuf_fill") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val flip_ = call (load_sym libgdkpixbuf "gdk_pixbuf_flip") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getBitsPerSample_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_bits_per_sample") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getColorspace_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_colorspace") (GObjectObjectClass.PolyML.cPtr --> GdkPixbufColorspace.PolyML.cVal)
      val getHasAlpha_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_has_alpha") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHeight_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNChannels_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_n_channels") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getOption_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_option") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getRowstride_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_rowstride") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getWidth_ = call (load_sym libgdkpixbuf "gdk_pixbuf_get_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val newSubpixbuf_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_new_subpixbuf")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val rotateSimple_ = call (load_sym libgdkpixbuf "gdk_pixbuf_rotate_simple") (GObjectObjectClass.PolyML.cPtr &&> GdkPixbufPixbufRotation.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val saturateAndPixelate_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_saturate_and_pixelate")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Float.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val scale_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_scale")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val scaleSimple_ =
        call (load_sym libgdkpixbuf "gdk_pixbuf_scale_simple")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
    end
    type 'a class_t = 'a GdkPixbufPixbufClass.t
    type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    type interp_type_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    type t = base class_t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new colorspace hasAlpha bitsPerSample width height =
      (
        GdkPixbufColorspace.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
    fun newFromStreamFinish asyncResult = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (Utf8.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) newFromXpmData_ data
    fun gettext msgid = (Utf8.C.withPtr ---> Utf8.C.fromPtr false) gettext_ msgid
    fun saveToStreamFinish asyncResult = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) saveToStreamFinish_ (asyncResult & [])
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GdkPixbufInterpType.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun getBitsPerSample self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GObjectObjectClass.C.withPtr ---> GdkPixbufColorspace.C.fromVal) getColorspace_ self
    fun getHasAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasAlpha_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getNChannels self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNChannels_ self
    fun getOption self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getOption_ (self & key)
    fun getRowstride self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getRowstride_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun newSubpixbuf self srcX srcY width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
