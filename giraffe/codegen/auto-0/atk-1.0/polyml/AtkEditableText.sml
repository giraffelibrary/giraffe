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
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val cutText_ =
        call (load_sym libatk "atk_editable_text_cut_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val deleteText_ =
        call (load_sym libatk "atk_editable_text_delete_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val pasteText_ = call (load_sym libatk "atk_editable_text_paste_text") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setTextContents_ = call (load_sym libatk "atk_editable_text_set_text_contents") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a AtkEditableTextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyText self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun pasteText self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setTextContents_ (self & string)
  end
