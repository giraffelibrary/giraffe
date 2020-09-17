structure GtkSourceEncoding :>
  GTK_SOURCE_ENCODING
    where type t = GtkSourceEncodingRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_encoding_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gtk_source_encoding_copy") (GtkSourceEncodingRecord.PolyML.cPtr --> GtkSourceEncodingRecord.PolyML.cPtr)
      val getCharset_ = call (getSymbol "gtk_source_encoding_get_charset") (GtkSourceEncodingRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "gtk_source_encoding_get_name") (GtkSourceEncodingRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val toString_ = call (getSymbol "gtk_source_encoding_to_string") (GtkSourceEncodingRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getCurrent_ = call (getSymbol "gtk_source_encoding_get_current") (cVoid --> GtkSourceEncodingRecord.PolyML.cPtr)
      val getFromCharset_ = call (getSymbol "gtk_source_encoding_get_from_charset") (Utf8.PolyML.cInPtr --> GtkSourceEncodingRecord.PolyML.cOptPtr)
      val getUtf8_ = call (getSymbol "gtk_source_encoding_get_utf8") (cVoid --> GtkSourceEncodingRecord.PolyML.cPtr)
    end
    type t = GtkSourceEncodingRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GtkSourceEncodingRecord.FFI.withPtr false ---> GtkSourceEncodingRecord.FFI.fromPtr true) copy_ self
    fun getCharset self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCharset_ self before GtkSourceEncodingRecord.FFI.touchPtr self
    fun getName self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GtkSourceEncodingRecord.FFI.touchPtr self
    fun toString self = (GtkSourceEncodingRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
    fun getCurrent () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getCurrent_ ()
    fun getFromCharset charset = (Utf8.FFI.withPtr 0 ---> GtkSourceEncodingRecord.FFI.fromOptPtr false) getFromCharset_ charset before Utf8.FFI.touchPtr charset
    fun getUtf8 () = (I ---> GtkSourceEncodingRecord.FFI.fromPtr false) getUtf8_ ()
  end
