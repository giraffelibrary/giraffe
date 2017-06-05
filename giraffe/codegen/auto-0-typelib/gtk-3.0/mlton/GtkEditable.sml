structure GtkEditable :>
  GTK_EDITABLE
    where type 'a class = 'a GtkEditableClass.class =
  struct
    val getType_ = _import "gtk_editable_get_type" : unit -> GObjectType.FFI.val_;
    val copyClipboard_ = _import "gtk_editable_copy_clipboard" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> unit;
    val cutClipboard_ = _import "gtk_editable_cut_clipboard" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> unit;
    val deleteSelection_ = _import "gtk_editable_delete_selection" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> unit;
    val deleteText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_delete_text" :
              GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getEditable_ = _import "gtk_editable_get_editable" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> GBool.FFI.val_;
    val getPosition_ = _import "gtk_editable_get_position" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> GInt32.FFI.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_get_selection_bounds" :
              GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val pasteClipboard_ = _import "gtk_editable_paste_clipboard" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p -> unit;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_editable_select_region" :
              GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEditable_ = fn x1 & x2 => (_import "gtk_editable_set_editable" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_editable_set_position" : GtkEditableClass.FFI.notnull GtkEditableClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkEditableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copyClipboard self = (GtkEditableClass.FFI.withPtr ---> I) copyClipboard_ self
    fun cutClipboard self = (GtkEditableClass.FFI.withPtr ---> I) cutClipboard_ self
    fun deleteSelection self = (GtkEditableClass.FFI.withPtr ---> I) deleteSelection_ self
    fun deleteText self startPos endPos =
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
    fun getChars self startPos endPos =
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
    fun insertText self newText newTextLength position =
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
    fun selectRegion self startPos endPos =
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
