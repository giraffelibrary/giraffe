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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scale_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_scale_button_new")
          (
            GInt32.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> Utf8CArray.PolyML.cInOptPtr
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getAdjustment_ = call (getSymbol "gtk_scale_button_get_adjustment") (GtkScaleButtonClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getMinusButton_ = call (getSymbol "gtk_scale_button_get_minus_button") (GtkScaleButtonClass.PolyML.cPtr --> GtkButtonClass.PolyML.cPtr)
      val getPlusButton_ = call (getSymbol "gtk_scale_button_get_plus_button") (GtkScaleButtonClass.PolyML.cPtr --> GtkButtonClass.PolyML.cPtr)
      val getPopup_ = call (getSymbol "gtk_scale_button_get_popup") (GtkScaleButtonClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getValue_ = call (getSymbol "gtk_scale_button_get_value") (GtkScaleButtonClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setAdjustment_ = call (getSymbol "gtk_scale_button_set_adjustment") (GtkScaleButtonClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setIcons_ = call (getSymbol "gtk_scale_button_set_icons") (GtkScaleButtonClass.PolyML.cPtr &&> Utf8CArray.PolyML.cInPtr --> cVoid)
      val setValue_ = call (getSymbol "gtk_scale_button_set_value") (GtkScaleButtonClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
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
         &&&> Utf8CArray.FFI.withOptPtr
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
    fun getAdjustment self = (GtkScaleButtonClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getMinusButton self = (GtkScaleButtonClass.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) getMinusButton_ self
    fun getPlusButton self = (GtkScaleButtonClass.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) getPlusButton_ self
    fun getPopup self = (GtkScaleButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getPopup_ self
    fun getValue self = (GtkScaleButtonClass.FFI.withPtr ---> GDouble.FFI.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GtkScaleButtonClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setIcons self icons = (GtkScaleButtonClass.FFI.withPtr &&&> Utf8CArray.FFI.withPtr ---> I) setIcons_ (self & icons)
    fun setValue self value = (GtkScaleButtonClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun popdownSig f = signal "popdown" (void ---> ret_void) f
      fun popupSig f = signal "popup" (void ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (get 0w1 double ---> ret_void) f
    end
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x,
          new = fn x => new "adjustment" GtkAdjustmentClass.tOpt x
        }
      val sizeProp =
        {
          get = fn x => get "size" GtkIconSize.t x,
          set = fn x => set "size" GtkIconSize.t x,
          new = fn x => new "size" GtkIconSize.t x
        }
      val valueProp =
        {
          get = fn x => get "value" double x,
          set = fn x => set "value" double x,
          new = fn x => new "value" double x
        }
    end
  end
