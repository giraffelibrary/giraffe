structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class = 'a GtkTextChildAnchorClass.class =
  struct
    val getType_ = _import "gtk_text_child_anchor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_text_child_anchor_new" : unit -> GtkTextChildAnchorClass.C.notnull GtkTextChildAnchorClass.C.p;
    val getDeleted_ = _import "gtk_text_child_anchor_get_deleted" : GtkTextChildAnchorClass.C.notnull GtkTextChildAnchorClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GtkTextChildAnchorClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.C.fromPtr true) new_ ()
    fun getDeleted self = (GtkTextChildAnchorClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
  end
