structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type t = GdkPixbufPixbufFormatRecord.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "gdk_pixbuf_format_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_pixbuf_format_copy" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p;
    val getDescription_ = _import "gdk_pixbuf_format_get_description" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getExtensions_ = _import "gdk_pixbuf_format_get_extensions" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getLicense_ = _import "gdk_pixbuf_format_get_license" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMimeTypes_ = _import "gdk_pixbuf_format_get_mime_types" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getName_ = _import "gdk_pixbuf_format_get_name" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val isDisabled_ = _import "gdk_pixbuf_format_is_disabled" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val isScalable_ = _import "gdk_pixbuf_format_is_scalable" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val isWritable_ = _import "gdk_pixbuf_format_is_writable" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val setDisabled_ = fn x1 & x2 => (_import "gdk_pixbuf_format_set_disabled" : GdkPixbufPixbufFormatRecord.FFI.notnull GdkPixbufPixbufFormatRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type t = GdkPixbufPixbufFormatRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GdkPixbufPixbufFormatRecord.FFI.fromPtr true) copy_ self
    fun getDescription self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getDescription_ self
    fun getExtensions self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getExtensions_ self
    fun getLicense self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getLicense_ self
    fun getMimeTypes self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getMimeTypes_ self
    fun getName self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun isDisabled self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDisabled_ self
    fun isScalable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isScalable_ self
    fun isWritable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun setDisabled self disabled = (GdkPixbufPixbufFormatRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDisabled_ (self & disabled)
  end
