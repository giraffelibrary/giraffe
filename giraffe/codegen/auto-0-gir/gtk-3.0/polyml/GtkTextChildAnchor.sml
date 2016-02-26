structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class_t = 'a GtkTextChildAnchorClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_child_anchor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_child_anchor_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDeleted_ = call (load_sym libgtk "gtk_text_child_anchor_get_deleted") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GtkTextChildAnchorClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.C.fromPtr true) new_ ()
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
  end
