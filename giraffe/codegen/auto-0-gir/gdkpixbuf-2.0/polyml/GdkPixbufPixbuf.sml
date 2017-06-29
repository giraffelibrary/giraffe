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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gdk_pixbuf_new")
          (
            GdkPixbufColorspace.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromFile_ = call (getSymbol "gdk_pixbuf_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufClass.PolyML.cPtr)
      val newFromFileAtScale_ =
        call (getSymbol "gdk_pixbuf_new_from_file_at_scale")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromFileAtSize_ =
        call (getSymbol "gdk_pixbuf_new_from_file_at_size")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromStream_ =
        call (getSymbol "gdk_pixbuf_new_from_stream")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromStreamAtScale_ =
        call (getSymbol "gdk_pixbuf_new_from_stream_at_scale")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromStreamFinish_ = call (getSymbol "gdk_pixbuf_new_from_stream_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufClass.PolyML.cPtr)
      val newFromXpmData_ = call (getSymbol "gdk_pixbuf_new_from_xpm_data") (Utf8.PolyML.cInPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val gettext_ = call (getSymbol "gdk_pixbuf_gettext") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val saveToStreamFinish_ = call (getSymbol "gdk_pixbuf_save_to_stream_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val addAlpha_ =
        call (getSymbol "gdk_pixbuf_add_alpha")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GUInt8.PolyML.cVal
             &&> GUInt8.PolyML.cVal
             &&> GUInt8.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val applyEmbeddedOrientation_ = call (getSymbol "gdk_pixbuf_apply_embedded_orientation") (GdkPixbufPixbufClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val composite_ =
        call (getSymbol "gdk_pixbuf_composite")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val compositeColor_ =
        call (getSymbol "gdk_pixbuf_composite_color")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val compositeColorSimple_ =
        call (getSymbol "gdk_pixbuf_composite_color_simple")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gdk_pixbuf_copy") (GdkPixbufPixbufClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val copyArea_ =
        call (getSymbol "gdk_pixbuf_copy_area")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val fill_ = call (getSymbol "gdk_pixbuf_fill") (GdkPixbufPixbufClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val flip_ = call (getSymbol "gdk_pixbuf_flip") (GdkPixbufPixbufClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getBitsPerSample_ = call (getSymbol "gdk_pixbuf_get_bits_per_sample") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getColorspace_ = call (getSymbol "gdk_pixbuf_get_colorspace") (GdkPixbufPixbufClass.PolyML.cPtr --> GdkPixbufColorspace.PolyML.cVal)
      val getHasAlpha_ = call (getSymbol "gdk_pixbuf_get_has_alpha") (GdkPixbufPixbufClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHeight_ = call (getSymbol "gdk_pixbuf_get_height") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNChannels_ = call (getSymbol "gdk_pixbuf_get_n_channels") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getOption_ = call (getSymbol "gdk_pixbuf_get_option") (GdkPixbufPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getRowstride_ = call (getSymbol "gdk_pixbuf_get_rowstride") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWidth_ = call (getSymbol "gdk_pixbuf_get_width") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val newSubpixbuf_ =
        call (getSymbol "gdk_pixbuf_new_subpixbuf")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val rotateSimple_ = call (getSymbol "gdk_pixbuf_rotate_simple") (GdkPixbufPixbufClass.PolyML.cPtr &&> GdkPixbufPixbufRotation.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cPtr)
      val saturateAndPixelate_ =
        call (getSymbol "gdk_pixbuf_saturate_and_pixelate")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val savev_ =
        call (getSymbol "gdk_pixbuf_savev")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val scale_ =
        call (getSymbol "gdk_pixbuf_scale")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val scaleSimple_ =
        call (getSymbol "gdk_pixbuf_scale_simple")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkPixbufInterpType.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GdkPixbufPixbufClass.class
    type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    type interp_type_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new colorspace hasAlpha bitsPerSample width height =
      (
        GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun newFromFileAtScale filename width height preserveAspectRatio =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun newFromFileAtSize filename width height =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun newFromStream stream cancellable =
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
    fun newFromStreamAtScale stream width height preserveAspectRatio cancellable =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun addAlpha self substituteColor r g b =
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
    fun composite self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType overallAlpha =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt.FFI.withVal
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
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun compositeColorSimple self destWidth destHeight interpType overallAlpha checkSize color1 color2 =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkPixbufInterpType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun copyArea self srcX srcY width height destPixbuf destX destY =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun getBitsPerSample self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt.FFI.fromVal) getBitsPerSample_ self
    fun getColorspace self = (GdkPixbufPixbufClass.FFI.withPtr ---> GdkPixbufColorspace.FFI.fromVal) getColorspace_ self
    fun getHasAlpha self = (GdkPixbufPixbufClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasAlpha_ self
    fun getHeight self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt.FFI.fromVal) getHeight_ self
    fun getNChannels self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt.FFI.fromVal) getNChannels_ self
    fun getOption self key = (GdkPixbufPixbufClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getOption_ (self & key)
    fun getRowstride self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt.FFI.fromVal) getRowstride_ self
    fun getWidth self = (GdkPixbufPixbufClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidth_ self
    fun newSubpixbuf self srcX srcY width height =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun saturateAndPixelate self dest saturation pixelate =
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
    fun savev self filename type' optionKeys optionValues =
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
    fun scale self dest destX destY destWidth destHeight offsetX offsetY scaleX scaleY interpType =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun scaleSimple self destWidth destHeight interpType =
      (
        GdkPixbufPixbufClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
