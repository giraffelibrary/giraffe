structure GtkScale :>
  GTK_SCALE
    where type 'a class_t = 'a GtkScaleClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type orientation_t = GtkOrientation.t
    where type positiontype_t = GtkPositionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scale_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_scale_new") (GtkOrientation.PolyML.VAL &&> GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithRange_ =
        call (load_sym libgtk "gtk_scale_new_with_range")
          (
            GtkOrientation.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val addMark_ =
        call (load_sym libgtk "gtk_scale_add_mark")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> GtkPositionType.PolyML.VAL
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val clearMarks_ = call (load_sym libgtk "gtk_scale_clear_marks") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getDigits_ = call (load_sym libgtk "gtk_scale_get_digits") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getDrawValue_ = call (load_sym libgtk "gtk_scale_get_draw_value") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getLayout_ = call (load_sym libgtk "gtk_scale_get_layout") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getLayoutOffsets_ =
        call (load_sym libgtk "gtk_scale_get_layout_offsets")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getValuePos_ = call (load_sym libgtk "gtk_scale_get_value_pos") (GObjectObjectClass.PolyML.PTR --> GtkPositionType.PolyML.VAL)
      val setDigits_ = call (load_sym libgtk "gtk_scale_set_digits") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setDrawValue_ = call (load_sym libgtk "gtk_scale_set_draw_value") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setValuePos_ = call (load_sym libgtk "gtk_scale_set_value_pos") (GObjectObjectClass.PolyML.PTR &&> GtkPositionType.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkScaleClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type orientation_t = GtkOrientation.t
    type positiontype_t = GtkPositionType.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation adjustment = (GtkOrientation.C.withVal &&&> GObjectObjectClass.C.withOptPtr ---> GtkScaleClass.C.fromPtr false) new_ (orientation & adjustment)
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkPositionType.C.withVal
         &&&> FFI.String.C.withConstOptPtr
         ---> I
      )
        addMark_
        (
          self
           & value
           & position
           & markup
        )
    fun clearMarks self = (GObjectObjectClass.C.withPtr ---> I) clearMarks_ self
    fun getDigits self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getDigits_ self
    fun getDrawValue self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawValue_ self
    fun getLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & 0
               & 0
            )
      in
        (x, y)
      end
    fun getValuePos self = (GObjectObjectClass.C.withPtr ---> GtkPositionType.C.fromVal) getValuePos_ self
    fun setDigits self digits = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDigits_ (self & digits)
    fun setDrawValue self drawValue = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawValue_ (self & drawValue)
    fun setValuePos self pos = (GObjectObjectClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setValuePos_ (self & pos)
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
