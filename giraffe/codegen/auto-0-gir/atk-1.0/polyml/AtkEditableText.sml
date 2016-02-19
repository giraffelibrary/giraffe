structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class_t = 'a AtkEditableTextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_editable_text_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copyText_ =
        call (load_sym libatk "atk_editable_text_copy_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val cutText_ =
        call (load_sym libatk "atk_editable_text_cut_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val deleteText_ =
        call (load_sym libatk "atk_editable_text_delete_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val pasteText_ = call (load_sym libatk "atk_editable_text_paste_text") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setTextContents_ = call (load_sym libatk "atk_editable_text_set_text_contents") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a AtkEditableTextClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyText self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun pasteText self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTextContents_ (self & string)
  end
