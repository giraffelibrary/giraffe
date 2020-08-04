structure GtkFlowBoxAccessible :>
  GTK_FLOW_BOX_ACCESSIBLE
    where type 'a class = 'a GtkFlowBoxAccessibleClass.class =
  struct
    val getType_ = _import "gtk_flow_box_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkFlowBoxAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    fun asSelection self = (GObjectObjectClass.FFI.withPtr false ---> AtkSelectionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
