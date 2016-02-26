structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class_t = 'a AtkEditableTextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_editable_text_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val copyText_ =
        call (load_sym libatk "atk_editable_text_copy_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val cutText_ =
        call (load_sym libatk "atk_editable_text_cut_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val deleteText_ =
        call (load_sym libatk "atk_editable_text_delete_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val pasteText_ = call (load_sym libatk "atk_editable_text_paste_text") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTextContents_ = call (load_sym libatk "atk_editable_text_set_text_contents") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a AtkEditableTextClass.t
    type t = base class_t
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
    fun setTextContents self string = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTextContents_ (self & string)
  end
