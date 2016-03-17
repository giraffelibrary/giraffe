structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class = 'a GtkEditableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_editable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val copyClipboard_ = call (load_sym libgtk "gtk_editable_copy_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val cutClipboard_ = call (load_sym libgtk "gtk_editable_cut_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deleteSelection_ = call (load_sym libgtk "gtk_editable_delete_selection") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deleteText_ =
        call (load_sym libgtk "gtk_editable_delete_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getChars_ =
        call (load_sym libgtk "gtk_editable_get_chars")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val getEditable_ = call (load_sym libgtk "gtk_editable_get_editable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPosition_ = call (load_sym libgtk "gtk_editable_get_position") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSelectionBounds_ =
        call (load_sym libgtk "gtk_editable_get_selection_bounds")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val insertText_ =
        call (load_sym libgtk "gtk_editable_insert_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val pasteClipboard_ = call (load_sym libgtk "gtk_editable_paste_clipboard") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectRegion_ =
        call (load_sym libgtk "gtk_editable_select_region")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setEditable_ = call (load_sym libgtk "gtk_editable_set_editable") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPosition_ = call (load_sym libgtk "gtk_editable_set_position") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyClipboard self = (GObjectObjectClass.C.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GObjectObjectClass.C.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GObjectObjectClass.C.withPtr ---> I) deleteSelection_ self
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
    fun getChars self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> Utf8.C.fromPtr true
      )
        getChars_
        (
          self
           & startPos
           & endPos
        )
    fun getEditable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEditable_ self
    fun getPosition self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getPosition_ self
    fun getSelectionBounds self =
      let
        val startPos
         & endPos
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSelectionBounds_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun insertText self newText newTextLength position =
      let
        val position & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal && I
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
    fun pasteClipboard self = (GObjectObjectClass.C.withPtr ---> I) pasteClipboard_ self
    fun selectRegion self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startPos
           & endPos
        )
    fun setEditable self isEditable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEditable_ (self & isEditable)
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPosition_ (self & position)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun deleteTextSig f = signal "delete-text" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn startPos & endPos => f startPos endPos)
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
                  val position = f newText newTextLength position
                in
                  position & ()
                end
          )
    end
  end
