structure GtkSpinButton :>
  GTK_SPIN_BUTTON
    where type 'a class_t = 'a GtkSpinButtonClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    where type 'a editableclass_t = 'a GtkEditableClass.t
    where type spintype_t = GtkSpinType.t
    where type scrolltype_t = GtkScrollType.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type spinbuttonupdatepolicy_t = GtkSpinButtonUpdatePolicy.t =
  struct
    val getType_ = _import "gtk_spin_button_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_new" :
              unit GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.UInt.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAdjustment_ = _import "gtk_spin_button_get_adjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDigits_ = _import "gtk_spin_button_get_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_get_increments" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getNumeric_ = _import "gtk_spin_button_get_numeric" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_get_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.ref_
               * FFI.Double.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSnapToTicks_ = _import "gtk_spin_button_get_snap_to_ticks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUpdatePolicy_ = _import "gtk_spin_button_get_update_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkSpinButtonUpdatePolicy.C.val_;
    val getValue_ = _import "gtk_spin_button_get_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getValueAsInt_ = _import "gtk_spin_button_get_value_as_int" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getWrap_ = _import "gtk_spin_button_get_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAdjustment_ = fn x1 & x2 => (_import "gtk_spin_button_set_adjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setDigits_ = fn x1 & x2 => (_import "gtk_spin_button_set_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setIncrements_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_set_increments" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNumeric_ = fn x1 & x2 => (_import "gtk_spin_button_set_numeric" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_set_range" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSnapToTicks_ = fn x1 & x2 => (_import "gtk_spin_button_set_snap_to_ticks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUpdatePolicy_ = fn x1 & x2 => (_import "gtk_spin_button_set_update_policy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkSpinButtonUpdatePolicy.C.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_spin_button_set_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setWrap_ = fn x1 & x2 => (_import "gtk_spin_button_set_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val spin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_spin_button_spin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkSpinType.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val update_ = _import "gtk_spin_button_update" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkSpinButtonClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celleditableclass_t = 'a GtkCellEditableClass.t
    type 'a editableclass_t = 'a GtkEditableClass.t
    type spintype_t = GtkSpinType.t
    type scrolltype_t = GtkScrollType.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type spinbuttonupdatepolicy_t = GtkSpinButtonUpdatePolicy.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.C.withPtr ---> GtkEditableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new adjustment climbRate digits =
      (
        GObjectObjectClass.C.withOptPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> GtkSpinButtonClass.C.fromPtr false
      )
        new_
        (
          adjustment
           & climbRate
           & digits
        )
    fun newWithRange min max step =
      (
        FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> GtkSpinButtonClass.C.fromPtr false
      )
        newWithRange_
        (
          min
           & max
           & step
        )
    fun configure self adjustment climbRate digits =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        configure_
        (
          self
           & adjustment
           & climbRate
           & digits
        )
    fun getAdjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getAdjustment_ self
    fun getDigits self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getDigits_ self
    fun getIncrements self =
      let
        val step
         & page
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            getIncrements_
            (
              self
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (step, page)
      end
    fun getNumeric self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getNumeric_ self
    fun getRange self =
      let
        val min
         & max
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Double.C.withRefVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal
                   && FFI.Double.C.fromVal
                   && I
          )
            getRange_
            (
              self
               & FFI.Double.null
               & FFI.Double.null
            )
      in
        (min, max)
      end
    fun getSnapToTicks self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSnapToTicks_ self
    fun getUpdatePolicy self = (GObjectObjectClass.C.withPtr ---> GtkSpinButtonUpdatePolicy.C.fromVal) getUpdatePolicy_ self
    fun getValue self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun getValueAsInt self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getValueAsInt_ self
    fun getWrap self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getWrap_ self
    fun setAdjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setAdjustment_ (self & adjustment)
    fun setDigits self digits = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setDigits_ (self & digits)
    fun setIncrements self step page =
      (
        GObjectObjectClass.C.withPtr
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
    fun setNumeric self numeric = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setNumeric_ (self & numeric)
    fun setRange self min max =
      (
        GObjectObjectClass.C.withPtr
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
    fun setSnapToTicks self snapToTicks = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSnapToTicks_ (self & snapToTicks)
    fun setUpdatePolicy self policy = (GObjectObjectClass.C.withPtr &&&> GtkSpinButtonUpdatePolicy.C.withVal ---> I) setUpdatePolicy_ (self & policy)
    fun setValue self value = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
    fun setWrap self wrap = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setWrap_ (self & wrap)
    fun spin self direction increment =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkSpinType.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        spin_
        (
          self
           & direction
           & increment
        )
    fun update self = (GObjectObjectClass.C.withPtr ---> I) update_ self
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
