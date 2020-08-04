structure GtkHScale :>
  GTK_H_SCALE
    where type 'a class = 'a GtkHScaleClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_hscale_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_hscale_new" : GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_hscale_new_with_range" :
              GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkHScaleClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new adjustment = (GtkAdjustmentClass.FFI.withOptPtr false ---> GtkHScaleClass.FFI.fromPtr false) new_ adjustment
    fun newWithRange
      (
        min,
        max,
        step
      ) =
      (
        GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkHScaleClass.FFI.fromPtr false
      )
        newWithRange_
        (
          min
           & max
           & step
        )
  end
