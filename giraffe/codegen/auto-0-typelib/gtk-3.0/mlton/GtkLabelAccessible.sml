structure GtkLabelAccessible :>
  GTK_LABEL_ACCESSIBLE
    where type 'a class = 'a GtkLabelAccessibleClass.class =
  struct
    val getType_ = _import "gtk_label_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkLabelAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asHypertext self = (GObjectObjectClass.FFI.withPtr ---> AtkHypertextClass.FFI.fromPtr false) I self
    fun asText self = (GObjectObjectClass.FFI.withPtr ---> AtkTextClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
