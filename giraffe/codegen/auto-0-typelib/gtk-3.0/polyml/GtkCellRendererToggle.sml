structure GtkCellRendererToggle :>
  GTK_CELL_RENDERER_TOGGLE
    where type 'a class = 'a GtkCellRendererToggleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_toggle_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_toggle_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
      val getActivatable_ = call (getSymbol "gtk_cell_renderer_toggle_get_activatable") (GtkCellRendererToggleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getActive_ = call (getSymbol "gtk_cell_renderer_toggle_get_active") (GtkCellRendererToggleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRadio_ = call (getSymbol "gtk_cell_renderer_toggle_get_radio") (GtkCellRendererToggleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActivatable_ = call (getSymbol "gtk_cell_renderer_toggle_set_activatable") (GtkCellRendererToggleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setActive_ = call (getSymbol "gtk_cell_renderer_toggle_set_active") (GtkCellRendererToggleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRadio_ = call (getSymbol "gtk_cell_renderer_toggle_set_radio") (GtkCellRendererToggleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkCellRendererToggleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererToggleClass.FFI.fromPtr false) new_ ()
    fun getActivatable self = (GtkCellRendererToggleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivatable_ self
    fun getActive self = (GtkCellRendererToggleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun getRadio self = (GtkCellRendererToggleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRadio_ self
    fun setActivatable self setting = (GtkCellRendererToggleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivatable_ (self & setting)
    fun setActive self setting = (GtkCellRendererToggleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & setting)
    fun setRadio self radio = (GtkCellRendererToggleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRadio_ (self & radio)
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
          set = fn x => set "activatable" boolean x,
          new = fn x => new "activatable" boolean x
        }
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x,
          new = fn x => new "active" boolean x
        }
      val inconsistentProp =
        {
          get = fn x => get "inconsistent" boolean x,
          set = fn x => set "inconsistent" boolean x,
          new = fn x => new "inconsistent" boolean x
        }
      val indicatorSizeProp =
        {
          get = fn x => get "indicator-size" int x,
          set = fn x => set "indicator-size" int x,
          new = fn x => new "indicator-size" int x
        }
      val radioProp =
        {
          get = fn x => get "radio" boolean x,
          set = fn x => set "radio" boolean x,
          new = fn x => new "radio" boolean x
        }
    end
  end
