structure GtkFlowBoxChild :>
  GTK_FLOW_BOX_CHILD
    where type 'a class = 'a GtkFlowBoxChildClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_flow_box_child_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_flow_box_child_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val changed_ = call (getSymbol "gtk_flow_box_child_changed") (GtkFlowBoxChildClass.PolyML.cPtr --> cVoid)
      val getIndex_ = call (getSymbol "gtk_flow_box_child_get_index") (GtkFlowBoxChildClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val isSelected_ = call (getSymbol "gtk_flow_box_child_is_selected") (GtkFlowBoxChildClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GtkFlowBoxChildClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFlowBoxChildClass.FFI.fromPtr false) new_ ()
    fun changed self = (GtkFlowBoxChildClass.FFI.withPtr false ---> I) changed_ self
    fun getIndex self = (GtkFlowBoxChildClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getIndex_ self
    fun isSelected self = (GtkFlowBoxChildClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSelected_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
    end
  end
