structure GtkToggleAction :>
  GTK_TOGGLE_ACTION
    where type 'a class = 'a GtkToggleActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_toggle_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_toggle_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getActive_ = _import "gtk_toggle_action_get_active" : GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p -> GBool.FFI.val_;
    val getDrawAsRadio_ = _import "gtk_toggle_action_get_draw_as_radio" : GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p -> GBool.FFI.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_action_set_active" : GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setDrawAsRadio_ = fn x1 & x2 => (_import "gtk_toggle_action_set_draw_as_radio" : GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val toggled_ = _import "gtk_toggle_action_toggled" : GtkToggleActionClass.FFI.notnull GtkToggleActionClass.FFI.p -> unit;
    type 'a class = 'a GtkToggleActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkToggleActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun getActive self = (GtkToggleActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getDrawAsRadio self = (GtkToggleActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawAsRadio_ self
    fun setActive self isActive = (GtkToggleActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GtkToggleActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun toggled self = (GtkToggleActionClass.FFI.withPtr ---> I) toggled_ self
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
      val drawAsRadioProp =
        {
          get = fn x => get "draw-as-radio" boolean x,
          set = fn x => set "draw-as-radio" boolean x
        }
    end
  end
