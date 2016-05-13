structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class = 'a AtkEditableTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_editable_text_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copyText_ =
        call (load_sym libatk "atk_editable_text_copy_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val cutText_ =
        call (load_sym libatk "atk_editable_text_cut_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val deleteText_ =
        call (load_sym libatk "atk_editable_text_delete_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val pasteText_ = call (load_sym libatk "atk_editable_text_paste_text") (AtkEditableTextClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTextContents_ = call (load_sym libatk "atk_editable_text_set_text_contents") (AtkEditableTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a AtkEditableTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyText self startPos endPos =
      (
        AtkEditableTextClass.C.withPtr
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
        AtkEditableTextClass.C.withPtr
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
        AtkEditableTextClass.C.withPtr
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
    fun pasteText self position = (AtkEditableTextClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (AtkEditableTextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTextContents_ (self & string)
  end
