structure GtkCellRendererToggle :>
  GTK_CELL_RENDERER_TOGGLE
    where type 'a class = 'a GtkCellRendererToggleClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_toggle_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_toggle_new" : unit -> GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p;
    val getActivatable_ = _import "gtk_cell_renderer_toggle_get_activatable" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p -> GBool.FFI.val_;
    val getActive_ = _import "gtk_cell_renderer_toggle_get_active" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p -> GBool.FFI.val_;
    val getRadio_ = _import "gtk_cell_renderer_toggle_get_radio" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p -> GBool.FFI.val_;
    val setActivatable_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_activatable" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setActive_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_active" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRadio_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_radio" : GtkCellRendererToggleClass.FFI.notnull GtkCellRendererToggleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellRendererToggleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererToggleClass.FFI.fromPtr false) new_ ()
    fun getActivatable self = (GtkCellRendererToggleClass.FFI.withPtr ---> GBool.FFI.fromVal) getActivatable_ self
    fun getActive self = (GtkCellRendererToggleClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getRadio self = (GtkCellRendererToggleClass.FFI.withPtr ---> GBool.FFI.fromVal) getRadio_ self
    fun setActivatable self setting = (GtkCellRendererToggleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActivatable_ (self & setting)
    fun setActive self setting = (GtkCellRendererToggleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & setting)
    fun setRadio self radio = (GtkCellRendererToggleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRadio_ (self & radio)
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
