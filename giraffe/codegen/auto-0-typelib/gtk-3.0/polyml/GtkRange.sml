structure GtkRange :>
  GTK_RANGE
    where type 'a class = 'a GtkRangeClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type sensitivity_type_t = GtkSensitivityType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_range_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getAdjustment_ = call (getSymbol "gtk_range_get_adjustment") (GtkRangeClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getFillLevel_ = call (getSymbol "gtk_range_get_fill_level") (GtkRangeClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getFlippable_ = call (getSymbol "gtk_range_get_flippable") (GtkRangeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInverted_ = call (getSymbol "gtk_range_get_inverted") (GtkRangeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLowerStepperSensitivity_ = call (getSymbol "gtk_range_get_lower_stepper_sensitivity") (GtkRangeClass.PolyML.cPtr --> GtkSensitivityType.PolyML.cVal)
      val getMinSliderSize_ = call (getSymbol "gtk_range_get_min_slider_size") (GtkRangeClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getRangeRect_ = call (getSymbol "gtk_range_get_range_rect") (GtkRangeClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val getRestrictToFillLevel_ = call (getSymbol "gtk_range_get_restrict_to_fill_level") (GtkRangeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRoundDigits_ = call (getSymbol "gtk_range_get_round_digits") (GtkRangeClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getShowFillLevel_ = call (getSymbol "gtk_range_get_show_fill_level") (GtkRangeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSliderRange_ =
        call (getSymbol "gtk_range_get_slider_range")
          (
            GtkRangeClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getSliderSizeFixed_ = call (getSymbol "gtk_range_get_slider_size_fixed") (GtkRangeClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUpperStepperSensitivity_ = call (getSymbol "gtk_range_get_upper_stepper_sensitivity") (GtkRangeClass.PolyML.cPtr --> GtkSensitivityType.PolyML.cVal)
      val getValue_ = call (getSymbol "gtk_range_get_value") (GtkRangeClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val setAdjustment_ = call (getSymbol "gtk_range_set_adjustment") (GtkRangeClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setFillLevel_ = call (getSymbol "gtk_range_set_fill_level") (GtkRangeClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setFlippable_ = call (getSymbol "gtk_range_set_flippable") (GtkRangeClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIncrements_ =
        call (getSymbol "gtk_range_set_increments")
          (
            GtkRangeClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setInverted_ = call (getSymbol "gtk_range_set_inverted") (GtkRangeClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLowerStepperSensitivity_ = call (getSymbol "gtk_range_set_lower_stepper_sensitivity") (GtkRangeClass.PolyML.cPtr &&> GtkSensitivityType.PolyML.cVal --> cVoid)
      val setMinSliderSize_ = call (getSymbol "gtk_range_set_min_slider_size") (GtkRangeClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setRange_ =
        call (getSymbol "gtk_range_set_range")
          (
            GtkRangeClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setRestrictToFillLevel_ = call (getSymbol "gtk_range_set_restrict_to_fill_level") (GtkRangeClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRoundDigits_ = call (getSymbol "gtk_range_set_round_digits") (GtkRangeClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setShowFillLevel_ = call (getSymbol "gtk_range_set_show_fill_level") (GtkRangeClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSliderSizeFixed_ = call (getSymbol "gtk_range_set_slider_size_fixed") (GtkRangeClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUpperStepperSensitivity_ = call (getSymbol "gtk_range_set_upper_stepper_sensitivity") (GtkRangeClass.PolyML.cPtr &&> GtkSensitivityType.PolyML.cVal --> cVoid)
      val setValue_ = call (getSymbol "gtk_range_set_value") (GtkRangeClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkRangeClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type sensitivity_type_t = GtkSensitivityType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAdjustment self = (GtkRangeClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self before GtkRangeClass.FFI.touchPtr self
    fun getFillLevel self = (GtkRangeClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getFillLevel_ self
    fun getFlippable self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFlippable_ self
    fun getInverted self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInverted_ self
    fun getLowerStepperSensitivity self = (GtkRangeClass.FFI.withPtr false ---> GtkSensitivityType.FFI.fromVal) getLowerStepperSensitivity_ self
    fun getMinSliderSize self = (GtkRangeClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getMinSliderSize_ self
    fun getRangeRect self =
      let
        val rangeRect & () = (GtkRangeClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getRangeRect_ (self & ())
      in
        rangeRect
      end
    fun getRestrictToFillLevel self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRestrictToFillLevel_ self
    fun getRoundDigits self = (GtkRangeClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getRoundDigits_ self
    fun getShowFillLevel self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowFillLevel_ self
    fun getSliderRange self =
      let
        val sliderStart
         & sliderEnd
         & () =
          (
            GtkRangeClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getSliderRange_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (sliderStart, sliderEnd)
      end
    fun getSliderSizeFixed self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSliderSizeFixed_ self
    fun getUpperStepperSensitivity self = (GtkRangeClass.FFI.withPtr false ---> GtkSensitivityType.FFI.fromVal) getUpperStepperSensitivity_ self
    fun getValue self = (GtkRangeClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GtkRangeClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setAdjustment_ (self & adjustment)
    fun setFillLevel self fillLevel = (GtkRangeClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setFillLevel_ (self & fillLevel)
    fun setFlippable self flippable = (GtkRangeClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFlippable_ (self & flippable)
    fun setIncrements self (step, page) =
      (
        GtkRangeClass.FFI.withPtr false
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
    fun setInverted self setting = (GtkRangeClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInverted_ (self & setting)
    fun setLowerStepperSensitivity self sensitivity = (GtkRangeClass.FFI.withPtr false &&&> GtkSensitivityType.FFI.withVal ---> I) setLowerStepperSensitivity_ (self & sensitivity)
    fun setMinSliderSize self minSize = (GtkRangeClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setMinSliderSize_ (self & minSize)
    fun setRange self (min, max) =
      (
        GtkRangeClass.FFI.withPtr false
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
    fun setRestrictToFillLevel self restrictToFillLevel = (GtkRangeClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRestrictToFillLevel_ (self & restrictToFillLevel)
    fun setRoundDigits self roundDigits = (GtkRangeClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setRoundDigits_ (self & roundDigits)
    fun setShowFillLevel self showFillLevel = (GtkRangeClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowFillLevel_ (self & showFillLevel)
    fun setSliderSizeFixed self sizeFixed = (GtkRangeClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSliderSizeFixed_ (self & sizeFixed)
    fun setUpperStepperSensitivity self sensitivity = (GtkRangeClass.FFI.withPtr false &&&> GtkSensitivityType.FFI.withVal ---> I) setUpperStepperSensitivity_ (self & sensitivity)
    fun setValue self value = (GtkRangeClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun adjustBoundsSig f = signal "adjust-bounds" (get 0w1 double ---> ret_void) f
      fun changeValueSig f = signal "change-value" (get 0w1 GtkScrollType.t &&&> get 0w2 double ---> ret boolean) (fn scroll & value => f (scroll, value))
      fun moveSliderSig f = signal "move-slider" (get 0w1 GtkScrollType.t ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
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
      val fillLevelProp =
        {
          name = "fill-level",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val invertedProp =
        {
          name = "inverted",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val lowerStepperSensitivityProp =
        {
          name = "lower-stepper-sensitivity",
          gtype = fn () => C.gtype GtkSensitivityType.t (),
          get = fn x => fn () => C.get GtkSensitivityType.t x,
          set = fn x => C.set GtkSensitivityType.t x,
          init = fn x => C.set GtkSensitivityType.t x
        }
      val restrictToFillLevelProp =
        {
          name = "restrict-to-fill-level",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val roundDigitsProp =
        {
          name = "round-digits",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val showFillLevelProp =
        {
          name = "show-fill-level",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val upperStepperSensitivityProp =
        {
          name = "upper-stepper-sensitivity",
          gtype = fn () => C.gtype GtkSensitivityType.t (),
          get = fn x => fn () => C.get GtkSensitivityType.t x,
          set = fn x => C.set GtkSensitivityType.t x,
          init = fn x => C.set GtkSensitivityType.t x
        }
    end
  end
