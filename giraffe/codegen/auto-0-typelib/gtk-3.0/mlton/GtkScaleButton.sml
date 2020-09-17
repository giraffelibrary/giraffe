structure GtkScaleButton :>
  GTK_SCALE_BUTTON
    where type 'a class = 'a GtkScaleButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a button_class = 'a GtkButtonClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type icon_size_t = GtkIconSize.t =
  struct
    val getType_ = _import "gtk_scale_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6) =>
          (
            _import "mlton_gtk_scale_button_new" :
              GInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getAdjustment_ = _import "gtk_scale_button_get_adjustment" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getMinusButton_ = _import "gtk_scale_button_get_minus_button" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p -> GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p;
    val getPlusButton_ = _import "gtk_scale_button_get_plus_button" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p -> GtkButtonClass.FFI.non_opt GtkButtonClass.FFI.p;
    val getPopup_ = _import "gtk_scale_button_get_popup" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getValue_ = _import "gtk_scale_button_get_value" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p -> GDouble.FFI.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_scale_button_set_adjustment" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setIcons_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_scale_button_set_icons" :
              GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setValue_ = fn x1 & x2 => (_import "gtk_scale_button_set_value" : GtkScaleButtonClass.FFI.non_opt GtkScaleButtonClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkScaleButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a button_class = 'a GtkButtonClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type icon_size_t = GtkIconSize.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        size,
        min,
        max,
        step,
        icons
      ) =
      (
        GInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> Utf8CPtrArray.FFI.withOptPtr 0
         ---> GtkScaleButtonClass.FFI.fromPtr false
      )
        new_
        (
          size
           & min
           & max
           & step
           & icons
        )
       before Utf8CPtrArray.FFI.touchOptPtr icons
    fun getAdjustment self = (GtkScaleButtonClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self before GtkScaleButtonClass.FFI.touchPtr self
    fun getMinusButton self = (GtkScaleButtonClass.FFI.withPtr false ---> GtkButtonClass.FFI.fromPtr false) getMinusButton_ self before GtkScaleButtonClass.FFI.touchPtr self
    fun getPlusButton self = (GtkScaleButtonClass.FFI.withPtr false ---> GtkButtonClass.FFI.fromPtr false) getPlusButton_ self before GtkScaleButtonClass.FFI.touchPtr self
    fun getPopup self = (GtkScaleButtonClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getPopup_ self before GtkScaleButtonClass.FFI.touchPtr self
    fun getValue self = (GtkScaleButtonClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GtkScaleButtonClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setAdjustment_ (self & adjustment)
    fun setIcons self icons = (GtkScaleButtonClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setIcons_ (self & icons)
    fun setValue self value = (GtkScaleButtonClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun popdownSig f = signal "popdown" (void ---> ret_void) f
      fun popupSig f = signal "popup" (void ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (get 0w1 double ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val adjustmentProp =
        {
          name = "adjustment",
          gtype = fn () => C.gtype GtkAdjustmentClass.tOpt (),
          get = fn x => fn () => C.get GtkAdjustmentClass.tOpt x,
          set = fn x => C.set GtkAdjustmentClass.tOpt x,
          init = fn x => C.set GtkAdjustmentClass.tOpt x
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype GtkIconSize.t (),
          get = fn x => fn () => C.get GtkIconSize.t x,
          set = fn x => C.set GtkIconSize.t x,
          init = fn x => C.set GtkIconSize.t x
        }
      val valueProp =
        {
          name = "value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
    end
  end
