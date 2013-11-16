structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class_t = 'a GtkTextChildAnchorClass.t =
  struct
    val getType_ = _import "gtk_text_child_anchor_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_text_child_anchor_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDeleted_ = _import "gtk_text_child_anchor_get_deleted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GtkTextChildAnchorClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.C.fromPtr true) new_ ()
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
  end
