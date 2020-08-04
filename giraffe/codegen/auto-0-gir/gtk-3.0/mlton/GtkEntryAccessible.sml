structure GtkEntryAccessible :>
  GTK_ENTRY_ACCESSIBLE
    where type 'a class = 'a GtkEntryAccessibleClass.class =
  struct
    val getType_ = _import "gtk_entry_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkEntryAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr false ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr false ---> AtkTextClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
