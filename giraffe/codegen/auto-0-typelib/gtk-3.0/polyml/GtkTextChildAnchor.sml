structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class = 'a GtkTextChildAnchorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_child_anchor_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_text_child_anchor_new") (PolyMLFFI.cVoid --> GtkTextChildAnchorClass.PolyML.cPtr)
      val getDeleted_ = call (load_sym libgtk "gtk_text_child_anchor_get_deleted") (GtkTextChildAnchorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GtkTextChildAnchorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.C.fromPtr true) new_ ()
    fun getDeleted self = (GtkTextChildAnchorClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
  end
