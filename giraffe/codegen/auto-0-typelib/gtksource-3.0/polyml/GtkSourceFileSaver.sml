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
    fun new (buffer, file) = (GtkSourceBufferClass.FFI.withPtr &&&> GtkSourceFileClass.FFI.withPtr ---> GtkSourceFileSaverClass.FFI.fromPtr true) new_ (buffer & file)
    fun newWithTarget
      (
        buffer,
        file,
        targetLocation
      ) =
      (
        GtkSourceBufferClass.FFI.withPtr
         &&&> GtkSourceFileClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         ---> GtkSourceFileSaverClass.FFI.fromPtr true
      )
        newWithTarget_
        (
          buffer
           & file
           & targetLocation
        )
    fun getBuffer self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getCompressionType self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceCompressionType.FFI.fromVal) getCompressionType_ self
    fun getEncoding self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceEncodingRecord.FFI.fromPtr false) getEncoding_ self
    fun getFile self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceFileClass.FFI.fromPtr false) getFile_ self
    fun getFlags self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceFileSaverFlags.FFI.fromVal) getFlags_ self
    fun getLocation self = (GtkSourceFileSaverClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getLocation_ self
    fun getNewlineType self = (GtkSourceFileSaverClass.FFI.withPtr ---> GtkSourceNewlineType.FFI.fromVal) getNewlineType_ self
    fun saveFinish self result =
      (
        GtkSourceFileSaverClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        saveFinish_
        (
          self
           & result
           & []
        )
    fun setCompressionType self compressionType = (GtkSourceFileSaverClass.FFI.withPtr &&&> GtkSourceCompressionType.FFI.withVal ---> I) setCompressionType_ (self & compressionType)
    fun setEncoding self encoding = (GtkSourceFileSaverClass.FFI.withPtr &&&> GtkSourceEncodingRecord.FFI.withOptPtr ---> I) setEncoding_ (self & encoding)
    fun setFlags self flags = (GtkSourceFileSaverClass.FFI.withPtr &&&> GtkSourceFileSaverFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setNewlineType self newlineType = (GtkSourceFileSaverClass.FFI.withPtr &&&> GtkSourceNewlineType.FFI.withVal ---> I) setNewlineType_ (self & newlineType)
    local
      open Property
    in
      val bufferProp =
        {
          get = fn x => get "buffer" GtkSourceBufferClass.tOpt x,
          new = fn x => new "buffer" GtkSourceBufferClass.tOpt x
        }
      val compressionTypeProp =
        {
          get = fn x => get "compression-type" GtkSourceCompressionType.t x,
          set = fn x => set "compression-type" GtkSourceCompressionType.t x,
          new = fn x => new "compression-type" GtkSourceCompressionType.t x
        }
      val encodingProp =
        {
          get = fn x => get "encoding" GtkSourceEncodingRecord.tOpt x,
          set = fn x => set "encoding" GtkSourceEncodingRecord.tOpt x,
          new = fn x => new "encoding" GtkSourceEncodingRecord.tOpt x
        }
      val fileProp =
        {
          get = fn x => get "file" GtkSourceFileClass.tOpt x,
          new = fn x => new "file" GtkSourceFileClass.tOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GtkSourceFileSaverFlags.t x,
          set = fn x => set "flags" GtkSourceFileSaverFlags.t x,
          new = fn x => new "flags" GtkSourceFileSaverFlags.t x
        }
      val locationProp =
        {
          get = fn x => get "location" GioFileClass.tOpt x,
          new = fn x => new "location" GioFileClass.tOpt x
        }
      val newlineTypeProp =
        {
          get = fn x => get "newline-type" GtkSourceNewlineType.t x,
          set = fn x => set "newline-type" GtkSourceNewlineType.t x,
          new = fn x => new "newline-type" GtkSourceNewlineType.t x
        }
    end
  end
