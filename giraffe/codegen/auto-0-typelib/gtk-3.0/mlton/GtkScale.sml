structure GtkScale :>
  GTK_SCALE
    where type 'a class_t = 'a GtkScaleClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type orientation_t = GtkOrientation.t
    where type positiontype_t = GtkPositionType.t =
  struct
    val getType_ = _import "gtk_scale_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scale_new" : GtkOrientation.C.val_ * unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
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
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkPositionType.C.val_
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val clearMarks_ = _import "gtk_scale_clear_marks" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getDigits_ = _import "gtk_scale_get_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getDrawValue_ = _import "gtk_scale_get_draw_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLayout_ = _import "gtk_scale_get_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scale_get_layout_offsets" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getValuePos_ = _import "gtk_scale_get_value_pos" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPositionType.C.val_;
    val setDigits_ = fn x1 & x2 => (_import "gtk_scale_set_digits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setDrawValue_ = fn x1 & x2 => (_import "gtk_scale_set_draw_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setValuePos_ = fn x1 & x2 => (_import "gtk_scale_set_value_pos" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
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
