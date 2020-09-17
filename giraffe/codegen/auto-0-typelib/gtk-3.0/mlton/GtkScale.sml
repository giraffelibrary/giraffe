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
    val new_ = fn x1 & x2 => (_import "gtk_scale_new" : GtkOrientation.FFI.val_ * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
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
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p
               * GDouble.FFI.val_
               * GtkPositionType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clearMarks_ = _import "gtk_scale_clear_marks" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> unit;
    val getDigits_ = _import "gtk_scale_get_digits" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> GInt32.FFI.val_;
    val getDrawValue_ = _import "gtk_scale_get_draw_value" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> GBool.FFI.val_;
    val getHasOrigin_ = _import "gtk_scale_get_has_origin" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> GBool.FFI.val_;
    val getLayout_ = _import "gtk_scale_get_layout" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> PangoLayoutClass.FFI.opt PangoLayoutClass.FFI.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scale_get_layout_offsets" :
              GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getValuePos_ = _import "gtk_scale_get_value_pos" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p -> GtkPositionType.FFI.val_;
    val setDigits_ = fn x1 & x2 => (_import "gtk_scale_set_digits" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDrawValue_ = fn x1 & x2 => (_import "gtk_scale_set_draw_value" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasOrigin_ = fn x1 & x2 => (_import "gtk_scale_set_has_origin" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setValuePos_ = fn x1 & x2 => (_import "gtk_scale_set_value_pos" : GtkScaleClass.FFI.non_opt GtkScaleClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkScaleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type orientation_t = GtkOrientation.t
    type position_type_t = GtkPositionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (orientation, adjustment) = (GtkOrientation.FFI.withVal &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> GtkScaleClass.FFI.fromPtr false) new_ (orientation & adjustment) before GtkAdjustmentClass.FFI.touchOptPtr adjustment
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
        GtkScaleClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkPositionType.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        addMark_
        (
          self
           & value
           & position
           & markup
        )
    fun clearMarks self = (GtkScaleClass.FFI.withPtr false ---> I) clearMarks_ self
    fun getDigits self = (GtkScaleClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getDigits_ self
    fun getDrawValue self = (GtkScaleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDrawValue_ self
    fun getHasOrigin self = (GtkScaleClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasOrigin_ self
    fun getLayout self = (GtkScaleClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromOptPtr false) getLayout_ self before GtkScaleClass.FFI.touchPtr self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkScaleClass.FFI.withPtr false
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
    fun getValuePos self = (GtkScaleClass.FFI.withPtr false ---> GtkPositionType.FFI.fromVal) getValuePos_ self
    fun setDigits self digits = (GtkScaleClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDigits_ (self & digits)
    fun setDrawValue self drawValue = (GtkScaleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDrawValue_ (self & drawValue)
    fun setHasOrigin self hasOrigin = (GtkScaleClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasOrigin_ (self & hasOrigin)
    fun setValuePos self pos = (GtkScaleClass.FFI.withPtr false &&&> GtkPositionType.FFI.withVal ---> I) setValuePos_ (self & pos)
    local
      open ClosureMarshal Signal
    in
      fun formatValueSig f = signal "format-value" (get 0w1 double ---> ret string) f
    end
    local
      open ValueAccessor
    in
      val digitsProp =
        {
          name = "digits",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val drawValueProp =
        {
          name = "draw-value",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hasOriginProp =
        {
          name = "has-origin",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val valuePosProp =
        {
          name = "value-pos",
          gtype = fn () => C.gtype GtkPositionType.t (),
          get = fn x => fn () => C.get GtkPositionType.t x,
          set = fn x => C.set GtkPositionType.t x,
          init = fn x => C.set GtkPositionType.t x
        }
    end
  end
