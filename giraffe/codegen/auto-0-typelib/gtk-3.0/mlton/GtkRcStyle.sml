structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class = 'a GtkRcStyleClass.class =
  struct
    val getType_ = _import "gtk_rc_style_get_type" : unit -> GObjectType.C.val_;
    type 'a class = 'a GtkRcStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
