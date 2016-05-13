structure GtkScale :>
  GTK_SCALE
    where type 'a class = 'a GtkScaleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type orientation_t = GtkOrientation.t
    where type position_type_t = GtkPositionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scale_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_scale_new") (GtkOrientation.PolyML.cVal &&> GtkAdjustmentClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithRange_ =
        call (load_sym libgtk "gtk_scale_new_with_range")
          (
            GtkOrientation.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val addMark_ =
        call (load_sym libgtk "gtk_scale_add_mark")
          (
            GtkScaleClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> PolyMLFFI.cVoid
          )
      val clearMarks_ = call (load_sym libgtk "gtk_scale_clear_marks") (GtkScaleClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getDigits_ = call (load_sym libgtk "gtk_scale_get_digits") (GtkScaleClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getDrawValue_ = call (load_sym libgtk "gtk_scale_get_draw_value") (GtkScaleClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLayout_ = call (load_sym libgtk "gtk_scale_get_layout") (GtkScaleClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (load_sym libgtk "gtk_scale_get_layout_offsets")
          (
            GtkScaleClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getValuePos_ = call (load_sym libgtk "gtk_scale_get_value_pos") (GtkScaleClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val setDigits_ = call (load_sym libgtk "gtk_scale_set_digits") (GtkScaleClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDrawValue_ = call (load_sym libgtk "gtk_scale_set_draw_value") (GtkScaleClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setValuePos_ = call (load_sym libgtk "gtk_scale_set_value_pos") (GtkScaleClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkScaleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type orientation_t = GtkOrientation.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation adjustment = (GtkOrientation.C.withVal &&&> GtkAdjustmentClass.C.withOptPtr ---> GtkScaleClass.C.fromPtr false) new_ (orientation & adjustment)
    fun newWithRange orientation min max step =
      (
        GtkOrientation.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> GtkScaleClass.C.fromPtr false
      )
        newWithRange_
        (
          orientation
           & min
           & max
           & step
        )
    fun addMark self value position markup =
      (
        GtkScaleClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkPositionType.C.withVal
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        addMark_
        (
          self
           & value
           & position
           & markup
        )
    fun clearMarks self = (GtkScaleClass.C.withPtr ---> I) clearMarks_ self
    fun getDigits self = (GtkScaleClass.C.withPtr ---> FFI.Int32.C.fromVal) getDigits_ self
    fun getDrawValue self = (GtkScaleClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawValue_ self
    fun getLayout self = (GtkScaleClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkScaleClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (x, y)
      end
    fun getValuePos self = (GtkScaleClass.C.withPtr ---> GtkPositionType.C.fromVal) getValuePos_ self
    fun setDigits self digits = (GtkScaleClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDigits_ (self & digits)
    fun setDrawValue self drawValue = (GtkScaleClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawValue_ (self & drawValue)
    fun setValuePos self pos = (GtkScaleClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setValuePos_ (self & pos)
    local
      open ClosureMarshal Signal
    in
      fun formatValueSig f = signal "format-value" (get 0w1 double ---> ret string) f
    end
    local
      open Property
    in
      val digitsProp =
        {
          get = fn x => get "digits" int x,
          set = fn x => set "digits" int x
        }
      val drawValueProp =
        {
          get = fn x => get "draw-value" boolean x,
          set = fn x => set "draw-value" boolean x
        }
      val valuePosProp =
        {
          get = fn x => get "value-pos" GtkPositionType.t x,
          set = fn x => set "value-pos" GtkPositionType.t x
        }
    end
  end
