structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class = 'a GtkEntryBufferClass.class =
  struct
    val getType_ = _import "gtk_entry_buffer_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_entry_buffer_new" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Int.C.val_
               -> GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val deleteText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_buffer_delete_text" :
              GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p
               * FFI.UInt.C.val_
               * FFI.Int.C.val_
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val emitDeletedText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_buffer_emit_deleted_text" :
              GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val emitInsertedText_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_entry_buffer_emit_inserted_text" :
              GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p
               * FFI.UInt.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getBytes_ = _import "gtk_entry_buffer_get_bytes" : GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p -> FFI.Size.C.val_;
    val getLength_ = _import "gtk_entry_buffer_get_length" : GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p -> FFI.UInt.C.val_;
    val getMaxLength_ = _import "gtk_entry_buffer_get_max_length" : GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p -> FFI.Int.C.val_;
    val getText_ = _import "gtk_entry_buffer_get_text" : GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val insertText_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_entry_buffer_insert_text" :
              GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p
               * FFI.UInt.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setMaxLength_ = fn x1 & x2 => (_import "gtk_entry_buffer_set_max_length" : GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_entry_buffer_set_text" :
              GtkEntryBufferClass.C.notnull GtkEntryBufferClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
