structure GtkToggleToolButton :>
  GTK_TOGGLE_TOOL_BUTTON
    where type 'a class_t = 'a GtkToggleToolButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_toggle_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_toggle_tool_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromStock_ = _import "mlton_gtk_toggle_tool_button_new_from_stock" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getActive_ = _import "gtk_toggle_tool_button_get_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_tool_button_set_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkToggleToolButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToggleToolButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (FFI.String.C.withConstPtr ---> GtkToggleToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
    end
  end
