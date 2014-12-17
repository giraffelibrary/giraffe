structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class_t = 'a GtkEntryBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_buffer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_entry_buffer_new") (FFI.String.PolyML.INOPTPTR &&> FFI.Int.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val deleteText_ =
        call (load_sym libgtk "gtk_entry_buffer_delete_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.UInt.PolyML.VAL
          )
      val emitDeletedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_deleted_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val emitInsertedText_ =
        call (load_sym libgtk "gtk_entry_buffer_emit_inserted_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getBytes_ = call (load_sym libgtk "gtk_entry_buffer_get_bytes") (GObjectObjectClass.PolyML.PTR --> FFI.Size.PolyML.VAL)
      val getLength_ = call (load_sym libgtk "gtk_entry_buffer_get_length") (GObjectObjectClass.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val getMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_get_max_length") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getText_ = call (load_sym libgtk "gtk_entry_buffer_get_text") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val insertText_ =
        call (load_sym libgtk "gtk_entry_buffer_insert_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.UInt.PolyML.VAL
          )
      val setMaxLength_ = call (load_sym libgtk "gtk_entry_buffer_set_max_length") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setText_ =
        call (load_sym libgtk "gtk_entry_buffer_set_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkEntryBufferClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new initialChars nInitialChars = (FFI.String.C.withConstOptPtr &&&> FFI.Int.C.withVal ---> GtkEntryBufferClass.C.fromPtr true) new_ (initialChars & nInitialChars)
    fun deleteText self position nChars =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.String.C.withConstPtr
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
    fun getBytes self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getBytes_ self
    fun getLength self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getLength_ self
    fun getMaxLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxLength_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getText_ self
    fun insertText self position chars nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.String.C.withConstPtr
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
    fun setMaxLength self maxLength = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxLength_ (self & maxLength)
    fun setText self chars nChars =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
