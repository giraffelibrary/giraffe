structure GtkSourceFile :>
  GTK_SOURCE_FILE
    where type 'a class = 'a GtkSourceFileClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type newline_type_t = GtkSourceNewlineType.t =
  struct
    val getType_ = _import "gtk_source_file_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_file_new" : unit -> GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p;
    val checkFileOnDisk_ = _import "gtk_source_file_check_file_on_disk" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> unit;
    val getCompressionType_ = _import "gtk_source_file_get_compression_type" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GtkSourceCompressionType.FFI.val_;
    val getEncoding_ = _import "gtk_source_file_get_encoding" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GtkSourceEncodingRecord.FFI.notnull GtkSourceEncodingRecord.FFI.p;
    val getLocation_ = _import "gtk_source_file_get_location" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GioFileClass.FFI.notnull GioFileClass.FFI.p;
    val getNewlineType_ = _import "gtk_source_file_get_newline_type" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GtkSourceNewlineType.FFI.val_;
    val isDeleted_ = _import "gtk_source_file_is_deleted" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isExternallyModified_ = _import "gtk_source_file_is_externally_modified" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isLocal_ = _import "gtk_source_file_is_local" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isReadonly_ = _import "gtk_source_file_is_readonly" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val setLocation_ = fn x1 & x2 => (_import "gtk_source_file_set_location" : GtkSourceFileClass.FFI.notnull GtkSourceFileClass.FFI.p * unit GioFileClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceFileClass.class
    type compression_type_t = GtkSourceCompressionType.t
    type encoding_t = GtkSourceEncodingRecord.t
    type newline_type_t = GtkSourceNewlineType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceFileClass.FFI.fromPtr true) new_ ()
    fun checkFileOnDisk self = (GtkSourceFileClass.FFI.withPtr ---> I) checkFileOnDisk_ self
    fun getCompressionType self = (GtkSourceFileClass.FFI.withPtr ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileClass.FFI.withPtr ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self
    fun getLocation self = (GtkSourceFileClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getLocation_ self
    fun getNewlineType self = (GtkSourceFileClass.FFI.withPtr ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun isDeleted self = (GtkSourceFileClass.FFI.withPtr ---> GBool.FFI.fromVal) isDeleted_ self
    fun isExternallyModified self = (GtkSourceFileClass.FFI.withPtr ---> GBool.FFI.fromVal) isExternallyModified_ self
    fun isLocal self = (GtkSourceFileClass.FFI.withPtr ---> GBool.FFI.fromVal) isLocal_ self
    fun isReadonly self = (GtkSourceFileClass.FFI.withPtr ---> GBool.FFI.fromVal) isReadonly_ self
    fun setLocation self location = (GtkSourceFileClass.FFI.withPtr &&&> GioFileClass.FFI.withOptPtr ---> I) setLocation_ (self & location)
    local
      open Property
    in
      val compressionTypeProp = {get = fn x => get "compression-type" GtkSourceCompressionType.t x}
      val encodingProp = {get = fn x => get "encoding" GtkSourceEncodingRecord.tOpt x}
      val locationProp =
        {
          get = fn x => get "location" GioFileClass.tOpt x,
          set = fn x => set "location" GioFileClass.tOpt x,
          new = fn x => new "location" GioFileClass.tOpt x
        }
      val newlineTypeProp = {get = fn x => get "newline-type" GtkSourceNewlineType.t x}
      val readOnlyProp = {get = fn x => get "read-only" boolean x}
    end
  end
