structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class = 'a GtkEntryBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_entry_buffer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_entry_buffer_new") (Utf8.PolyML.cInOptPtr &&> GInt32.PolyML.cVal --> GtkEntryBufferClass.PolyML.cPtr)
      val deleteText_ =
        call (getSymbol "gtk_entry_buffer_delete_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GUInt32.PolyML.cVal
          )
      val emitDeletedText_ =
        call (getSymbol "gtk_entry_buffer_emit_deleted_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val emitInsertedText_ =
        call (getSymbol "gtk_entry_buffer_emit_inserted_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val getBytes_ = call (getSymbol "gtk_entry_buffer_get_bytes") (GtkEntryBufferClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getLength_ = call (getSymbol "gtk_entry_buffer_get_length") (GtkEntryBufferClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMaxLength_ = call (getSymbol "gtk_entry_buffer_get_max_length") (GtkEntryBufferClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getText_ = call (getSymbol "gtk_entry_buffer_get_text") (GtkEntryBufferClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insertText_ =
        call (getSymbol "gtk_entry_buffer_insert_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> GUInt32.PolyML.cVal
          )
      val setMaxLength_ = call (getSymbol "gtk_entry_buffer_set_max_length") (GtkEntryBufferClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setText_ =
        call (getSymbol "gtk_entry_buffer_set_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkEntryBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new initialChars nInitialChars = (Utf8.FFI.withOptPtr &&&> GInt32.FFI.withVal ---> GtkEntryBufferClass.FFI.fromPtr true) new_ (initialChars & nInitialChars)
    fun deleteText self position nChars =
      (
        GtkEntryBufferClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GUInt32.FFI.fromVal
      )
        deleteText_
        (
          self
           & position
           & nChars
        )
    fun emitDeletedText self position nChars =
      (
        GtkEntryBufferClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        emitDeletedText_
        (
          self
           & position
           & nChars
        )
    fun emitInsertedText self position chars nChars =
      (
        GtkEntryBufferClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        emitInsertedText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun getBytes self = (GtkEntryBufferClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getBytes_ self
    fun getLength self = (GtkEntryBufferClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getLength_ self
    fun getMaxLength self = (GtkEntryBufferClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxLength_ self
    fun getText self = (GtkEntryBufferClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun insertText self position chars nChars =
      (
        GtkEntryBufferClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GUInt32.FFI.fromVal
      )
        insertText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun setMaxLength self maxLength = (GtkEntryBufferClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxLength_ (self & maxLength)
    fun setText self chars nChars =
      (
        GtkEntryBufferClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & chars
           & nChars
        )
    local
      open ClosureMarshal Signal
    in
      fun deletedTextSig f = signal "deleted-text" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn position & nChars => f position nChars)
      fun insertedTextSig f =
        signal "inserted-text"
          (
            get 0w1 uint
             &&&> get 0w2 string
             &&&> get 0w3 uint
             ---> ret_void
          )
          (
            fn
              position
               & chars
               & nChars =>
                f position chars nChars
          )
    end
    local
      open Property
    in
      val lengthProp = {get = fn x => get "length" uint x}
      val maxLengthProp =
        {
          get = fn x => get "max-length" int x,
          set = fn x => set "max-length" int x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
