structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class_t = 'a GtkEditableClass.t =
  struct
    val getType_ = _import "gtk_editable_get_type" : unit -> GObjectType.C.val_;
    val copyClipboard_ = _import "gtk_editable_copy_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val cutClipboard_ = _import "gtk_editable_cut_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val deleteSelection_ = _import "gtk_editable_delete_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val deleteText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_delete_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getChars_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_get_chars" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEditable_ = _import "gtk_editable_get_editable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getPosition_ = _import "gtk_editable_get_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_get_selection_bounds" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val insertText_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_editable_insert_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val pasteClipboard_ = _import "gtk_editable_paste_clipboard" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_select_region" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEditable_ = fn x1 & x2 => (_import "gtk_editable_set_editable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_editable_set_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkEditableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyClipboard self = (GObjectObjectClass.C.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GObjectObjectClass.C.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GObjectObjectClass.C.withPtr ---> I) deleteSelection_ self
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
    fun getChars self startPos endPos =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.String.fromPtr true
      )
        getChars_
        (
          self
           & startPos
           & endPos
        )
    fun getEditable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getEditable_ self
    fun getPosition self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getPosition_ self
    fun getSelectionBounds self =
      let
        val startPos
         & endPos
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
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
             &&&> FFI.String.withConstPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal && I
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
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startPos
           & endPos
        )
    fun setEditable self isEditable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setEditable_ (self & isEditable)
    fun setPosition self position = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setPosition_ (self & position)
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
