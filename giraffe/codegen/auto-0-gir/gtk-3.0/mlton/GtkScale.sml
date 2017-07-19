structure GtkScale :>
  GTK_SCALE
    where type 'a class = 'a GtkScaleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type orientation_t = GtkOrientation.t
    where type position_type_t = GtkPositionType.t =
  struct
    val getType_ = _import "gtk_scale_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scale_new" : GtkOrientation.FFI.val_ * unit GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val newWithRange_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_scale_new_with_range" :
              GtkOrientation.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
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
              GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p
               * GDouble.FFI.val_
               * GtkPositionType.FFI.val_
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
    val clearMarks_ = _import "gtk_scale_clear_marks" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p -> unit;
    val getDigits_ = _import "gtk_scale_get_digits" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p -> GInt.FFI.val_;
    val getDrawValue_ = _import "gtk_scale_get_draw_value" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p -> GBool.FFI.val_;
    val getLayout_ = _import "gtk_scale_get_layout" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scale_get_layout_offsets" :
              GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getValuePos_ = _import "gtk_scale_get_value_pos" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p -> GtkPositionType.FFI.val_;
    val setDigits_ = fn x1 & x2 => (_import "gtk_scale_set_digits" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setDrawValue_ = fn x1 & x2 => (_import "gtk_scale_set_draw_value" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setValuePos_ = fn x1 & x2 => (_import "gtk_scale_set_value_pos" : GtkScaleClass.FFI.notnull GtkScaleClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
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
    fun getDigits self = (GtkScaleClass.FFI.withPtr ---> GInt.FFI.fromVal) getDigits_ self
    fun getDrawValue self = (GtkScaleClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawValue_ self
    fun getLayout self = (GtkScaleClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkScaleClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (x, y)
      end
    fun getValuePos self = (GtkScaleClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getValuePos_ self
    fun setDigits self digits = (GtkScaleClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setDigits_ (self & digits)
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
