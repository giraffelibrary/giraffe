structure GtkEntryIconAccessible :>
  GTK_ENTRY_ICON_ACCESSIBLE
    where type 'a class = 'a GtkEntryIconAccessibleClass.class =
  struct
    val getType_ = _import "gtk_entry_icon_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkEntryIconAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
