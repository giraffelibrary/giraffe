structure GdkPixbufPixbufFormat :>
  GDK_PIXBUF_PIXBUF_FORMAT
    where type t = GdkPixbufPixbufFormatRecord.t =
  struct
    val getType_ = _import "gdk_pixbuf_format_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_pixbuf_format_copy" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p;
    val getDescription_ = _import "gdk_pixbuf_format_get_description" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getExtensions_ = _import "gdk_pixbuf_format_get_extensions" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getLicense_ = _import "gdk_pixbuf_format_get_license" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getMimeTypes_ = _import "gdk_pixbuf_format_get_mime_types" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getName_ = _import "gdk_pixbuf_format_get_name" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val isDisabled_ = _import "gdk_pixbuf_format_is_disabled" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val isSaveOptionSupported_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_pixbuf_format_is_save_option_supported" :
              GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isScalable_ = _import "gdk_pixbuf_format_is_scalable" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val isWritable_ = _import "gdk_pixbuf_format_is_writable" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p -> GBool.FFI.val_;
    val setDisabled_ = fn x1 & x2 => (_import "gdk_pixbuf_format_set_disabled" : GdkPixbufPixbufFormatRecord.FFI.non_opt GdkPixbufPixbufFormatRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type t = GdkPixbufPixbufFormatRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GdkPixbufPixbufFormatRecord.FFI.fromPtr true) copy_ self
    fun getDescription self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getDescription_ self
    fun getExtensions self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getExtensions_ self
    fun getLicense self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getLicense_ self
    fun getMimeTypes self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getMimeTypes_ self
    fun getName self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getName_ self
    fun isDisabled self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isDisabled_ self
    fun isSaveOptionSupported self optionKey = (GdkPixbufPixbufFormatRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) isSaveOptionSupported_ (self & optionKey)
    fun isScalable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isScalable_ self
    fun isWritable self = (GdkPixbufPixbufFormatRecord.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun setDisabled self disabled = (GdkPixbufPixbufFormatRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDisabled_ (self & disabled)
  end
