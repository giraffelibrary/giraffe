structure GtkStatusbarAccessible :>
  GTK_STATUSBAR_ACCESSIBLE
    where type 'a class = 'a GtkStatusbarAccessibleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_statusbar_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkStatusbarAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
