structure GtkRange :>
  GTK_RANGE
    where type 'a class = 'a GtkRangeClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type sensitivity_type_t = GtkSensitivityType.t =
  struct
    val getType_ = _import "gtk_range_get_type" : unit -> GObjectType.FFI.val_;
    val getAdjustment_ = _import "gtk_range_get_adjustment" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getFillLevel_ = _import "gtk_range_get_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GDouble.FFI.val_;
    val getFlippable_ = _import "gtk_range_get_flippable" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getInverted_ = _import "gtk_range_get_inverted" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getLowerStepperSensitivity_ = _import "gtk_range_get_lower_stepper_sensitivity" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getMinSliderSize_ = _import "gtk_range_get_min_slider_size" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GInt.FFI.val_;
    val getRangeRect_ = fn x1 & x2 => (_import "gtk_range_get_range_rect" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getRestrictToFillLevel_ = _import "gtk_range_get_restrict_to_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getRoundDigits_ = _import "gtk_range_get_round_digits" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GInt.FFI.val_;
    val getShowFillLevel_ = _import "gtk_range_get_show_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getSliderRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_get_slider_range" :
              GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSliderSizeFixed_ = _import "gtk_range_get_slider_size_fixed" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getUpperStepperSensitivity_ = _import "gtk_range_get_upper_stepper_sensitivity" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getValue_ = _import "gtk_range_get_value" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p -> GDouble.FFI.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_range_set_adjustment" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setFlippable_ = fn x1 & x2 => (_import "gtk_range_set_flippable" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_increments" :
              GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_range_set_inverted" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLowerStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_lower_stepper_sensitivity" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setMinSliderSize_ = fn x1 & x2 => (_import "gtk_range_set_min_slider_size" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_range" :
              GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRestrictToFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_restrict_to_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRoundDigits_ = fn x1 & x2 => (_import "gtk_range_set_round_digits" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setShowFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_show_fill_level" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSliderSizeFixed_ = fn x1 & x2 => (_import "gtk_range_set_slider_size_fixed" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUpperStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_upper_stepper_sensitivity" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_range_set_value" : GtkRangeClass.FFI.non_opt GtkRangeClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
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
    fun getMinSliderSize self = (GtkRangeClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMinSliderSize_ self
    fun getRangeRect self =
      let
        val rangeRect & () = (GtkRangeClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getRangeRect_ (self & ())
      in
        rangeRect
      end
    fun getRestrictToFillLevel self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRestrictToFillLevel_ self
    fun getRoundDigits self = (GtkRangeClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRoundDigits_ self
    fun getShowFillLevel self = (GtkRangeClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowFillLevel_ self
    fun getSliderRange self =
      let
        val sliderStart
         & sliderEnd
         & () =
          (
            GtkRangeClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSliderRange_
            (
              self
               & GInt.null
               & GInt.null
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
    fun setMinSliderSize self minSize = (GtkRangeClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMinSliderSize_ (self & minSize)
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
    fun setRoundDigits self roundDigits = (GtkRangeClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setRoundDigits_ (self & roundDigits)
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
