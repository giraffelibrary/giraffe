structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class_t = 'a AtkEditableTextClass.t =
  struct
    val getType_ = _import "atk_editable_text_get_type" : unit -> GObjectType.C.val_;
    val copyText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_editable_text_copy_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val pasteText_ = fn x1 & x2 => (_import "atk_editable_text_paste_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTextContents_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_atk_editable_text_set_text_contents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a AtkEditableTextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyText self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun pasteText self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTextContents_ (self & string)
  end
