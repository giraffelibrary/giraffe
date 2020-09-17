structure GtkSourceFileSaver :>
  GTK_SOURCE_FILE_SAVER
    where type 'a class = 'a GtkSourceFileSaverClass.class
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type 'a file_class = 'a GtkSourceFileClass.class
    where type file_saver_flags_t = GtkSourceFileSaverFlags.t
    where type newline_type_t = GtkSourceNewlineType.t =
  struct
    val getType_ = _import "gtk_source_file_saver_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_source_file_saver_new" : GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p * GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p;) (x1, x2)
    val newWithTarget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_file_saver_new_with_target" :
              GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p
               * GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p
               * GioFileClass.FFI.non_opt GioFileClass.FFI.p
               -> GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_source_file_saver_get_buffer" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p;
    val getCompressionType_ = _import "gtk_source_file_saver_get_compression_type" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceCompressionType.FFI.val_;
    val getEncoding_ = _import "gtk_source_file_saver_get_encoding" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    val getFile_ = _import "gtk_source_file_saver_get_file" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p;
    val getFlags_ = _import "gtk_source_file_saver_get_flags" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceFileSaverFlags.FFI.val_;
    val getLocation_ = _import "gtk_source_file_saver_get_location" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GioFileClass.FFI.non_opt GioFileClass.FFI.p;
    val getNewlineType_ = _import "gtk_source_file_saver_get_newline_type" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p -> GtkSourceNewlineType.FFI.val_;
    val saveFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_file_saver_save_finish" :
              GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setCompressionType_ = fn x1 & x2 => (_import "gtk_source_file_saver_set_compression_type" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p * GtkSourceCompressionType.FFI.val_ -> unit;) (x1, x2)
    val setEncoding_ = fn x1 & x2 => (_import "gtk_source_file_saver_set_encoding" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p * GtkSourceEncodingRecord.FFI.opt GtkSourceEncodingRecord.FFI.p -> unit;) (x1, x2)
    val setFlags_ = fn x1 & x2 => (_import "gtk_source_file_saver_set_flags" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p * GtkSourceFileSaverFlags.FFI.val_ -> unit;) (x1, x2)
    val setNewlineType_ = fn x1 & x2 => (_import "gtk_source_file_saver_set_newline_type" : GtkSourceFileSaverClass.FFI.non_opt GtkSourceFileSaverClass.FFI.p * GtkSourceNewlineType.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceFileSaverClass.class
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type compression_type_t = GtkSourceCompressionType.t
    type encoding_t = GtkSourceEncodingRecord.t
    type 'a file_class = 'a GtkSourceFileClass.class
    type file_saver_flags_t = GtkSourceFileSaverFlags.t
    type newline_type_t = GtkSourceNewlineType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (buffer, file) = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceFileClass.FFI.withPtr false ---> GtkSourceFileSaverClass.FFI.fromPtr true) new_ (buffer & file)
    fun newWithTarget
      (
        buffer,
        file,
        targetLocation
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkSourceFileClass.FFI.withPtr false
         &&&> GioFileClass.FFI.withPtr false
         ---> GtkSourceFileSaverClass.FFI.fromPtr true
      )
        newWithTarget_
        (
          buffer
           & file
           & targetLocation
        )
    fun getBuffer self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self before GtkSourceFileSaverClass.FFI.touchPtr self
    fun getCompressionType self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self before GtkSourceFileSaverClass.FFI.touchPtr self
    fun getFile self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceFileClass.FFI.fromPtr false) getFile_ self before GtkSourceFileSaverClass.FFI.touchPtr self
    fun getFlags self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceFileSaverFlags.FFI.fromVal) getFlags_ self
    fun getLocation self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr false) getLocation_ self before GtkSourceFileSaverClass.FFI.touchPtr self
    fun getNewlineType self = (GtkSourceFileSaverClass.FFI.withPtr false ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun saveFinish self result =
      (
        GtkSourceFileSaverClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveFinish_
        (
          self
           & result
           & []
        )
    fun setCompressionType self compressionType = (GtkSourceFileSaverClass.FFI.withPtr false &&&> GtkSourceCompressionType.FFI.withVal ---> I) setCompressionType_ (self & compressionType)
    fun setEncoding self encoding = (GtkSourceFileSaverClass.FFI.withPtr false &&&> GtkSourceEncodingRecord.FFI.withOptPtr false ---> I) setEncoding_ (self & encoding)
    fun setFlags self flags = (GtkSourceFileSaverClass.FFI.withPtr false &&&> GtkSourceFileSaverFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setNewlineType self newlineType = (GtkSourceFileSaverClass.FFI.withPtr false &&&> GtkSourceNewlineType.FFI.withVal ---> I) setNewlineType_ (self & newlineType)
    local
      open ValueAccessor
    in
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkSourceBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceBufferClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceBufferClass.tOpt x
        }
      val compressionTypeProp =
        {
          name = "compression-type",
          gtype = fn () => C.gtype GtkSourceCompressionType.t (),
          get = fn x => fn () => C.get GtkSourceCompressionType.t x,
          set = fn x => C.set GtkSourceCompressionType.t x,
          init = fn x => C.set GtkSourceCompressionType.t x
        }
      val encodingProp =
        {
          name = "encoding",
          gtype = fn () => C.gtype GtkSourceEncodingRecord.tOpt (),
          get = fn x => fn () => C.get GtkSourceEncodingRecord.tOpt x,
          set = fn x => C.set GtkSourceEncodingRecord.tOpt x,
          init = fn x => C.set GtkSourceEncodingRecord.tOpt x
        }
      val fileProp =
        {
          name = "file",
          gtype = fn () => C.gtype GtkSourceFileClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceFileClass.tOpt x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GtkSourceFileSaverFlags.t (),
          get = fn x => fn () => C.get GtkSourceFileSaverFlags.t x,
          set = fn x => C.set GtkSourceFileSaverFlags.t x,
          init = fn x => C.set GtkSourceFileSaverFlags.t x
        }
      val locationProp =
        {
          name = "location",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
      val newlineTypeProp =
        {
          name = "newline-type",
          gtype = fn () => C.gtype GtkSourceNewlineType.t (),
          get = fn x => fn () => C.get GtkSourceNewlineType.t x,
          set = fn x => C.set GtkSourceNewlineType.t x,
          init = fn x => C.set GtkSourceNewlineType.t x
        }
    end
  end
