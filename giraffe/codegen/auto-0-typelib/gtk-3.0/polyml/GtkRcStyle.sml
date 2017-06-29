structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class = 'a GtkRcStyleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_rc_style_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkRcStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
