structure GtkToggleToolButton :>
  GTK_TOGGLE_TOOL_BUTTON
    where type 'a class = 'a GtkToggleToolButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_toggle_tool_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_toggle_tool_button_new" : unit -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val newFromStock_ = _import "mlton_gtk_toggle_tool_button_new_from_stock" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkToolItemClass.C.notnull GtkToolItemClass.C.p;
    val getActive_ = _import "gtk_toggle_tool_button_get_active" : GtkToggleToolButtonClass.C.notnull GtkToggleToolButtonClass.C.p -> FFI.Bool.C.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_tool_button_set_active" : GtkToggleToolButtonClass.C.notnull GtkToggleToolButtonClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkToggleToolButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToggleToolButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkToggleToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getActive self = (GtkToggleToolButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun setActive self isActive = (GtkToggleToolButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
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
