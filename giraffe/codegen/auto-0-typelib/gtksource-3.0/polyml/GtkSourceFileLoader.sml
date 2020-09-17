structure GtkSourceFileLoader :>
  GTK_SOURCE_FILE_LOADER
    where type 'a class = 'a GtkSourceFileLoaderClass.class
    where type compression_type_t = GtkSourceCompressionType.t
    where type encoding_t = GtkSourceEncodingRecord.t
    where type newline_type_t = GtkSourceNewlineType.t
    where type 'a buffer_class = 'a GtkSourceBufferClass.class
    where type 'a file_class = 'a GtkSourceFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_file_loader_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_file_loader_new") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceFileClass.PolyML.cPtr --> GtkSourceFileLoaderClass.PolyML.cPtr)
      val newFromStream_ =
        call (getSymbol "gtk_source_file_loader_new_from_stream")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkSourceFileClass.PolyML.cPtr
             &&> GioInputStreamClass.PolyML.cPtr
             --> GtkSourceFileLoaderClass.PolyML.cPtr
          )
      val getBuffer_ = call (getSymbol "gtk_source_file_loader_get_buffer") (GtkSourceFileLoaderClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val getCompressionType_ = call (getSymbol "gtk_source_file_loader_get_compression_type") (GtkSourceFileLoaderClass.PolyML.cPtr --> GtkSourceCompressionType.PolyML.cVal)
      val getEncoding_ = call (getSymbol "gtk_source_file_loader_get_encoding") (GtkSourceFileLoaderClass.PolyML.cPtr --> GtkSourceEncodingRecord.PolyML.cPtr)
      val getFile_ = call (getSymbol "gtk_source_file_loader_get_file") (GtkSourceFileLoaderClass.PolyML.cPtr --> GtkSourceFileClass.PolyML.cPtr)
      val getInputStream_ = call (getSymbol "gtk_source_file_loader_get_input_stream") (GtkSourceFileLoaderClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cOptPtr)
      val getLocation_ = call (getSymbol "gtk_source_file_loader_get_location") (GtkSourceFileLoaderClass.PolyML.cPtr --> GioFileClass.PolyML.cOptPtr)
      val getNewlineType_ = call (getSymbol "gtk_source_file_loader_get_newline_type") (GtkSourceFileLoaderClass.PolyML.cPtr --> GtkSourceNewlineType.PolyML.cVal)
      val loadFinish_ =
        call (getSymbol "gtk_source_file_loader_load_finish")
          (
            GtkSourceFileLoaderClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkSourceFileLoaderClass.class
    type compression_type_t = GtkSourceCompressionType.t
    type encoding_t = GtkSourceEncodingRecord.t
    type newline_type_t = GtkSourceNewlineType.t
    type 'a buffer_class = 'a GtkSourceBufferClass.class
    type 'a file_class = 'a GtkSourceFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (buffer, file) = (GtkSourceBufferClass.FFI.withPtr false &&&> GtkSourceFileClass.FFI.withPtr false ---> GtkSourceFileLoaderClass.FFI.fromPtr true) new_ (buffer & file)
    fun newFromStream
      (
        buffer,
        file,
        stream
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr false
         &&&> GtkSourceFileClass.FFI.withPtr false
         &&&> GioInputStreamClass.FFI.withPtr false
         ---> GtkSourceFileLoaderClass.FFI.fromPtr true
      )
        newFromStream_
        (
          buffer
           & file
           & stream
        )
    fun getBuffer self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self before GtkSourceFileLoaderClass.FFI.touchPtr self
    fun getCompressionType self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self before GtkSourceFileLoaderClass.FFI.touchPtr self
    fun getFile self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GtkSourceFileClass.FFI.fromPtr false) getFile_ self before GtkSourceFileLoaderClass.FFI.touchPtr self
    fun getInputStream self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromOptPtr false) getInputStream_ self before GtkSourceFileLoaderClass.FFI.touchPtr self
    fun getLocation self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GioFileClass.FFI.fromOptPtr false) getLocation_ self before GtkSourceFileLoaderClass.FFI.touchPtr self
    fun getNewlineType self = (GtkSourceFileLoaderClass.FFI.withPtr false ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun loadFinish self result =
      (
        GtkSourceFileLoaderClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
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
      val fileProp =
        {
          name = "file",
          gtype = fn () => C.gtype GtkSourceFileClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkSourceFileClass.tOpt x
        }
      val inputStreamProp =
        {
          name = "input-stream",
          gtype = fn () => C.gtype GioInputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioInputStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioInputStreamClass.tOpt x
        }
      val locationProp =
        {
          name = "location",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = fn x => fn () => C.get GioFileClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
    end
  end
