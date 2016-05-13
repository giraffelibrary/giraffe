structure GtkAdjustment :>
  GTK_ADJUSTMENT
    where type 'a class = 'a GtkAdjustmentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_adjustment_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_adjustment_new")
          (
            FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> GtkAdjustmentClass.PolyML.cPtr
          )
      val changed_ = call (load_sym libgtk "gtk_adjustment_changed") (GtkAdjustmentClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val clampPage_ =
        call (load_sym libgtk "gtk_adjustment_clamp_page")
          (
            GtkAdjustmentClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val configure_ =
        call (load_sym libgtk "gtk_adjustment_configure")
          (
            GtkAdjustmentClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getLower_ = call (load_sym libgtk "gtk_adjustment_get_lower") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getMinimumIncrement_ = call (load_sym libgtk "gtk_adjustment_get_minimum_increment") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getPageIncrement_ = call (load_sym libgtk "gtk_adjustment_get_page_increment") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getPageSize_ = call (load_sym libgtk "gtk_adjustment_get_page_size") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getStepIncrement_ = call (load_sym libgtk "gtk_adjustment_get_step_increment") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getUpper_ = call (load_sym libgtk "gtk_adjustment_get_upper") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getValue_ = call (load_sym libgtk "gtk_adjustment_get_value") (GtkAdjustmentClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val setLower_ = call (load_sym libgtk "gtk_adjustment_set_lower") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPageIncrement_ = call (load_sym libgtk "gtk_adjustment_set_page_increment") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPageSize_ = call (load_sym libgtk "gtk_adjustment_set_page_size") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setStepIncrement_ = call (load_sym libgtk "gtk_adjustment_set_step_increment") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setUpper_ = call (load_sym libgtk "gtk_adjustment_set_upper") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val setValue_ = call (load_sym libgtk "gtk_adjustment_set_value") (GtkAdjustmentClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> PolyMLFFI.cVoid)
      val valueChanged_ = call (load_sym libgtk "gtk_adjustment_value_changed") (GtkAdjustmentClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
