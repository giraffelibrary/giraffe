structure GtkSourceEncoding :>
  GTK_SOURCE_ENCODING
    where type t = GtkSourceEncodingRecord.t =
  struct
    val getType_ = _import "gtk_source_encoding_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gtk_source_encoding_copy" : GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    val getCharset_ = _import "gtk_source_encoding_get_charset" : GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getName_ = _import "gtk_source_encoding_get_name" : GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val toString_ = _import "gtk_source_encoding_to_string" : GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrent_ = _import "gtk_source_encoding_get_current" : unit -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    val getFromCharset_ = _import "mlton_gtk_source_encoding_get_from_charset" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkSourceEncodingRecord.FFI.opt GtkSourceEncodingRecord.FFI.p;
    val getUtf8_ = _import "gtk_source_encoding_get_utf8" : unit -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    type t = GtkSourceEncodingRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkSourceEncodingRecord.FFI.withPtr false ---> GtkSourceEncodingRecord.FFI.fromPtr true) copy_ self
    fun getCharset self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCharset_ self
    fun getName self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun toString self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
    fun getCurrent () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getCurrent_ ()
    fun getFromCharset charset = (Utf8.FFI.withPtr 0 ---> GtkSourceEncodingRecord.FFI.fromOptPtr false) getFromCharset_ charset
    fun getUtf8 () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getUtf8_ ()
  end
