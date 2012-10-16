structure GtkCellRendererToggle :>
  GTK_CELL_RENDERER_TOGGLE
    where type 'a class_t = 'a GtkCellRendererToggleClass.t =
  struct
    val getType_ = _import "gtk_cell_renderer_toggle_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_toggle_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getActivatable_ = _import "gtk_cell_renderer_toggle_get_activatable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getActive_ = _import "gtk_cell_renderer_toggle_get_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getRadio_ = _import "gtk_cell_renderer_toggle_get_radio" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setActivatable_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_activatable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setActive_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setRadio_ = fn x1 & x2 => (_import "gtk_cell_renderer_toggle_set_radio" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
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
