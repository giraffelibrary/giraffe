structure AtkEditableText :>
  ATK_EDITABLE_TEXT
    where type 'a class = 'a AtkEditableTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_editable_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copyText_ =
        call (getSymbol "atk_editable_text_copy_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val cutText_ =
        call (getSymbol "atk_editable_text_cut_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val deleteText_ =
        call (getSymbol "atk_editable_text_delete_text")
          (
            AtkEditableTextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val pasteText_ = call (getSymbol "atk_editable_text_paste_text") (AtkEditableTextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setTextContents_ = call (getSymbol "atk_editable_text_set_text_contents") (AtkEditableTextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a AtkEditableTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copyText self startPos endPos =
      (
        AtkEditableTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        AtkEditableTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        AtkEditableTextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        deleteText_
        (
          self
           & startPos
           & endPos
        )
    fun pasteText self position = (AtkEditableTextClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) pasteText_ (self & position)
    fun setTextContents self string = (AtkEditableTextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTextContents_ (self & string)
  end
