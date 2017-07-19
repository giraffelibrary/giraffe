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
      val getType_ = call (getSymbol "gtk_scale_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_scale_new") (GtkOrientation.PolyML.cVal &&> GtkAdjustmentClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithRange_ =
        call (getSymbol "gtk_scale_new_with_range")
          (
            GtkOrientation.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val addMark_ =
        call (getSymbol "gtk_scale_add_mark")
          (
            GtkScaleClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkPositionType.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val clearMarks_ = call (getSymbol "gtk_scale_clear_marks") (GtkScaleClass.PolyML.cPtr --> cVoid)
      val getDigits_ = call (getSymbol "gtk_scale_get_digits") (GtkScaleClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDrawValue_ = call (getSymbol "gtk_scale_get_draw_value") (GtkScaleClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLayout_ = call (getSymbol "gtk_scale_get_layout") (GtkScaleClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (getSymbol "gtk_scale_get_layout_offsets")
          (
            GtkScaleClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getValuePos_ = call (getSymbol "gtk_scale_get_value_pos") (GtkScaleClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val setDigits_ = call (getSymbol "gtk_scale_set_digits") (GtkScaleClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setDrawValue_ = call (getSymbol "gtk_scale_set_draw_value") (GtkScaleClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setValuePos_ = call (getSymbol "gtk_scale_set_value_pos") (GtkScaleClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkScaleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type orientation_t = GtkOrientation.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (orientation, adjustment) = (GtkOrientation.FFI.withVal &&&> GtkAdjustmentClass.FFI.withOptPtr ---> GtkScaleClass.FFI.fromPtr false) new_ (orientation & adjustment)
    fun newWithRange
      (
        orientation,
        min,
        max,
        step
      ) =
      (
        GtkOrientation.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkScaleClass.FFI.fromPtr false
      )
        newWithRange_
        (
          orientation
           & min
           & max
           & step
        )
    fun addMark
      self
      (
        value,
        position,
        markup
      ) =
      (
        GtkScaleClass.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        addMark_
        (
          self
           & value
           & position
           & markup
        )
    fun clearMarks self = (GtkScaleClass.FFI.withPtr ---> I) clearMarks_ self
    fun getDigits self = (GtkScaleClass.FFI.withPtr ---> GInt32.FFI.fromVal) getDigits_ self
    fun getDrawValue self = (GtkScaleClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawValue_ self
    fun getLayout self = (GtkScaleClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkScaleClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getValuePos self = (GtkScaleClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getValuePos_ self
    fun setDigits self digits = (GtkScaleClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setDigits_ (self & digits)
    fun setDrawValue self drawValue = (GtkScaleClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawValue_ (self & drawValue)
    fun setValuePos self pos = (GtkScaleClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setValuePos_ (self & pos)
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
