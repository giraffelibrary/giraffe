structure GtkRcStyle :>
  GTK_RC_STYLE
    where type 'a class = 'a GtkRcStyleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_rc_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_rc_style_new") (cVoid --> GtkRcStyleClass.PolyML.cPtr)
      val copy_ = call (getSymbol "gtk_rc_style_copy") (GtkRcStyleClass.PolyML.cPtr --> GtkRcStyleClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkRcStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRcStyleClass.FFI.fromPtr true) new_ ()
    fun copy self = (GtkRcStyleClass.FFI.withPtr false ---> GtkRcStyleClass.FFI.fromPtr true) copy_ self
  end
