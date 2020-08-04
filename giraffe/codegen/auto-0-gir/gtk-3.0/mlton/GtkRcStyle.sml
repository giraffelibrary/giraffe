structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class = 'a GtkRcStyleClass.class =
  struct
    val getType_ = _import "gtk_rc_style_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_rc_style_new" : unit -> GtkRcStyleClass.FFI.non_opt GtkRcStyleClass.FFI.p;
    val copy_ = _import "gtk_rc_style_copy" : GtkRcStyleClass.FFI.non_opt GtkRcStyleClass.FFI.p -> GtkRcStyleClass.FFI.non_opt GtkRcStyleClass.FFI.p;
    type 'a class = 'a GtkRcStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRcStyleClass.FFI.fromPtr true) new_ ()
    fun copy self = (GtkRcStyleClass.FFI.withPtr false ---> GtkRcStyleClass.FFI.fromPtr true) copy_ self
  end
