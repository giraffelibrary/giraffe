structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type record_t = GdkPixbufPixbufFormatRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_copy") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> GdkPixbufPixbufFormatRecord.PolyML.PTR)
      val getDescription_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_description") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getLicense_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_license") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getName_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_get_name") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val isDisabled_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_disabled") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isScalable_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_scalable") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isWritable_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_is_writable") (GdkPixbufPixbufFormatRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setDisabled_ = call (load_sym libgdkpixbuf "gdk_pixbuf_format_set_disabled") (GdkPixbufPixbufFormatRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type record_t = GdkPixbufPixbufFormatRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> GdkPixbufPixbufFormatRecord.C.fromPtr true) copy_ self
    fun getDescription self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.String.C.fromPtr true) getDescription_ self
    fun getLicense self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.String.C.fromPtr true) getLicense_ self
    fun getName self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.String.C.fromPtr true) getName_ self
    fun isDisabled self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isDisabled_ self
    fun isScalable self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isScalable_ self
    fun isWritable self = (GdkPixbufPixbufFormatRecord.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ self
    fun setDisabled self disabled = (GdkPixbufPixbufFormatRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDisabled_ (self & disabled)
  end
