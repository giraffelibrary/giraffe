structure GtkFlowBoxChildAccessible :>
  GTK_FLOW_BOX_CHILD_ACCESSIBLE
    where type 'a class = 'a GtkFlowBoxChildAccessibleClass.class =
  struct
    val getType_ = _import "gtk_flow_box_child_accessible_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkFlowBoxChildAccessibleClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
