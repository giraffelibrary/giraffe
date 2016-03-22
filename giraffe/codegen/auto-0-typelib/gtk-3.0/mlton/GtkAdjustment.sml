structure GtkAdjustment :>
  GTK_ADJUSTMENT
    where type 'a class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_adjustment_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_adjustment_new" :
              FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val changed_ = _import "gtk_adjustment_changed" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;
    val clampPage_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_adjustment_clamp_page" :
              GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
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
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_adjustment_configure" :
              GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getLower_ = _import "gtk_adjustment_get_lower" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getMinimumIncrement_ = _import "gtk_adjustment_get_minimum_increment" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getPageIncrement_ = _import "gtk_adjustment_get_page_increment" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getPageSize_ = _import "gtk_adjustment_get_page_size" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getStepIncrement_ = _import "gtk_adjustment_get_step_increment" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getUpper_ = _import "gtk_adjustment_get_upper" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val getValue_ = _import "gtk_adjustment_get_value" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> FFI.Double.C.val_;
    val setLower_ = fn x1 & x2 => (_import "gtk_adjustment_set_lower" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setPageIncrement_ = fn x1 & x2 => (_import "gtk_adjustment_set_page_increment" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setPageSize_ = fn x1 & x2 => (_import "gtk_adjustment_set_page_size" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setStepIncrement_ = fn x1 & x2 => (_import "gtk_adjustment_set_step_increment" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setUpper_ = fn x1 & x2 => (_import "gtk_adjustment_set_upper" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_adjustment_set_value" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val valueChanged_ = _import "gtk_adjustment_value_changed" : GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;
    type 'a class = 'a GtkAdjustmentClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new value lower upper stepIncrement pageIncrement pageSize =
      (
        FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> GtkAdjustmentClass.C.fromPtr false
      )
        new_
        (
          value
           & lower
           & upper
           & stepIncrement
           & pageIncrement
           & pageSize
        )
    fun changed self = (GtkAdjustmentClass.C.withPtr ---> I) changed_ self
    fun clampPage self lower upper =
      (
        GtkAdjustmentClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        clampPage_
        (
          self
           & lower
           & upper
        )
    fun configure self value lower upper stepIncrement pageIncrement pageSize =
      (
        GtkAdjustmentClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        configure_
        (
          self
           & value
           & lower
           & upper
           & stepIncrement
           & pageIncrement
           & pageSize
        )
    fun getLower self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getLower_ self
    fun getMinimumIncrement self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getMinimumIncrement_ self
    fun getPageIncrement self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getPageIncrement_ self
    fun getPageSize self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getPageSize_ self
    fun getStepIncrement self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getStepIncrement_ self
    fun getUpper self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getUpper_ self
    fun getValue self = (GtkAdjustmentClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun setLower self lower = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setLower_ (self & lower)
    fun setPageIncrement self pageIncrement = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPageIncrement_ (self & pageIncrement)
    fun setPageSize self pageSize = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPageSize_ (self & pageSize)
    fun setStepIncrement self stepIncrement = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setStepIncrement_ (self & stepIncrement)
    fun setUpper self upper = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setUpper_ (self & upper)
    fun setValue self value = (GtkAdjustmentClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
    fun valueChanged self = (GtkAdjustmentClass.C.withPtr ---> I) valueChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun valueChangedSig f = signal "value-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val lowerProp =
        {
          get = fn x => get "lower" double x,
          set = fn x => set "lower" double x
        }
      val pageIncrementProp =
        {
          get = fn x => get "page-increment" double x,
          set = fn x => set "page-increment" double x
        }
      val pageSizeProp =
        {
          get = fn x => get "page-size" double x,
          set = fn x => set "page-size" double x
        }
      val stepIncrementProp =
        {
          get = fn x => get "step-increment" double x,
          set = fn x => set "step-increment" double x
        }
      val upperProp =
        {
          get = fn x => get "upper" double x,
          set = fn x => set "upper" double x
        }
      val valueProp =
        {
          get = fn x => get "value" double x,
          set = fn x => set "value" double x
        }
    end
  end
