structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class = 'a AtkEditableTextClass.class =
  struct
    val getType_ = _import "atk_editable_text_get_type" : unit -> GObjectType.C.val_;
    val copyText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_editable_text_copy_text" :
              AtkEditableTextClass.C.notnull AtkEditableTextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val cutText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_editable_text_cut_text" :
              AtkEditableTextClass.C.notnull AtkEditableTextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
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
            _import "atk_editable_text_delete_text" :
              AtkEditableTextClass.C.notnull AtkEditableTextClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteText_ = fn x1 & x2 => (_import "atk_editable_text_paste_text" : AtkEditableTextClass.C.notnull AtkEditableTextClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTextContents_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_editable_text_set_text_contents" :
              AtkEditableTextClass.C.notnull AtkEditableTextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkEditableTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyText self startPos endPos =
      (
        AtkEditableTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        copyText_
        (
          self
           & startPos
           & endPos
        )
    fun cutText self startPos endPos =
      (
        AtkEditableTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        cutText_
        (
          self
           & startPos
           & endPos
        )
    fun deleteText self startPos endPos =
      (
        AtkEditableTextClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun pasteText self position = (AtkEditableTextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (AtkEditableTextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTextContents_ (self & string)
  end
