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
      open ValueAccessor
    in
      val activatableProp =
        {
          name = "activatable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val inconsistentProp =
        {
          name = "inconsistent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val indicatorSizeProp =
        {
          name = "indicator-size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val radioProp =
        {
          name = "radio",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
