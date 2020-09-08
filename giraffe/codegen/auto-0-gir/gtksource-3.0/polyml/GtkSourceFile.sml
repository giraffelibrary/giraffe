structure GtkSourceFile :>
  GTK_SOURCE_FILE
    where type 'a class = 'a GtkSourceFileClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type newline_type_t = GtkSourceNewlineType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_file_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_file_new") (cVoid --> GtkSourceFileClass.PolyML.cPtr)
      val checkFileOnDisk_ = call (getSymbol "gtk_source_file_check_file_on_disk") (GtkSourceFileClass.PolyML.cPtr --> cVoid)
      val getCompressionType_ = call (getSymbol "gtk_source_file_get_compression_type") (GtkSourceFileClass.PolyML.cPtr --> GtkSourceCompressionType.PolyML.cVal)
      val getEncoding_ = call (getSymbol "gtk_source_file_get_encoding") (GtkSourceFileClass.PolyML.cPtr --> GtkSourceEncodingRecord.PolyML.cPtr)
      val getLocation_ = call (getSymbol "gtk_source_file_get_location") (GtkSourceFileClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getNewlineType_ = call (getSymbol "gtk_source_file_get_newline_type") (GtkSourceFileClass.PolyML.cPtr --> GtkSourceNewlineType.PolyML.cVal)
      val isDeleted_ = call (getSymbol "gtk_source_file_is_deleted") (GtkSourceFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isExternallyModified_ = call (getSymbol "gtk_source_file_is_externally_modified") (GtkSourceFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isLocal_ = call (getSymbol "gtk_source_file_is_local") (GtkSourceFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isReadonly_ = call (getSymbol "gtk_source_file_is_readonly") (GtkSourceFileClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setLocation_ = call (getSymbol "gtk_source_file_set_location") (GtkSourceFileClass.PolyML.cPtr &&> GioFileClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceFileClass.class
    type compression_type_t = GtkSourceCompressionType.t
    type encoding_t = GtkSourceEncodingRecord.t
    type newline_type_t = GtkSourceNewlineType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceFileClass.FFI.fromPtr true) new_ ()
    fun checkFileOnDisk self = (GtkSourceFileClass.FFI.withPtr false ---> I) checkFileOnDisk_ self
    fun getCompressionType self = (GtkSourceFileClass.FFI.withPtr false ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileClass.FFI.withPtr false ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self
    fun getLocation self = (GtkSourceFileClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr false) getLocation_ self
    fun getNewlineType self = (GtkSourceFileClass.FFI.withPtr false ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun isDeleted self = (GtkSourceFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) isDeleted_ self
    fun isExternallyModified self = (GtkSourceFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) isExternallyModified_ self
    fun isLocal self = (GtkSourceFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) isLocal_ self
    fun isReadonly self = (GtkSourceFileClass.FFI.withPtr false ---> GBool.FFI.fromVal) isReadonly_ self
    fun setLocation self location = (GtkSourceFileClass.FFI.withPtr false &&&> GioFileClass.FFI.withOptPtr false ---> I) setLocation_ (self & location)
    local
      open ValueAccessor
    in
      val compressionTypeProp =
        {
          name = "compression-type",
          gtype = fn () => C.gtype GtkSourceCompressionType.t (),
          get = fn x => fn () => C.get GtkSourceCompressionType.t x,
          set = ignore,
          init = ignore
        }
      val encodingProp =
        {
          name = "encoding",
          gtype = fn () => C.gtype GtkSourceEncodingRecord.tOpt (),
          get = fn x => fn () => C.get GtkSourceEncodingRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val locationProp =
        {
          name = "location",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = fn x => C.set GioFileClass.tOpt x,
          init = fn x => C.set GioFileClass.tOpt x
        }
      val newlineTypeProp =
        {
          name = "newline-type",
          gtype = fn () => C.gtype GtkSourceNewlineType.t (),
          get = fn x => fn () => C.get GtkSourceNewlineType.t x,
          set = ignore,
          init = ignore
        }
      val readOnlyProp =
        {
          name = "read-only",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
    end
  end
