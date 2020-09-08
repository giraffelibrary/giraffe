structure GtkEntryBuffer :>
  GTK_ENTRY_BUFFER
    where type 'a class = 'a GtkEntryBufferClass.class =
  struct
    val getType_ = _import "gtk_entry_buffer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_entry_buffer_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p;
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
              GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p
               * GUInt.FFI.val_
               * GInt.FFI.val_
               -> GUInt.FFI.val_;
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
              GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
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
              GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p
               * GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getBytes_ = _import "gtk_entry_buffer_get_bytes" : GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p -> GSize.FFI.val_;
    val getLength_ = _import "gtk_entry_buffer_get_length" : GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p -> GUInt.FFI.val_;
    val getMaxLength_ = _import "gtk_entry_buffer_get_max_length" : GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p -> GInt.FFI.val_;
    val getText_ = _import "gtk_entry_buffer_get_text" : GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val insertText_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_entry_buffer_insert_text" :
              GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p
               * GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setMaxLength_ = fn x1 & x2 => (_import "gtk_entry_buffer_set_max_length" : GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_entry_buffer_set_text" :
              GtkEntryBufferClass.FFI.non_opt GtkEntryBufferClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (initialChars, nInitialChars) = (Utf8.FFI.withOptPtr 0 &&&> GInt.FFI.withVal ---> GtkEntryBufferClass.FFI.fromPtr true) new_ (initialChars & nInitialChars)
    fun deleteText self (position, nChars) =
      (
        GtkEntryBufferClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GUInt.FFI.fromVal
      )
        deleteText_
        (
          self
           & position
           & nChars
        )
    fun emitDeletedText self (position, nChars) =
      (
        GtkEntryBufferClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        emitDeletedText_
        (
          self
           & position
           & nChars
        )
    fun emitInsertedText
      self
      (
        position,
        chars,
        nChars
      ) =
      (
        GtkEntryBufferClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt.FFI.withVal
         ---> I
      )
        emitInsertedText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun getBytes self = (GtkEntryBufferClass.FFI.withPtr false ---> GSize.FFI.fromVal) getBytes_ self
    fun getLength self = (GtkEntryBufferClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getLength_ self
    fun getMaxLength self = (GtkEntryBufferClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMaxLength_ self
    fun getText self = (GtkEntryBufferClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getText_ self
    fun insertText
      self
      (
        position,
        chars,
        nChars
      ) =
      (
        GtkEntryBufferClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GUInt.FFI.fromVal
      )
        insertText_
        (
          self
           & position
           & chars
           & nChars
        )
    fun setMaxLength self maxLength = (GtkEntryBufferClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMaxLength_ (self & maxLength)
    fun setText self (chars, nChars) =
      (
        GtkEntryBufferClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
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
      fun deletedTextSig f = signal "deleted-text" (get 0w1 uint &&&> get 0w2 uint ---> ret_void) (fn position & nChars => f (position, nChars))
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
                f
                  (
                    position,
                    chars,
                    nChars
                  )
          )
    end
    local
      open ValueAccessor
    in
      val lengthProp =
        {
          name = "length",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = ignore
        }
      val maxLengthProp =
        {
          name = "max-length",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
