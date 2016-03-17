structure GtkSpinButton :>
  GTK_SPIN_BUTTON
    where type 'a class = 'a GtkSpinButtonClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a editable_class = 'a GtkEditableClass.class
    where type spin_type_t = GtkSpinType.t
    where type scroll_type_t = GtkScrollType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type spin_button_update_policy_t = GtkSpinButtonUpdatePolicy.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_spin_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_spin_button_new")
          (
            GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newWithRange_ =
        call (load_sym libgtk "gtk_spin_button_new_with_range")
          (
            FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val configure_ =
        call (load_sym libgtk "gtk_spin_button_configure")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val getAdjustment_ = call (load_sym libgtk "gtk_spin_button_get_adjustment") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDigits_ = call (load_sym libgtk "gtk_spin_button_get_digits") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getIncrements_ =
        call (load_sym libgtk "gtk_spin_button_get_increments")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getNumeric_ = call (load_sym libgtk "gtk_spin_button_get_numeric") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRange_ =
        call (load_sym libgtk "gtk_spin_button_get_range")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cRef
             &&> FFI.Double.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getSnapToTicks_ = call (load_sym libgtk "gtk_spin_button_get_snap_to_ticks") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getUpdatePolicy_ = call (load_sym libgtk "gtk_spin_button_get_update_policy") (GObjectObjectClass.PolyML.cPtr --> GtkSpinButtonUpdatePolicy.PolyML.cVal)
      val getValue_ = call (load_sym libgtk "gtk_spin_button_get_value") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getValueAsInt_ = call (load_sym libgtk "gtk_spin_button_get_value_as_int") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getWrap_ = call (load_sym libgtk "gtk_spin_button_get_wrap") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAdjustment_ = call (load_sym libgtk "gtk_spin_button_set_adjustment") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setDigits_ = call (load_sym libgtk "gtk_spin_button_set_digits") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIncrements_ =
        call (load_sym libgtk "gtk_spin_button_set_increments")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setNumeric_ = call (load_sym libgtk "gtk_spin_button_set_numeric") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRange_ =
        call (load_sym libgtk "gtk_spin_button_set_range")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setSnapToTicks_ = call (load_sym libgtk "gtk_spin_button_set_snap_to_ticks") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUpdatePolicy_ = call (load_sym libgtk "gtk_spin_button_set_update_policy") (GObjectObjectClass.PolyML.cPtr &&> GtkSpinButtonUpdatePolicy.PolyML.cVal --> FFI.PolyML.cVoid)
      val setValue_ = call (load_sym libgtk "gtk_spin_button_set_value") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWrap_ = call (load_sym libgtk "gtk_spin_button_set_wrap") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val spin_ =
        call (load_sym libgtk "gtk_spin_button_spin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkSpinType.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val update_ = call (load_sym libgtk "gtk_spin_button_update") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkSpinButtonClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a editable_class = 'a GtkEditableClass.class
    type spin_type_t = GtkSpinType.t
    type scroll_type_t = GtkScrollType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type spin_button_update_policy_t = GtkSpinButtonUpdatePolicy.t
    type t = base class
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
