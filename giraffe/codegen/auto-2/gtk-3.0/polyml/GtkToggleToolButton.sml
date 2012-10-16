structure GtkToggleToolButton :>
  GTK_TOGGLE_TOOL_BUTTON
    where type 'a class_t = 'a GtkToggleToolButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toggle_tool_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_toggle_tool_button_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newFromStock_ = call (load_sym libgtk "gtk_toggle_tool_button_new_from_stock") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getActive_ = call (load_sym libgtk "gtk_toggle_tool_button_get_active") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setActive_ = call (load_sym libgtk "gtk_toggle_tool_button_set_active") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToggleToolButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToggleToolButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (FFI.String.withConstPtr ---> GtkToggleToolButtonClass.C.fromPtr false) newFromStock_ stockId
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getActive_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setActive_ (self & isActive)
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
