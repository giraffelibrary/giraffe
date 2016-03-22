structure GtkRange :>
  GTK_RANGE
    where type 'a class = 'a GtkRangeClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type sensitivity_type_t = GtkSensitivityType.t =
  struct
    val getType_ = _import "gtk_range_get_type" : unit -> GObjectType.C.val_;
    val getAdjustment_ = _import "gtk_range_get_adjustment" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getFillLevel_ = _import "gtk_range_get_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Double.C.val_;
    val getFlippable_ = _import "gtk_range_get_flippable" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Bool.C.val_;
    val getInverted_ = _import "gtk_range_get_inverted" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Bool.C.val_;
    val getLowerStepperSensitivity_ = _import "gtk_range_get_lower_stepper_sensitivity" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> GtkSensitivityType.C.val_;
    val getMinSliderSize_ = _import "gtk_range_get_min_slider_size" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Int32.C.val_;
    val getRangeRect_ = fn x1 & x2 => (_import "gtk_range_get_range_rect" : GtkRangeClass.C.notnull GtkRangeClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val getRestrictToFillLevel_ = _import "gtk_range_get_restrict_to_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Bool.C.val_;
    val getRoundDigits_ = _import "gtk_range_get_round_digits" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Int32.C.val_;
    val getShowFillLevel_ = _import "gtk_range_get_show_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Bool.C.val_;
    val getSliderRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_get_slider_range" :
              GtkRangeClass.C.notnull GtkRangeClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSliderSizeFixed_ = _import "gtk_range_get_slider_size_fixed" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Bool.C.val_;
    val getUpperStepperSensitivity_ = _import "gtk_range_get_upper_stepper_sensitivity" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> GtkSensitivityType.C.val_;
    val getValue_ = _import "gtk_range_get_value" : GtkRangeClass.C.notnull GtkRangeClass.C.p -> FFI.Double.C.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_range_set_adjustment" : GtkRangeClass.C.notnull GtkRangeClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setFlippable_ = fn x1 & x2 => (_import "gtk_range_set_flippable" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_increments" :
              GtkRangeClass.C.notnull GtkRangeClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_range_set_inverted" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLowerStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_lower_stepper_sensitivity" : GtkRangeClass.C.notnull GtkRangeClass.C.p * GtkSensitivityType.C.val_ -> unit;) (x1, x2)
    val setMinSliderSize_ = fn x1 & x2 => (_import "gtk_range_set_min_slider_size" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_range_set_range" :
              GtkRangeClass.C.notnull GtkRangeClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRestrictToFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_restrict_to_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRoundDigits_ = fn x1 & x2 => (_import "gtk_range_set_round_digits" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setShowFillLevel_ = fn x1 & x2 => (_import "gtk_range_set_show_fill_level" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSliderSizeFixed_ = fn x1 & x2 => (_import "gtk_range_set_slider_size_fixed" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUpperStepperSensitivity_ = fn x1 & x2 => (_import "gtk_range_set_upper_stepper_sensitivity" : GtkRangeClass.C.notnull GtkRangeClass.C.p * GtkSensitivityType.C.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_range_set_value" : GtkRangeClass.C.notnull GtkRangeClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRangeClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type sensitivity_type_t = GtkSensitivityType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getAdjustment self = (GtkRangeClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getAdjustment_ self
    fun getFillLevel self = (GtkRangeClass.C.withPtr ---> FFI.Double.C.fromVal) getFillLevel_ self
    fun getFlippable self = (GtkRangeClass.C.withPtr ---> FFI.Bool.C.fromVal) getFlippable_ self
    fun getInverted self = (GtkRangeClass.C.withPtr ---> FFI.Bool.C.fromVal) getInverted_ self
    fun getLowerStepperSensitivity self = (GtkRangeClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getLowerStepperSensitivity_ self
    fun getMinSliderSize self = (GtkRangeClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinSliderSize_ self
    fun getRangeRect self =
      let
        val rangeRect & () = (GtkRangeClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getRangeRect_ (self & ())
      in
        rangeRect
      end
    fun getRestrictToFillLevel self = (GtkRangeClass.C.withPtr ---> FFI.Bool.C.fromVal) getRestrictToFillLevel_ self
    fun getRoundDigits self = (GtkRangeClass.C.withPtr ---> FFI.Int32.C.fromVal) getRoundDigits_ self
    fun getShowFillLevel self = (GtkRangeClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowFillLevel_ self
    fun getSliderRange self =
      let
        val sliderStart
         & sliderEnd
         & () =
          (
            GtkRangeClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getSliderRange_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (sliderStart, sliderEnd)
      end
    fun getSliderSizeFixed self = (GtkRangeClass.C.withPtr ---> FFI.Bool.C.fromVal) getSliderSizeFixed_ self
    fun getUpperStepperSensitivity self = (GtkRangeClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getUpperStepperSensitivity_ self
    fun getValue self = (GtkRangeClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun setAdjustment self adjustment = (GtkRangeClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setFillLevel self fillLevel = (GtkRangeClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setFillLevel_ (self & fillLevel)
    fun setFlippable self flippable = (GtkRangeClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFlippable_ (self & flippable)
    fun setIncrements self step page =
      (
        GtkRangeClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setIncrements_
        (
          self
           & step
           & page
        )
    fun setInverted self setting = (GtkRangeClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInverted_ (self & setting)
    fun setLowerStepperSensitivity self sensitivity = (GtkRangeClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setLowerStepperSensitivity_ (self & sensitivity)
    fun setMinSliderSize self minSize = (GtkRangeClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinSliderSize_ (self & minSize)
    fun setRange self min max =
      (
        GtkRangeClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setRange_
        (
          self
           & min
           & max
        )
    fun setRestrictToFillLevel self restrictToFillLevel = (GtkRangeClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRestrictToFillLevel_ (self & restrictToFillLevel)
    fun setRoundDigits self roundDigits = (GtkRangeClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRoundDigits_ (self & roundDigits)
    fun setShowFillLevel self showFillLevel = (GtkRangeClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowFillLevel_ (self & showFillLevel)
    fun setSliderSizeFixed self sizeFixed = (GtkRangeClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSliderSizeFixed_ (self & sizeFixed)
    fun setUpperStepperSensitivity self sensitivity = (GtkRangeClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setUpperStepperSensitivity_ (self & sensitivity)
    fun setValue self value = (GtkRangeClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun adjustBoundsSig f = signal "adjust-bounds" (get 0w1 double ---> ret_void) f
      fun changeValueSig f = signal "change-value" (get 0w1 GtkScrollType.t &&&> get 0w2 double ---> ret boolean) (fn scroll & value => f scroll value)
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
