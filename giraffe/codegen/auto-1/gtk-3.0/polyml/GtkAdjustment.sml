structure GtkAdjustment :>
  GTK_ADJUSTMENT
    where type 'a class_t = 'a GtkAdjustmentClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_adjustment_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_adjustment_new")
          (
            FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val changed_ = call (load_sym libgtk "gtk_adjustment_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val clampPage_ =
        call (load_sym libgtk "gtk_adjustment_clamp_page")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val configure_ =
        call (load_sym libgtk "gtk_adjustment_configure")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getLower_ = call (load_sym libgtk "gtk_adjustment_get_lower") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getMinimumIncrement_ = call (load_sym libgtk "gtk_adjustment_get_minimum_increment") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getPageIncrement_ = call (load_sym libgtk "gtk_adjustment_get_page_increment") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getPageSize_ = call (load_sym libgtk "gtk_adjustment_get_page_size") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getStepIncrement_ = call (load_sym libgtk "gtk_adjustment_get_step_increment") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getUpper_ = call (load_sym libgtk "gtk_adjustment_get_upper") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getValue_ = call (load_sym libgtk "gtk_adjustment_get_value") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val setLower_ = call (load_sym libgtk "gtk_adjustment_set_lower") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setPageIncrement_ = call (load_sym libgtk "gtk_adjustment_set_page_increment") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setPageSize_ = call (load_sym libgtk "gtk_adjustment_set_page_size") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setStepIncrement_ = call (load_sym libgtk "gtk_adjustment_set_step_increment") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setUpper_ = call (load_sym libgtk "gtk_adjustment_set_upper") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setValue_ = call (load_sym libgtk "gtk_adjustment_set_value") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val valueChanged_ = call (load_sym libgtk "gtk_adjustment_value_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAdjustmentClass.t
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
    fun changed self = (GObjectObjectClass.C.withPtr ---> I) changed_ self
    fun clampPage self lower upper =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun getLower self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getLower_ self
    fun getMinimumIncrement self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getMinimumIncrement_ self
    fun getPageIncrement self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPageIncrement_ self
    fun getPageSize self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPageSize_ self
    fun getStepIncrement self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getStepIncrement_ self
    fun getUpper self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getUpper_ self
    fun getValue self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getValue_ self
    fun setLower self lower = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setLower_ (self & lower)
    fun setPageIncrement self pageIncrement = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPageIncrement_ (self & pageIncrement)
    fun setPageSize self pageSize = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPageSize_ (self & pageSize)
    fun setStepIncrement self stepIncrement = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setStepIncrement_ (self & stepIncrement)
    fun setUpper self upper = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setUpper_ (self & upper)
    fun setValue self value = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setValue_ (self & value)
    fun valueChanged self = (GObjectObjectClass.C.withPtr ---> I) valueChanged_ self
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
