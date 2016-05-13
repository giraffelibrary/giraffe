structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type t = GdkPixbufPixbufFormatRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_copy") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> GdkPixbufPixbufFormatRecord.PolyML.cPtr)
      val getDescription_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_description") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLicense_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_license") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_name") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isDisabled_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_disabled") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isScalable_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_scalable") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isWritable_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_writable") (GdkPixbufPixbufFormatRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDisabled_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_set_disabled") (GdkPixbufPixbufFormatRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type t = GdkPixbufPixbufFormatRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> GdkPixbufPixbufFormatRecord.C.fromPtr true) copy_ self
    fun getDescription self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> Utf8.C.fromPtr true) getDescription_ self
    fun getLicense self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> Utf8.C.fromPtr true) getLicense_ self
    fun getName self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> Utf8.C.fromPtr true) getName_ self
    fun isDisabled self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDisabled_ self
    fun isScalable self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isScalable_ self
    fun isWritable self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ self
    fun setDisabled self disabled = (GdkPixbufPixbufFormatRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDisabled_ (self & disabled)
  end
