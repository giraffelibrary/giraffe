structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class_t = 'a GtkTextChildAnchorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_child_anchor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_text_child_anchor_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDeleted_ = call (load_sym libgtk "gtk_text_child_anchor_get_deleted") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GtkTextChildAnchorClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.C.fromPtr true) new_ ()
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
  end
