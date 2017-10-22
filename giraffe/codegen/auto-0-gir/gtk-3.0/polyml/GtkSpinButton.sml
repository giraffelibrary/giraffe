structure GtkSpinButton :>
  GTK_SPIN_BUTTON
    where type 'a class = 'a GtkSpinButtonClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a editable_class = 'a GtkEditableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type spin_type_t = GtkSpinType.t
    where type scroll_type_t = GtkScrollType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type spin_button_update_policy_t = GtkSpinButtonUpdatePolicy.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_spin_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_spin_button_new")
          (
            GtkAdjustmentClass.PolyML.cOptPtr
             &&> GDouble.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val newWithRange_ =
        call (getSymbol "gtk_spin_button_new_with_range")
          (
            GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val configure_ =
        call (getSymbol "gtk_spin_button_configure")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GtkAdjustmentClass.PolyML.cOptPtr
             &&> GDouble.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
      val getAdjustment_ = call (getSymbol "gtk_spin_button_get_adjustment") (GtkSpinButtonClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getDigits_ = call (getSymbol "gtk_spin_button_get_digits") (GtkSpinButtonClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getIncrements_ =
        call (getSymbol "gtk_spin_button_get_increments")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getNumeric_ = call (getSymbol "gtk_spin_button_get_numeric") (GtkSpinButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRange_ =
        call (getSymbol "gtk_spin_button_get_range")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getSnapToTicks_ = call (getSymbol "gtk_spin_button_get_snap_to_ticks") (GtkSpinButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUpdatePolicy_ = call (getSymbol "gtk_spin_button_get_update_policy") (GtkSpinButtonClass.PolyML.cPtr --> GtkSpinButtonUpdatePolicy.PolyML.cVal)
      val getValue_ = call (getSymbol "gtk_spin_button_get_value") (GtkSpinButtonClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getValueAsInt_ = call (getSymbol "gtk_spin_button_get_value_as_int") (GtkSpinButtonClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWrap_ = call (getSymbol "gtk_spin_button_get_wrap") (GtkSpinButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAdjustment_ = call (getSymbol "gtk_spin_button_set_adjustment") (GtkSpinButtonClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setDigits_ = call (getSymbol "gtk_spin_button_set_digits") (GtkSpinButtonClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setIncrements_ =
        call (getSymbol "gtk_spin_button_set_increments")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setNumeric_ = call (getSymbol "gtk_spin_button_set_numeric") (GtkSpinButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRange_ =
        call (getSymbol "gtk_spin_button_set_range")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setSnapToTicks_ = call (getSymbol "gtk_spin_button_set_snap_to_ticks") (GtkSpinButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUpdatePolicy_ = call (getSymbol "gtk_spin_button_set_update_policy") (GtkSpinButtonClass.PolyML.cPtr &&> GtkSpinButtonUpdatePolicy.PolyML.cVal --> cVoid)
      val setValue_ = call (getSymbol "gtk_spin_button_set_value") (GtkSpinButtonClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setWrap_ = call (getSymbol "gtk_spin_button_set_wrap") (GtkSpinButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val spin_ =
        call (getSymbol "gtk_spin_button_spin")
          (
            GtkSpinButtonClass.PolyML.cPtr
             &&> GtkSpinType.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val update_ = call (getSymbol "gtk_spin_button_update") (GtkSpinButtonClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSpinButtonClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a editable_class = 'a GtkEditableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type spin_type_t = GtkSpinType.t
    type scroll_type_t = GtkScrollType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type spin_button_update_policy_t = GtkSpinButtonUpdatePolicy.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkEditableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        adjustment,
        climbRate,
        digits
      ) =
      (
        GtkAdjustmentClass.FFI.withOptPtr
         &&&> GDouble.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> GtkSpinButtonClass.FFI.fromPtr false
      )
        new_
        (
          adjustment
           & climbRate
           & digits
        )
    fun newWithRange
      (
        min,
        max,
        step
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkSpinButtonClass.FFI.fromPtr false
      )
        newWithRange_
        (
          min
           & max
           & step
        )
    fun configure
      self
      (
        adjustment,
        climbRate,
        digits
      ) =
      (
        GtkSpinButtonClass.FFI.withPtr
         &&&> GtkAdjustmentClass.FFI.withOptPtr
         &&&> GDouble.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        configure_
        (
          self
           & adjustment
           & climbRate
           & digits
        )
    fun getAdjustment self = (GtkSpinButtonClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getDigits self = (GtkSpinButtonClass.FFI.withPtr ---> GUInt.FFI.fromVal) getDigits_ self
    fun getIncrements self =
      let
        val step
         & page
         & () =
          (
            GtkSpinButtonClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getIncrements_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (step, page)
      end
    fun getNumeric self = (GtkSpinButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getNumeric_ self
    fun getRange self =
      let
        val min
         & max
         & () =
          (
            GtkSpinButtonClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getRange_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (min, max)
      end
    fun getSnapToTicks self = (GtkSpinButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getSnapToTicks_ self
    fun getUpdatePolicy self = (GtkSpinButtonClass.FFI.withPtr ---> GtkSpinButtonUpdatePolicy.FFI.fromVal) getUpdatePolicy_ self
    fun getValue self = (GtkSpinButtonClass.FFI.withPtr ---> GDouble.FFI.fromVal) getValue_ self
    fun getValueAsInt self = (GtkSpinButtonClass.FFI.withPtr ---> GInt.FFI.fromVal) getValueAsInt_ self
    fun getWrap self = (GtkSpinButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getWrap_ self
    fun setAdjustment self adjustment = (GtkSpinButtonClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setDigits self digits = (GtkSpinButtonClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setDigits_ (self & digits)
    fun setIncrements self (step, page) =
      (
        GtkSpinButtonClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setIncrements_
        (
          self
           & step
           & page
        )
    fun setNumeric self numeric = (GtkSpinButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setNumeric_ (self & numeric)
    fun setRange self (min, max) =
      (
        GtkSpinButtonClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setRange_
        (
          self
           & min
           & max
        )
    fun setSnapToTicks self snapToTicks = (GtkSpinButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSnapToTicks_ (self & snapToTicks)
    fun setUpdatePolicy self policy = (GtkSpinButtonClass.FFI.withPtr &&&> GtkSpinButtonUpdatePolicy.FFI.withVal ---> I) setUpdatePolicy_ (self & policy)
    fun setValue self value = (GtkSpinButtonClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    fun setWrap self wrap = (GtkSpinButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setWrap_ (self & wrap)
    fun spin self (direction, increment) =
      (
        GtkSpinButtonClass.FFI.withPtr
         &&&> GtkSpinType.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        spin_
        (
          self
           & direction
           & increment
        )
    fun update self = (GtkSpinButtonClass.FFI.withPtr ---> I) update_ self
    local
      open ClosureMarshal Signal
    in
      fun changeValueSig f = signal "change-value" (get 0w1 GtkScrollType.t ---> ret_void) f
      fun inputSig f =
        signal "input" (void ---> set 0w1 double && ret int)
          (
            fn
              () =>
                let
                  val (retVal, newValue) = f ()
                in
                  newValue & retVal
                end
          )
      fun outputSig f = signal "output" (void ---> ret boolean) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
      fun wrappedSig f = signal "wrapped" (void ---> ret_void) f
    end
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x
        }
      val climbRateProp =
        {
          get = fn x => get "climb-rate" double x,
          set = fn x => set "climb-rate" double x
        }
      val digitsProp =
        {
          get = fn x => get "digits" uint x,
          set = fn x => set "digits" uint x
        }
      val numericProp =
        {
          get = fn x => get "numeric" boolean x,
          set = fn x => set "numeric" boolean x
        }
      val snapToTicksProp =
        {
          get = fn x => get "snap-to-ticks" boolean x,
          set = fn x => set "snap-to-ticks" boolean x
        }
      val updatePolicyProp =
        {
          get = fn x => get "update-policy" GtkSpinButtonUpdatePolicy.t x,
          set = fn x => set "update-policy" GtkSpinButtonUpdatePolicy.t x
        }
      val valueProp =
        {
          get = fn x => get "value" double x,
          set = fn x => set "value" double x
        }
      val wrapProp =
        {
          get = fn x => get "wrap" boolean x,
          set = fn x => set "wrap" boolean x
        }
    end
  end
