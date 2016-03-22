structure GtkScale :>
  GTK_SCALE
    where type 'a class = 'a GtkScaleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type orientation_t = GtkOrientation.t
    where type position_type_t = GtkPositionType.t =
  struct
    val getType_ = _import "gtk_scale_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scale_new" : GtkOrientation.C.val_ * unit GtkAdjustmentClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val newWithRange_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_scale_new_with_range" :
              GtkOrientation.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addMark_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_gtk_scale_add_mark" :
              GtkScaleClass.C.notnull GtkScaleClass.C.p
               * FFI.Double.C.val_
               * GtkPositionType.C.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clearMarks_ = _import "gtk_scale_clear_marks" : GtkScaleClass.C.notnull GtkScaleClass.C.p -> unit;
    val getDigits_ = _import "gtk_scale_get_digits" : GtkScaleClass.C.notnull GtkScaleClass.C.p -> FFI.Int.C.val_;
    val getDrawValue_ = _import "gtk_scale_get_draw_value" : GtkScaleClass.C.notnull GtkScaleClass.C.p -> FFI.Bool.C.val_;
    val getLayout_ = _import "gtk_scale_get_layout" : GtkScaleClass.C.notnull GtkScaleClass.C.p -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scale_get_layout_offsets" :
              GtkScaleClass.C.notnull GtkScaleClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getValuePos_ = _import "gtk_scale_get_value_pos" : GtkScaleClass.C.notnull GtkScaleClass.C.p -> GtkPositionType.C.val_;
    val setDigits_ = fn x1 & x2 => (_import "gtk_scale_set_digits" : GtkScaleClass.C.notnull GtkScaleClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setDrawValue_ = fn x1 & x2 => (_import "gtk_scale_set_draw_value" : GtkScaleClass.C.notnull GtkScaleClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setValuePos_ = fn x1 & x2 => (_import "gtk_scale_set_value_pos" : GtkScaleClass.C.notnull GtkScaleClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
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
    fun getDigits self = (GtkScaleClass.C.withPtr ---> FFI.Int.C.fromVal) getDigits_ self
    fun getDrawValue self = (GtkScaleClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawValue_ self
    fun getLayout self = (GtkScaleClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkScaleClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (x, y)
      end
    fun getValuePos self = (GtkScaleClass.C.withPtr ---> GtkPositionType.C.fromVal) getValuePos_ self
    fun setDigits self digits = (GtkScaleClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDigits_ (self & digits)
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
