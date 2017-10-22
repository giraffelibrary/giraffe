structure GtkToplevelAccessible :>
  GTK_TOPLEVEL_ACCESSIBLE
    where type 'a class = 'a GtkToplevelAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_toplevel_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkToplevelAccessibleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
