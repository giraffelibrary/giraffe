structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type record_t = GdkPixbufPixbufFormatRecord.t =
  struct
    val getType_ = _import "gdk_pixbuf_format_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gdk_pixbuf_format_copy" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p;
    val getDescription_ = _import "gdk_pixbuf_format_get_description" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLicense_ = _import "gdk_pixbuf_format_get_license" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getName_ = _import "gdk_pixbuf_format_get_name" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val isDisabled_ = _import "gdk_pixbuf_format_is_disabled" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> FFI.Bool.C.val_;
    val isScalable_ = _import "gdk_pixbuf_format_is_scalable" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> FFI.Bool.C.val_;
    val isWritable_ = _import "gdk_pixbuf_format_is_writable" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p -> FFI.Bool.C.val_;
    val setDisabled_ = fn x1 & x2 => (_import "gdk_pixbuf_format_set_disabled" : GdkPixbufPixbufFormatRecord.C.notnull GdkPixbufPixbufFormatRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type record_t = GdkPixbufPixbufFormatRecord.t
    type t = record_t
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
