structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class_t = 'a GtkEditableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_editable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copyClipboard_ = call (load_sym libgtk "gtk_editable_copy_clipboard") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val cutClipboard_ = call (load_sym libgtk "gtk_editable_cut_clipboard") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deleteSelection_ = call (load_sym libgtk "gtk_editable_delete_selection") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deleteText_ =
        call (load_sym libgtk "gtk_editable_delete_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getChars_ =
        call (load_sym libgtk "gtk_editable_get_chars")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.String.PolyML.RETPTR
          )
      val getEditable_ = call (load_sym libgtk "gtk_editable_get_editable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPosition_ = call (load_sym libgtk "gtk_editable_get_position") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getSelectionBounds_ =
        call (load_sym libgtk "gtk_editable_get_selection_bounds")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val insertText_ =
        call (load_sym libgtk "gtk_editable_insert_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val pasteClipboard_ = call (load_sym libgtk "gtk_editable_paste_clipboard") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val selectRegion_ =
        call (load_sym libgtk "gtk_editable_select_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setEditable_ = call (load_sym libgtk "gtk_editable_set_editable") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPosition_ = call (load_sym libgtk "gtk_editable_set_position") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkEditableClass.t
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
         ---> FFI.String.C.fromPtr true
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
               & 0
               & 0
            )
      in
        if retVal then SOME (startPos, endPos) else NONE
      end
    fun insertText self newText newTextLength position =
      let
        val position & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
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
