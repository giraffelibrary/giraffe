structure GtkFlowBoxChild :>
  GTK_FLOW_BOX_CHILD
    where type 'a class = 'a GtkFlowBoxChildClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_flow_box_child_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_flow_box_child_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val changed_ = _import "gtk_flow_box_child_changed" : GtkFlowBoxChildClass.FFI.non_opt GtkFlowBoxChildClass.FFI.p -> unit;
    val getIndex_ = _import "gtk_flow_box_child_get_index" : GtkFlowBoxChildClass.FFI.non_opt GtkFlowBoxChildClass.FFI.p -> GInt.FFI.val_;
    val isSelected_ = _import "gtk_flow_box_child_is_selected" : GtkFlowBoxChildClass.FFI.non_opt GtkFlowBoxChildClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GtkFlowBoxChildClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFlowBoxChildClass.FFI.fromPtr false) new_ ()
    fun changed self = (GtkFlowBoxChildClass.FFI.withPtr false ---> I) changed_ self
    fun getIndex self = (GtkFlowBoxChildClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndex_ self
    fun isSelected self = (GtkFlowBoxChildClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSelected_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
  end
