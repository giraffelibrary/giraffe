structure GtkEntryAccessible :>
  GTK_ENTRY_ACCESSIBLE
    where type 'a class = 'a GtkEntryAccessibleClass.class =
  struct
    val getType_ = _import "gtk_entry_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkEntryAccessibleClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asEditableText self = (GObjectObjectClass.FFI.withPtr ---> AtkEditableTextClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
