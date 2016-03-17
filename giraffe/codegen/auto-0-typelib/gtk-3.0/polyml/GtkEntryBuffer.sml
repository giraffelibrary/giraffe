structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class = 'a GtkEntryBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_buffer_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_entry_buffer_new") (Utf8.PolyML.cInOptPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val deleteText_ =
        call (load_sym libgtk "gtk_entry_buffer_delete_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.UInt32.PolyML.cVal
          )
      val emitDeletedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_deleted_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val emitInsertedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_inserted_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getBytes_ = call (load_sym libgtk "gtk_entry_buffer_get_bytes") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
      val getLength_ = call (load_sym libgtk "gtk_entry_buffer_get_length") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_get_max_length") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_entry_buffer_get_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insertText_ =
        call (load_sym libgtk "gtk_entry_buffer_insert_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.UInt32.PolyML.cVal
          )
      val setMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_set_max_length") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setText_ =
        call (load_sym libgtk "gtk_entry_buffer_set_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GtkEntryBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialChars nInitialChars = (Utf8.C.withOptPtr &&&> FFI.Int32.C.withVal ---> GtkEntryBufferClass.C.fromPtr true) new_ (initialChars & nInitialChars)
    fun deleteText self position nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.UInt32.C.fromVal
      )
        deleteText_
        (
          self
           & position
           & nChars
        )
    fun emitDeletedText self position nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        emitInsertedText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun getBytes self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getBytes_ self
    fun getLength self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getLength_ self
    fun getMaxLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxLength_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun insertText self position chars nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.UInt32.C.fromVal
      )
        insertText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun setMaxLength self maxLength = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxLength_ (self & maxLength)
    fun setText self chars nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
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
