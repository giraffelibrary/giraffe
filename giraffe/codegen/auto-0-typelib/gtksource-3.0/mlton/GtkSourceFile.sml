structure GtkSourceFile :>
  GTK_SOURCE_FILE
    where type 'a class = 'a GtkSourceFileClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type newline_type_t = GtkSourceNewlineType.t =
  struct
    val getType_ = _import "gtk_source_file_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_file_new" : unit -> GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p;
    val checkFileOnDisk_ = _import "gtk_source_file_check_file_on_disk" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> unit;
    val getCompressionType_ = _import "gtk_source_file_get_compression_type" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GtkSourceCompressionType.FFI.val_;
    val getEncoding_ = _import "gtk_source_file_get_encoding" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    val getLocation_ = _import "gtk_source_file_get_location" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getNewlineType_ = _import "gtk_source_file_get_newline_type" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GtkSourceNewlineType.FFI.val_;
    val isDeleted_ = _import "gtk_source_file_is_deleted" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isExternallyModified_ = _import "gtk_source_file_is_externally_modified" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isLocal_ = _import "gtk_source_file_is_local" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val isReadonly_ = _import "gtk_source_file_is_readonly" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GBool.FFI.val_;
    val setLocation_ = fn x1 & x2 => (_import "gtk_source_file_set_location" : GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p * GioFileClass.FFI.opt GioFileClass.FFI.p -> unit;) (x1, x2)
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
