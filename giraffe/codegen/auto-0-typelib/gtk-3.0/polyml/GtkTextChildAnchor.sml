structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class = 'a GtkTextChildAnchorClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_child_anchor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_text_child_anchor_new") (cVoid --> GtkTextChildAnchorClass.PolyML.cPtr)
      val getDeleted_ = call (getSymbol "gtk_text_child_anchor_get_deleted") (GtkTextChildAnchorClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GtkTextChildAnchorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.FFI.fromPtr true) new_ ()
    fun getDeleted self = (GtkTextChildAnchorClass.FFI.withPtr ---> GBool.FFI.fromVal) getDeleted_ self
  end
