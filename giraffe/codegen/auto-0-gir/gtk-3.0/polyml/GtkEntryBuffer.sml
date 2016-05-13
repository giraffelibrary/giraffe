structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class = 'a GtkEntryBufferClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_buffer_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_entry_buffer_new") (Utf8.PolyML.cInOptPtr &&> FFI.Int.PolyML.cVal --> GtkEntryBufferClass.PolyML.cPtr)
      val deleteText_ =
        call (load_sym libgtk "gtk_entry_buffer_delete_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.UInt.PolyML.cVal
          )
      val emitDeletedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_deleted_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val emitInsertedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_inserted_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getBytes_ = call (load_sym libgtk "gtk_entry_buffer_get_bytes") (GtkEntryBufferClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val getLength_ = call (load_sym libgtk "gtk_entry_buffer_get_length") (GtkEntryBufferClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_get_max_length") (GtkEntryBufferClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_entry_buffer_get_text") (GtkEntryBufferClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val insertText_ =
        call (load_sym libgtk "gtk_entry_buffer_insert_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.UInt.PolyML.cVal
          )
      val setMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_set_max_length") (GtkEntryBufferClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val setText_ =
        call (load_sym libgtk "gtk_entry_buffer_set_text")
          (
            GtkEntryBufferClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkEntryBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialChars nInitialChars = (Utf8.C.withOptPtr &&&> FFI.Int.C.withVal ---> GtkEntryBufferClass.C.fromPtr true) new_ (initialChars & nInitialChars)
    fun deleteText self position nChars =
      (
        GtkEntryBufferClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.UInt.C.fromVal
      )
        deleteText_
        (
          self
           & position
           & nChars
        )
    fun emitDeletedText self position nChars =
      (
        GtkEntryBufferClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
        GtkEntryBufferClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        emitInsertedText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun getBytes self = (GtkEntryBufferClass.C.withPtr ---> FFI.Size.C.fromVal) getBytes_ self
    fun getLength self = (GtkEntryBufferClass.C.withPtr ---> FFI.UInt.C.fromVal) getLength_ self
    fun getMaxLength self = (GtkEntryBufferClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxLength_ self
    fun getText self = (GtkEntryBufferClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun insertText self position chars nChars =
      (
        GtkEntryBufferClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.UInt.C.fromVal
      )
        insertText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun setMaxLength self maxLength = (GtkEntryBufferClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxLength_ (self & maxLength)
    fun setText self chars nChars =
      (
        GtkEntryBufferClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
