structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class_t = 'a GtkRcStyleClass.t =
  struct
    val getType_ = _import "gtk_rc_style_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GtkRcStyleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
