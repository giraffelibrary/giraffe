structure GtkStatusbarAccessible :>
  GTK_STATUSBAR_ACCESSIBLE
    where type 'a class = 'a GtkStatusbarAccessibleClass.class =
  struct
    val getType_ = _import "gtk_statusbar_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkStatusbarAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
