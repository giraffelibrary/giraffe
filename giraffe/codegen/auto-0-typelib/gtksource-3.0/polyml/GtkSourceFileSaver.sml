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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_file_saver_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_file_saver_new") (GtkSourceBufferClass.PolyML.cPtr &&> GtkSourceFileClass.PolyML.cPtr --> GtkSourceFileSaverClass.PolyML.cPtr)
      val newWithTarget_ =
        call (getSymbol "gtk_source_file_saver_new_with_target")
          (
            GtkSourceBufferClass.PolyML.cPtr
             &&> GtkSourceFileClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             --> GtkSourceFileSaverClass.PolyML.cPtr
          )
      val getBuffer_ = call (getSymbol "gtk_source_file_saver_get_buffer") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceBufferClass.PolyML.cPtr)
      val getCompressionType_ = call (getSymbol "gtk_source_file_saver_get_compression_type") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceCompressionType.PolyML.cVal)
      val getEncoding_ = call (getSymbol "gtk_source_file_saver_get_encoding") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceEncodingRecord.PolyML.cPtr)
      val getFile_ = call (getSymbol "gtk_source_file_saver_get_file") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceFileClass.PolyML.cPtr)
      val getFlags_ = call (getSymbol "gtk_source_file_saver_get_flags") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceFileSaverFlags.PolyML.cVal)
      val getLocation_ = call (getSymbol "gtk_source_file_saver_get_location") (GtkSourceFileSaverClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getNewlineType_ = call (getSymbol "gtk_source_file_saver_get_newline_type") (GtkSourceFileSaverClass.PolyML.cPtr --> GtkSourceNewlineType.PolyML.cVal)
      val saveFinish_ =
        call (getSymbol "gtk_source_file_saver_save_finish")
          (
            GtkSourceFileSaverClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setCompressionType_ = call (getSymbol "gtk_source_file_saver_set_compression_type") (GtkSourceFileSaverClass.PolyML.cPtr &&> GtkSourceCompressionType.PolyML.cVal --> cVoid)
      val setEncoding_ = call (getSymbol "gtk_source_file_saver_set_encoding") (GtkSourceFileSaverClass.PolyML.cPtr &&> GtkSourceEncodingRecord.PolyML.cOptPtr --> cVoid)
      val setFlags_ = call (getSymbol "gtk_source_file_saver_set_flags") (GtkSourceFileSaverClass.PolyML.cPtr &&> GtkSourceFileSaverFlags.PolyML.cVal --> cVoid)
      val setNewlineType_ = call (getSymbol "gtk_source_file_saver_set_newline_type") (GtkSourceFileSaverClass.PolyML.cPtr &&> GtkSourceNewlineType.PolyML.cVal --> cVoid)
    end
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
