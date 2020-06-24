structure GtkSourceFileLoader :>
  GTK_SOURCE_FILE_LOADER
    where type 'a class = 'a GtkSourceFileLoaderClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type newline_type_t = GtkSourceNewlineType.t
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a file_class = 'a GtkSourceFileClass.class =
  struct
    val getType_ = _import "gtk_source_file_loader_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_source_file_loader_new" : GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p * GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p -> GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p;) (x1, x2)
    val newFromStream_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_file_loader_new_from_stream" :
              GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p
               * GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p
               * GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               -> GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_source_file_loader_get_buffer" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GtkSourceBufferClass.FFI.non_opt GtkSourceBufferClass.FFI.p;
    val getCompressionType_ = _import "gtk_source_file_loader_get_compression_type" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GtkSourceCompressionType.FFI.val_;
    val getEncoding_ = _import "gtk_source_file_loader_get_encoding" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GtkSourceEncodingRecord.FFI.non_opt GtkSourceEncodingRecord.FFI.p;
    val getFile_ = _import "gtk_source_file_loader_get_file" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GtkSourceFileClass.FFI.non_opt GtkSourceFileClass.FFI.p;
    val getInputStream_ = _import "gtk_source_file_loader_get_input_stream" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GioInputStreamClass.FFI.opt GioInputStreamClass.FFI.p;
    val getLocation_ = _import "gtk_source_file_loader_get_location" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GioFileClass.FFI.opt GioFileClass.FFI.p;
    val getNewlineType_ = _import "gtk_source_file_loader_get_newline_type" : GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p -> GtkSourceNewlineType.FFI.val_;
    val loadFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_file_loader_load_finish" :
              GtkSourceFileLoaderClass.FFI.non_opt GtkSourceFileLoaderClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceFileLoaderClass.class
    type compression_type_t = GtkSourceCompressionType.t
    type encoding_t = GtkSourceEncodingRecord.t
    type newline_type_t = GtkSourceNewlineType.t
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a file_class = 'a GtkSourceFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (buffer, file) = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceFileClass.FFI.withPtr ---> GtkSourceFileLoaderClass.FFI.fromPtr true) new_ (buffer & file)
    fun newFromStream
      (
        buffer,
        file,
        stream
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkSourceFileClass.FFI.withPtr
         &&&> GioInputStreamClass.FFI.withPtr
         ---> GtkSourceFileLoaderClass.FFI.fromPtr true
      )
        newFromStream_
        (
          buffer
           & file
           & stream
        )
    fun getBuffer self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getCompressionType self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self
    fun getFile self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GtkSourceFileClass.FFI.fromPtr false) getFile_ self
    fun getInputStream self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromOptPtr false) getInputStream_ self
    fun getLocation self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GioFileClass.FFI.fromOptPtr false) getLocation_ self
    fun getNewlineType self = (GtkSourceFileLoaderClass.FFI.withPtr ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun loadFinish self result =
      (
        GtkSourceFileLoaderClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFinish_
        (
          self
           & result
           & []
        )
    local
      open Property
    in
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          new = fn x => new "buffer" GtkSourceBufferClass.tOpt x
        }
      val fileProp =
        {
          get = fn x => get "file" GtkSourceFileClass.tOpt x,
          new = fn x => new "file" GtkSourceFileClass.tOpt x
        }
      val inputStreamProp =
        {
          get = fn x => get "input-stream" GioInputStreamClass.tOpt x,
          new = fn x => new "input-stream" GioInputStreamClass.tOpt x
        }
      val locationProp =
        {
          get = fn x => get "location" GioFileClass.tOpt x,
          new = fn x => new "location" GioFileClass.tOpt x
        }
    end
  end
