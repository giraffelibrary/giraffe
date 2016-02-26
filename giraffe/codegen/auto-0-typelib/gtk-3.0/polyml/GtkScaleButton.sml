structure GtkScaleButton :>
  GTK_SCALE_BUTTON
    where type 'a class_t = 'a GtkScaleButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    where type icon_size_t = GtkIconSize.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scale_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getAdjustment_ = call (load_sym libgtk "gtk_scale_button_get_adjustment") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getMinusButton_ = call (load_sym libgtk "gtk_scale_button_get_minus_button") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPlusButton_ = call (load_sym libgtk "gtk_scale_button_get_plus_button") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPopup_ = call (load_sym libgtk "gtk_scale_button_get_popup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getValue_ = call (load_sym libgtk "gtk_scale_button_get_value") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val setAdjustment_ = call (load_sym libgtk "gtk_scale_button_set_adjustment") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setValue_ = call (load_sym libgtk "gtk_scale_button_set_value") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkScaleButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    type icon_size_t = GtkIconSize.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAdjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getAdjustment_ self
    fun getMinusButton self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMinusButton_ self
    fun getPlusButton self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getPlusButton_ self
    fun getPopup self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getPopup_ self
    fun getValue self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setValue self value = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
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
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x
        }
      val sizeProp =
        {
          get = fn x => get "size" GtkIconSize.t x,
          set = fn x => set "size" GtkIconSize.t x
        }
      val valueProp =
        {
          get = fn x => get "value" double x,
          set = fn x => set "value" double x
        }
    end
  end
