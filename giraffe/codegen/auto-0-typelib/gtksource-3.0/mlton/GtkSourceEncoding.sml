structure GtkSourceEncoding :>
  GTK_SOURCE_ENCODING
    where type t = GtkSourceEncodingRecord.t =
  struct
    val getType_ = _import "gtk_source_encoding_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gtk_source_encoding_copy" : GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p -> GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p;
    val getCharset_ = _import "gtk_source_encoding_get_charset" : GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "gtk_source_encoding_get_name" : GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val toString_ = _import "gtk_source_encoding_to_string" : GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrent_ = _import "gtk_source_encoding_get_current" : unit -> GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p;
    val getFromCharset_ = _import "mlton_gtk_source_encoding_get_from_charset" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit GtkSourceEncodingRecord.FFI.p;
    val getUtf8_ = _import "gtk_source_encoding_get_utf8" : unit -> GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p;
    type t = GtkSourceEncodingRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkSourceEncodingRecord.FFI.withPtr ---> GtkSourceEncodingRecord.FFI.fromPtr true) copy_ self
    fun getCharset self = (GtkSourceEncodingRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCharset_ self
    fun getName self = (GtkSourceEncodingRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun toString self = (GtkSourceEncodingRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun getCurrent () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getCurrent_ ()
    fun getFromCharset charset = (Utf8.FFI.withPtr ---> GtkSourceEncodingRecord.FFI.fromOptPtr false) getFromCharset_ charset
    fun getUtf8 () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getUtf8_ ()
  end
