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
    val getAdjustment_ = _import "gtk_range_get_adjustment" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p;
    val getFillLevel_ = _import "gtk_range_get_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GDouble.FFI.val_;
    val getFlippable_ = _import "gtk_range_get_flippable" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getInverted_ = _import "gtk_range_get_inverted" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getLowerStepperSensitivity_ = _import "gtk_range_get_lower_stepper_sensitivity" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getMinSliderSize_ = _import "gtk_range_get_min_slider_size" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GInt32.FFI.val_;
    val getRangeRect_ = fn x1 & x2 => (_import "gtk_range_get_range_rect" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getRestrictToFillLevel_ = _import "gtk_range_get_restrict_to_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getRoundDigits_ = _import "gtk_range_get_round_digits" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GInt32.FFI.val_;
    val getShowFillLevel_ = _import "gtk_range_get_show_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getSliderRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_get_slider_range" :
              GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSliderSizeFixed_ = _import "gtk_range_get_slider_size_fixed" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GBool.FFI.val_;
    val getUpperStepperSensitivity_ = _import "gtk_range_get_upper_stepper_sensitivity" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getValue_ = _import "gtk_range_get_value" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p -> GDouble.FFI.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_range_set_adjustment" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setFlippable_ = fn x1 & x2 => (_import "gtk_range_set_flippable" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_increments" :
              GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_range_set_inverted" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLowerStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_lower_stepper_sensitivity" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setMinSliderSize_ = fn x1 & x2 => (_import "gtk_range_set_min_slider_size" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_range" :
              GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRestrictToFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_restrict_to_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRoundDigits_ = fn x1 & x2 => (_import "gtk_range_set_round_digits" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setShowFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_show_fill_level" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSliderSizeFixed_ = fn x1 & x2 => (_import "gtk_range_set_slider_size_fixed" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUpperStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_upper_stepper_sensitivity" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_range_set_value" : GtkRangeClass.FFI.notnull GtkRangeClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRangeClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type sensitivity_type_t = GtkSensitivityType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAdjustment self = (GtkRangeClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getFillLevel self = (GtkRangeClass.FFI.withPtr ---> GDouble.FFI.fromVal) getFillLevel_ self
    fun getFlippable self = (GtkRangeClass.FFI.withPtr ---> GBool.FFI.fromVal) getFlippable_ self
    fun getInverted self = (GtkRangeClass.FFI.withPtr ---> GBool.FFI.fromVal) getInverted_ self
    fun getLowerStepperSensitivity self = (GtkRangeClass.FFI.withPtr ---> GtkSensitivityType.FFI.fromVal) getLowerStepperSensitivity_ self
    fun getMinSliderSize self = (GtkRangeClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMinSliderSize_ self
    fun getRangeRect self =
      let
        val rangeRect & () = (GtkRangeClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getRangeRect_ (self & ())
      in
        rangeRect
      end
    fun getRestrictToFillLevel self = (GtkRangeClass.FFI.withPtr ---> GBool.FFI.fromVal) getRestrictToFillLevel_ self
    fun getRoundDigits self = (GtkRangeClass.FFI.withPtr ---> GInt32.FFI.fromVal) getRoundDigits_ self
    fun getShowFillLevel self = (GtkRangeClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowFillLevel_ self
    fun getSliderRange self =
      let
        val sliderStart
         & sliderEnd
         & () =
          (
            GtkRangeClass.FFI.withPtr
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
    fun getSliderSizeFixed self = (GtkRangeClass.FFI.withPtr ---> GBool.FFI.fromVal) getSliderSizeFixed_ self
    fun getUpperStepperSensitivity self = (GtkRangeClass.FFI.withPtr ---> GtkSensitivityType.FFI.fromVal) getUpperStepperSensitivity_ self
    fun getValue self = (GtkRangeClass.FFI.withPtr ---> GDouble.FFI.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GtkRangeClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setFillLevel self fillLevel = (GtkRangeClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setFillLevel_ (self & fillLevel)
    fun setFlippable self flippable = (GtkRangeClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFlippable_ (self & flippable)
    fun setIncrements self (step, page) =
      (
        GtkRangeClass.FFI.withPtr
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
    fun setInverted self setting = (GtkRangeClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInverted_ (self & setting)
    fun setLowerStepperSensitivity self sensitivity = (GtkRangeClass.FFI.withPtr &&&> GtkSensitivityType.FFI.withVal ---> I) setLowerStepperSensitivity_ (self & sensitivity)
    fun setMinSliderSize self minSize = (GtkRangeClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMinSliderSize_ (self & minSize)
    fun setRange self (min, max) =
      (
        GtkRangeClass.FFI.withPtr
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
    fun setRestrictToFillLevel self restrictToFillLevel = (GtkRangeClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRestrictToFillLevel_ (self & restrictToFillLevel)
    fun setRoundDigits self roundDigits = (GtkRangeClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setRoundDigits_ (self & roundDigits)
    fun setShowFillLevel self showFillLevel = (GtkRangeClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowFillLevel_ (self & showFillLevel)
    fun setSliderSizeFixed self sizeFixed = (GtkRangeClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSliderSizeFixed_ (self & sizeFixed)
    fun setUpperStepperSensitivity self sensitivity = (GtkRangeClass.FFI.withPtr &&&> GtkSensitivityType.FFI.withVal ---> I) setUpperStepperSensitivity_ (self & sensitivity)
    fun setValue self value = (GtkRangeClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun adjustBoundsSig f = signal "adjust-bounds" (get 0w1 double ---> ret_void) f
      fun changeValueSig f = signal "change-value" (get 0w1 GtkScrollType.t &&&> get 0w2 double ---> ret boolean) (fn scroll & value => f (scroll, value))
      fun moveSliderSig f = signal "move-slider" (get 0w1 GtkScrollType.t ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val adjustmentProp =
        {
          get = fn x => get "adjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "adjustment" GtkAdjustmentClass.tOpt x
        }
      val fillLevelProp =
        {
          get = fn x => get "fill-level" double x,
          set = fn x => set "fill-level" double x
        }
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x
        }
      val lowerStepperSensitivityProp =
        {
          get = fn x => get "lower-stepper-sensitivity" GtkSensitivityType.t x,
          set = fn x => set "lower-stepper-sensitivity" GtkSensitivityType.t x
        }
      val restrictToFillLevelProp =
        {
          get = fn x => get "restrict-to-fill-level" boolean x,
          set = fn x => set "restrict-to-fill-level" boolean x
        }
      val roundDigitsProp =
        {
          get = fn x => get "round-digits" int x,
          set = fn x => set "round-digits" int x
        }
      val showFillLevelProp =
        {
          get = fn x => get "show-fill-level" boolean x,
          set = fn x => set "show-fill-level" boolean x
        }
      val upperStepperSensitivityProp =
        {
          get = fn x => get "upper-stepper-sensitivity" GtkSensitivityType.t x,
          set = fn x => set "upper-stepper-sensitivity" GtkSensitivityType.t x
        }
    end
  end
