structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class = 'a GtkEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_editable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copyClipboard_ = call (getSymbol "gtk_editable_copy_clipboard") (GtkEditableClass.PolyML.cPtr --> cVoid)
      val cutClipboard_ = call (getSymbol "gtk_editable_cut_clipboard") (GtkEditableClass.PolyML.cPtr --> cVoid)
      val deleteSelection_ = call (getSymbol "gtk_editable_delete_selection") (GtkEditableClass.PolyML.cPtr --> cVoid)
      val deleteText_ =
        call (getSymbol "gtk_editable_delete_text")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val getChars_ =
        call (getSymbol "gtk_editable_get_chars")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getEditable_ = call (getSymbol "gtk_editable_get_editable") (GtkEditableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPosition_ = call (getSymbol "gtk_editable_get_position") (GtkEditableClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSelectionBounds_ =
        call (getSymbol "gtk_editable_get_selection_bounds")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val insertText_ =
        call (getSymbol "gtk_editable_insert_text")
          (
            GtkEditableClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val pasteClipboard_ = call (getSymbol "gtk_editable_paste_clipboard") (GtkEditableClass.PolyML.cPtr --> cVoid)
      val selectRegion_ =
        call (getSymbol "gtk_editable_select_region")
          (
            GtkEditableClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setEditable_ = call (getSymbol "gtk_editable_set_editable") (GtkEditableClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPosition_ = call (getSymbol "gtk_editable_set_position") (GtkEditableClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copyClipboard self = (GtkEditableClass.FFI.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GtkEditableClass.FFI.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GtkEditableClass.FFI.withPtr ---> I) deleteSelection_ self
    fun deleteText self (startPos, endPos) =
      (
        GtkEditableClass.FFI.withPtr
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
    fun getChars self (startPos, endPos) =
      (
        GtkEditableClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        getChars_
        (
          self
           & startPos
           & endPos
        )
    fun getEditable self = (GtkEditableClass.FFI.withPtr ---> GBool.FFI.fromVal) getEditable_ self
    fun getPosition self = (GtkEditableClass.FFI.withPtr ---> GInt32.FFI.fromVal) getPosition_ self
    fun getSelectionBounds self =
      let
        val startPos
         & endPos
         & retVal =
          (
            GtkEditableClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSelectionBounds_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun insertText
      self
      (
        newText,
        newTextLength,
        position
      ) =
      let
        val position & () =
          (
            GtkEditableClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && I
          )
            insertText_
            (
              self
               & newText
               & newTextLength
               & position
            )
      in
        position
      end
    fun pasteClipboard self = (GtkEditableClass.FFI.withPtr ---> I) pasteClipboard_ self
    fun selectRegion self (startPos, endPos) =
      (
        GtkEditableClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startPos
           & endPos
        )
    fun setEditable self isEditable = (GtkEditableClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEditable_ (self & isEditable)
    fun setPosition self position = (GtkEditableClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setPosition_ (self & position)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun deleteTextSig f = signal "delete-text" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn startPos & endPos => f (startPos, endPos))
      fun insertTextSig f =
        signal "insert-text"
          (
            get 0w1 string
             &&&> get 0w2 int
             &&&> get 0w3 int
             ---> set 0w3 int && ret_void
          )
          (
            fn
              newText
               & newTextLength
               & position =>
                let
                  val position =
                    f
                      (
                        newText,
                        newTextLength,
                        position
                      )
                in
                  position & ()
                end
          )
    end
  end
