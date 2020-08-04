structure GtkPanedAccessible :>
  GTK_PANED_ACCESSIBLE
    where type 'a class = 'a GtkPanedAccessibleClass.class =
  struct
    val getType_ = _import "gtk_paned_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkPanedAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asValue self = (GObjectObjectClass.FFI.withPtr false ---> AtkValueClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
