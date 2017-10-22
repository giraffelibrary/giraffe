structure GtkWidgetAccessible :>
  GTK_WIDGET_ACCESSIBLE
    where type 'a class = 'a GtkWidgetAccessibleClass.class =
  struct
    val getType_ = _import "gtk_widget_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkWidgetAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
