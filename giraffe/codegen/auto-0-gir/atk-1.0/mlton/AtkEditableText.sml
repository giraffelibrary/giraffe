structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class = 'a AtkEditableTextClass.class =
  struct
    val getType_ = _import "atk_editable_text_get_type" : unit -> GObjectType.FFI.val_;
    val copyText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_editable_text_copy_text" :
              AtkEditableTextClass.FFI.non_opt AtkEditableTextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
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
              AtkEditableTextClass.FFI.non_opt AtkEditableTextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
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
              AtkEditableTextClass.FFI.non_opt AtkEditableTextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteText_ = fn x1 & x2 => (_import "atk_editable_text_paste_text" : AtkEditableTextClass.FFI.non_opt AtkEditableTextClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTextContents_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_editable_text_set_text_contents" :
              AtkEditableTextClass.FFI.non_opt AtkEditableTextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkEditableTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copyText self (startPos, endPos) =
      (
        AtkEditableTextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        copyText_
        (
          self
           & startPos
           & endPos
        )
    fun cutText self (startPos, endPos) =
      (
        AtkEditableTextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        cutText_
        (
          self
           & startPos
           & endPos
        )
    fun deleteText self (startPos, endPos) =
      (
        AtkEditableTextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun pasteText self position = (AtkEditableTextClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (AtkEditableTextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTextContents_ (self & string)
  end
