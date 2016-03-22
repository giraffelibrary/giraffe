structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class = 'a GtkEditableClass.class =
  struct
    val getType_ = _import "gtk_editable_get_type" : unit -> GObjectType.C.val_;
    val copyClipboard_ = _import "gtk_editable_copy_clipboard" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> unit;
    val cutClipboard_ = _import "gtk_editable_cut_clipboard" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> unit;
    val deleteSelection_ = _import "gtk_editable_delete_selection" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> unit;
    val deleteText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_delete_text" :
              GtkEditableClass.C.notnull GtkEditableClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GtkEditableClass.C.notnull GtkEditableClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEditable_ = _import "gtk_editable_get_editable" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> FFI.Bool.C.val_;
    val getPosition_ = _import "gtk_editable_get_position" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> FFI.Int32.C.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_get_selection_bounds" :
              GtkEditableClass.C.notnull GtkEditableClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
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
              GtkEditableClass.C.notnull GtkEditableClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val pasteClipboard_ = _import "gtk_editable_paste_clipboard" : GtkEditableClass.C.notnull GtkEditableClass.C.p -> unit;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_select_region" :
              GtkEditableClass.C.notnull GtkEditableClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEditable_ = fn x1 & x2 => (_import "gtk_editable_set_editable" : GtkEditableClass.C.notnull GtkEditableClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_editable_set_position" : GtkEditableClass.C.notnull GtkEditableClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copyClipboard self = (GtkEditableClass.C.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GtkEditableClass.C.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GtkEditableClass.C.withPtr ---> I) deleteSelection_ self
    fun deleteText self startPos endPos =
      (
        GtkEditableClass.C.withPtr
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
        GtkEditableClass.C.withPtr
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
    fun getEditable self = (GtkEditableClass.C.withPtr ---> FFI.Bool.C.fromVal) getEditable_ self
    fun getPosition self = (GtkEditableClass.C.withPtr ---> FFI.Int32.C.fromVal) getPosition_ self
    fun getSelectionBounds self =
      let
        val startPos
         & endPos
         & retVal =
          (
            GtkEditableClass.C.withPtr
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
            GtkEditableClass.C.withPtr
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
    fun pasteClipboard self = (GtkEditableClass.C.withPtr ---> I) pasteClipboard_ self
    fun selectRegion self startPos endPos =
      (
        GtkEditableClass.C.withPtr
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
    fun setEditable self isEditable = (GtkEditableClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEditable_ (self & isEditable)
    fun setPosition self position = (GtkEditableClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setPosition_ (self & position)
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
