structure GtkCellRendererToggle :>
  GTK_CELL_RENDERER_TOGGLE
    where type 'a class_t = 'a GtkCellRendererToggleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_cell_renderer_toggle_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_cell_renderer_toggle_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getActivatable_ = call (load_sym libgtk "gtk_cell_renderer_toggle_get_activatable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getActive_ = call (load_sym libgtk "gtk_cell_renderer_toggle_get_active") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getRadio_ = call (load_sym libgtk "gtk_cell_renderer_toggle_get_radio") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setActivatable_ = call (load_sym libgtk "gtk_cell_renderer_toggle_set_activatable") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setActive_ = call (load_sym libgtk "gtk_cell_renderer_toggle_set_active") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setRadio_ = call (load_sym libgtk "gtk_cell_renderer_toggle_set_radio") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCellRendererToggleClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererToggleClass.C.fromPtr false) new_ ()
    fun getActivatable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getActivatable_ self
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getActive_ self
    fun getRadio self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getRadio_ self
    fun setActivatable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setActivatable_ (self & setting)
    fun setActive self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setActive_ (self & setting)
    fun setRadio self radio = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setRadio_ (self & radio)
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val activatableProp =
        {
          get = fn x => get "activatable" boolean x,
          set = fn x => set "activatable" boolean x
        }
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
      val inconsistentProp =
        {
          get = fn x => get "inconsistent" boolean x,
          set = fn x => set "inconsistent" boolean x
        }
      val indicatorSizeProp =
        {
          get = fn x => get "indicator-size" int x,
          set = fn x => set "indicator-size" int x
        }
      val radioProp =
        {
          get = fn x => get "radio" boolean x,
          set = fn x => set "radio" boolean x
        }
    end
  end
