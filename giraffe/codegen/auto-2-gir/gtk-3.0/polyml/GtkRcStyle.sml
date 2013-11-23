structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class_t = 'a GtkRcStyleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_rc_style_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GtkRcStyleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
