structure GtkTextChildAnchor :>
  GTK_TEXT_CHILD_ANCHOR
    where type 'a class = 'a GtkTextChildAnchorClass.class =
  struct
    val getType_ = _import "gtk_text_child_anchor_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_child_anchor_new" : unit -> GtkTextChildAnchorClass.FFI.non_opt GtkTextChildAnchorClass.FFI.p;
    val getDeleted_ = _import "gtk_text_child_anchor_get_deleted" : GtkTextChildAnchorClass.FFI.non_opt GtkTextChildAnchorClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GtkTextChildAnchorClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextChildAnchorClass.FFI.fromPtr true) new_ ()
    fun getDeleted self = (GtkTextChildAnchorClass.FFI.withPtr ---> GBool.FFI.fromVal) getDeleted_ self
  end
