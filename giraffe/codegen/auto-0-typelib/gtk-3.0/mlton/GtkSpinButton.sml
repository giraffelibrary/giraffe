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
    val getType_ = _import "gtk_spin_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_new" :
              GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p
               * GDouble.FFI.val_
               * GUInt32.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_new_with_range" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val configure_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_spin_button_configure" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p
               * GDouble.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAdjustment_ = _import "gtk_spin_button_get_adjustment" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getDigits_ = _import "gtk_spin_button_get_digits" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GUInt32.FFI.val_;
    val getIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_get_increments" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getNumeric_ = _import "gtk_spin_button_get_numeric" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GBool.FFI.val_;
    val getRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_get_range" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GDouble.FFI.ref_
               * GDouble.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSnapToTicks_ = _import "gtk_spin_button_get_snap_to_ticks" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GBool.FFI.val_;
    val getUpdatePolicy_ = _import "gtk_spin_button_get_update_policy" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GtkSpinButtonUpdatePolicy.FFI.val_;
    val getValue_ = _import "gtk_spin_button_get_value" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GDouble.FFI.val_;
    val getValueAsInt_ = _import "gtk_spin_button_get_value_as_int" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GInt32.FFI.val_;
    val getWrap_ = _import "gtk_spin_button_get_wrap" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> GBool.FFI.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_spin_button_set_adjustment" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setDigits_ = fn x1 & x2 => (_import "gtk_spin_button_set_digits" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_set_increments" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNumeric_ = fn x1 & x2 => (_import "gtk_spin_button_set_numeric" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_set_range" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSnapToTicks_ = fn x1 & x2 => (_import "gtk_spin_button_set_snap_to_ticks" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUpdatePolicy_ = fn x1 & x2 => (_import "gtk_spin_button_set_update_policy" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GtkSpinButtonUpdatePolicy.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_spin_button_set_value" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setWrap_ = fn x1 & x2 => (_import "gtk_spin_button_set_wrap" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val spin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_spin" :
              GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p
               * GtkSpinType.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val update_ = _import "gtk_spin_button_update" : GtkSpinButtonClass.FFI.non_opt GtkSpinButtonClass.FFI.p -> unit;
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkEditableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        adjustment,
        climbRate,
        digits
      ) =
      (
        GtkAdjustmentClass.FFI.withOptPtr false
         &&&> GDouble.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
        GtkSpinButtonClass.FFI.withPtr false
         &&&> GtkAdjustmentClass.FFI.withOptPtr false
         &&&> GDouble.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        configure_
        (
          self
           & adjustment
           & climbRate
           & digits
        )
    fun getAdjustment self = (GtkSpinButtonClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getAdjustment_ self
    fun getDigits self = (GtkSpinButtonClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getDigits_ self
    fun getIncrements self =
      let
        val step
         & page
         & () =
          (
            GtkSpinButtonClass.FFI.withPtr false
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
    fun getNumeric self = (GtkSpinButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNumeric_ self
    fun getRange self =
      let
        val min
         & max
         & () =
          (
            GtkSpinButtonClass.FFI.withPtr false
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
    fun getSnapToTicks self = (GtkSpinButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSnapToTicks_ self
    fun getUpdatePolicy self = (GtkSpinButtonClass.FFI.withPtr false ---> GtkSpinButtonUpdatePolicy.FFI.fromVal) getUpdatePolicy_ self
    fun getValue self = (GtkSpinButtonClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getValue_ self
    fun getValueAsInt self = (GtkSpinButtonClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getValueAsInt_ self
    fun getWrap self = (GtkSpinButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getWrap_ self
    fun setAdjustment self adjustment = (GtkSpinButtonClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setAdjustment_ (self & adjustment)
    fun setDigits self digits = (GtkSpinButtonClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setDigits_ (self & digits)
    fun setIncrements self (step, page) =
      (
        GtkSpinButtonClass.FFI.withPtr false
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
    fun setNumeric self numeric = (GtkSpinButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setNumeric_ (self & numeric)
    fun setRange self (min, max) =
      (
        GtkSpinButtonClass.FFI.withPtr false
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
    fun setSnapToTicks self snapToTicks = (GtkSpinButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSnapToTicks_ (self & snapToTicks)
    fun setUpdatePolicy self policy = (GtkSpinButtonClass.FFI.withPtr false &&&> GtkSpinButtonUpdatePolicy.FFI.withVal ---> I) setUpdatePolicy_ (self & policy)
    fun setValue self value = (GtkSpinButtonClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    fun setWrap self wrap = (GtkSpinButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setWrap_ (self & wrap)
    fun spin self (direction, increment) =
      (
        GtkSpinButtonClass.FFI.withPtr false
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
    fun update self = (GtkSpinButtonClass.FFI.withPtr false ---> I) update_ self
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
      val climbRateProp =
        {
          name = "climb-rate",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val digitsProp =
        {
          name = "digits",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val numericProp =
        {
          name = "numeric",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val snapToTicksProp =
        {
          name = "snap-to-ticks",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val updatePolicyProp =
        {
          name = "update-policy",
          gtype = fn () => C.gtype GtkSpinButtonUpdatePolicy.t (),
          get = fn x => fn () => C.get GtkSpinButtonUpdatePolicy.t x,
          set = fn x => C.set GtkSpinButtonUpdatePolicy.t x,
          init = fn x => C.set GtkSpinButtonUpdatePolicy.t x
        }
      val valueProp =
        {
          name = "value",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val wrapProp =
        {
          name = "wrap",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
