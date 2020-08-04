structure GdkPixbufPixbuf :>
  GDK_PIXBUF_PIXBUF
    where type 'a class = 'a GdkPixbufPixbufClass.class
    where type pixdata_t = GdkPixbufPixdataRecord.t
    where type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    where type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    where type interp_type_t = GdkPixbufInterpType.t
    where type colorspace_t = GdkPixbufColorspace.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
      val newFromBytes_ =
        call (getSymbol "gdk_pixbuf_new_from_bytes")
          (
            GLibBytesRecord.PolyML.cPtr
             &&> GdkPixbufColorspace.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cVal
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
      val newFromInline_ =
        call (getSymbol "gdk_pixbuf_new_from_inline")
          (
            GInt.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val newFromResource_ = call (getSymbol "gdk_pixbuf_new_from_resource") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufClass.PolyML.cPtr)
      val newFromResourceAtScale_ =
        call (getSymbol "gdk_pixbuf_new_from_resource_at_scale")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
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
      val newFromXpmData_ = call (getSymbol "gdk_pixbuf_new_from_xpm_data") (Utf8CPtrArray.PolyML.cInPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val calculateRowstride_ =
        call (getSymbol "gdk_pixbuf_calculate_rowstride")
          (
            GdkPixbufColorspace.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val fromPixdata_ =
        call (getSymbol "gdk_pixbuf_from_pixdata")
          (
            GdkPixbufPixdataRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val getFileInfo_ =
        call (getSymbol "gdk_pixbuf_get_file_info")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GdkPixbufPixbufFormatRecord.PolyML.cOptPtr
          )
      val getFileInfoFinish_ =
        call (getSymbol "gdk_pixbuf_get_file_info_finish")
          (
            GioAsyncResultClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufFormatRecord.PolyML.cPtr
          )
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
             --> cVoid
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
             --> cVoid
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
             --> cVoid
          )
      val copyOptions_ = call (getSymbol "gdk_pixbuf_copy_options") (GdkPixbufPixbufClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val fill_ = call (getSymbol "gdk_pixbuf_fill") (GdkPixbufPixbufClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val flip_ = call (getSymbol "gdk_pixbuf_flip") (GdkPixbufPixbufClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getBitsPerSample_ = call (getSymbol "gdk_pixbuf_get_bits_per_sample") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getByteLength_ = call (getSymbol "gdk_pixbuf_get_byte_length") (GdkPixbufPixbufClass.PolyML.cPtr --> GSize.PolyML.cVal)
      val getColorspace_ = call (getSymbol "gdk_pixbuf_get_colorspace") (GdkPixbufPixbufClass.PolyML.cPtr --> GdkPixbufColorspace.PolyML.cVal)
      val getHasAlpha_ = call (getSymbol "gdk_pixbuf_get_has_alpha") (GdkPixbufPixbufClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHeight_ = call (getSymbol "gdk_pixbuf_get_height") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNChannels_ = call (getSymbol "gdk_pixbuf_get_n_channels") (GdkPixbufPixbufClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getOption_ = call (getSymbol "gdk_pixbuf_get_option") (GdkPixbufPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getPixels_ = call (getSymbol "gdk_pixbuf_get_pixels_with_length") (GdkPixbufPixbufClass.PolyML.cPtr &&> GUInt.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
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
      val readPixelBytes_ = call (getSymbol "gdk_pixbuf_read_pixel_bytes") (GdkPixbufPixbufClass.PolyML.cPtr --> GLibBytesRecord.PolyML.cPtr)
      val removeOption_ = call (getSymbol "gdk_pixbuf_remove_option") (GdkPixbufPixbufClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val rotateSimple_ = call (getSymbol "gdk_pixbuf_rotate_simple") (GdkPixbufPixbufClass.PolyML.cPtr &&> GdkPixbufPixbufRotation.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val saturateAndPixelate_ =
        call (getSymbol "gdk_pixbuf_saturate_and_pixelate")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GdkPixbufPixbufClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val saveToBufferv_ =
        call (getSymbol "gdk_pixbuf_save_to_bufferv")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cOutRef
             &&> GSize.PolyML.cRef
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val saveToStreamv_ =
        call (getSymbol "gdk_pixbuf_save_to_streamv")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> GioOutputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val savev_ =
        call (getSymbol "gdk_pixbuf_savev")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
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
             --> cVoid
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
      val setOption_ =
        call (getSymbol "gdk_pixbuf_set_option")
          (
            GdkPixbufPixbufClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GdkPixbufPixbufClass.class
    type pixdata_t = GdkPixbufPixdataRecord.t
    type pixbuf_format_t = GdkPixbufPixbufFormatRecord.t
    type pixbuf_rotation_t = GdkPixbufPixbufRotation.t
    type interp_type_t = GdkPixbufInterpType.t
    type colorspace_t = GdkPixbufColorspace.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioLoadableIconClass.FFI.fromPtr false) I self
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
    fun newFromBytes
      (
        data,
        colorspace,
        hasAlpha,
        bitsPerSample,
        width,
        height,
        rowstride
      ) =
      (
        GLibBytesRecord.FFI.withPtr false
         &&&> GdkPixbufColorspace.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromBytes_
        (
          data
           & colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
           & rowstride
        )
    fun newFromFile filename = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromFile_ (filename & [])
    fun newFromFileAtScale
      (
        filename,
        width,
        height,
        preserveAspectRatio
      ) =
      (
        Utf8.FFI.withPtr 0
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
    fun newFromFileAtSize
      (
        filename,
        width,
        height
      ) =
      (
        Utf8.FFI.withPtr 0
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
    fun newFromInline (data, copyPixels) =
      let
        val dataLength = LargeInt.fromInt (GUInt8CArrayN.length data)
        val retVal =
          (
            GInt.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GBool.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> GdkPixbufPixbufClass.FFI.fromPtr true
          )
            newFromInline_
            (
              dataLength
               & data
               & copyPixels
               & []
            )
      in
        retVal
      end
    fun newFromResource resourcePath = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromResource_ (resourcePath & [])
    fun newFromResourceAtScale
      (
        resourcePath,
        width,
        height,
        preserveAspectRatio
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        newFromResourceAtScale_
        (
          resourcePath
           & width
           & height
           & preserveAspectRatio
           & []
        )
    fun newFromStream (stream, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioInputStreamClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
    fun newFromStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromStreamFinish_ (asyncResult & [])
    fun newFromXpmData data = (Utf8CPtrArray.FFI.withPtr 0 ---> GdkPixbufPixbufClass.FFI.fromPtr true) newFromXpmData_ data
    fun calculateRowstride
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
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        calculateRowstride_
        (
          colorspace
           & hasAlpha
           & bitsPerSample
           & width
           & height
        )
    fun fromPixdata (pixdata, copyPixels) =
      (
        GdkPixbufPixdataRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        fromPixdata_
        (
          pixdata
           & copyPixels
           & []
        )
    fun getFileInfo filename =
      let
        val width
         & height
         & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkPixbufPixbufFormatRecord.FFI.fromOptPtr false
          )
            getFileInfo_
            (
              filename
               & GInt.null
               & GInt.null
            )
      in
        (
          retVal,
          width,
          height
        )
      end
    fun getFileInfoFinish asyncResult =
      let
        val width
         & height
         & retVal =
          (
            GioAsyncResultClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkPixbufPixbufFormatRecord.FFI.fromPtr false
          )
            getFileInfoFinish_
            (
              asyncResult
               & GInt.null
               & GInt.null
               & []
            )
      in
        (
          retVal,
          width,
          height
        )
      end
    fun saveToStreamFinish asyncResult = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) saveToStreamFinish_ (asyncResult & [])
    fun addAlpha
      self
      (
        substituteColor,
        r,
        g,
        b
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
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
    fun applyEmbeddedOrientation self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr true) applyEmbeddedOrientation_ self
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
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
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
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
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
        GdkPixbufPixbufClass.FFI.withPtr false
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
    fun copy self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromPtr true) copy_ self
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
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
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
    fun copyOptions self destPixbuf = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> GBool.FFI.fromVal) copyOptions_ (self & destPixbuf)
    fun fill self pixel = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) fill_ (self & pixel)
    fun flip self horizontal = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) flip_ (self & horizontal)
    fun getBitsPerSample self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt.FFI.fromVal) getBitsPerSample_ self
    fun getByteLength self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GSize.FFI.fromVal) getByteLength_ self
    fun getColorspace self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GdkPixbufColorspace.FFI.fromVal) getColorspace_ self
    fun getHasAlpha self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasAlpha_ self
    fun getHeight self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt.FFI.fromVal) getHeight_ self
    fun getNChannels self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNChannels_ self
    fun getOption self key = (GdkPixbufPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getOption_ (self & key)
    fun getPixels self =
      let
        val length & retVal = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 0) getPixels_ (self & GUInt.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getRowstride self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRowstride_ self
    fun getWidth self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidth_ self
    fun newSubpixbuf
      self
      (
        srcX,
        srcY,
        width,
        height
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
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
    fun readPixelBytes self = (GdkPixbufPixbufClass.FFI.withPtr false ---> GLibBytesRecord.FFI.fromPtr true) readPixelBytes_ self
    fun removeOption self key = (GdkPixbufPixbufClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) removeOption_ (self & key)
    fun rotateSimple self angle = (GdkPixbufPixbufClass.FFI.withPtr false &&&> GdkPixbufPixbufRotation.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) rotateSimple_ (self & angle)
    fun saturateAndPixelate
      self
      (
        dest,
        saturation,
        pixelate
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
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
    fun saveToBufferv
      self
      (
        type',
        optionKeys,
        optionValues
      ) =
      let
        val buffer
         & bufferSize
         & () =
          (
            GdkPixbufPixbufClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> Utf8.FFI.withPtr 0
             &&&> Utf8CPtrArray.FFI.withPtr 0
             &&&> Utf8CPtrArray.FFI.withPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GSize.FFI.fromVal
                   && ignore
          )
            saveToBufferv_
            (
              self
               & NONE
               & GSize.null
               & type'
               & optionKeys
               & optionValues
               & []
            )
      in
        buffer bufferSize
      end
    fun saveToStreamv
      self
      (
        stream,
        type',
        optionKeys,
        optionValues,
        cancellable
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GioOutputStreamClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveToStreamv_
        (
          self
           & stream
           & type'
           & optionKeys
           & optionValues
           & cancellable
           & []
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
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> GdkPixbufPixbufClass.FFI.withPtr false
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
    fun scaleSimple
      self
      (
        destWidth,
        destHeight,
        interpType
      ) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
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
    fun setOption self (key, value) =
      (
        GdkPixbufPixbufClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        setOption_
        (
          self
           & key
           & value
        )
    local
      open Property
    in
      val bitsPerSampleProp =
        {
          get = fn x => get "bits-per-sample" int x,
          new = fn x => new "bits-per-sample" int x
        }
      val colorspaceProp =
        {
          get = fn x => get "colorspace" GdkPixbufColorspace.t x,
          new = fn x => new "colorspace" GdkPixbufColorspace.t x
        }
      val hasAlphaProp =
        {
          get = fn x => get "has-alpha" boolean x,
          new = fn x => new "has-alpha" boolean x
        }
      val heightProp =
        {
          get = fn x => get "height" int x,
          new = fn x => new "height" int x
        }
      val nChannelsProp =
        {
          get = fn x => get "n-channels" int x,
          new = fn x => new "n-channels" int x
        }
      val pixelBytesProp =
        {
          get = fn x => get "pixel-bytes" GLibBytesRecord.tOpt x,
          new = fn x => new "pixel-bytes" GLibBytesRecord.tOpt x
        }
      val rowstrideProp =
        {
          get = fn x => get "rowstride" int x,
          new = fn x => new "rowstride" int x
        }
      val widthProp =
        {
          get = fn x => get "width" int x,
          new = fn x => new "width" int x
        }
    end
  end
