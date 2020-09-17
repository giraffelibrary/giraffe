structure GtkVScrollbar :>
  GTK_V_SCROLLBAR
    where type 'a class = 'a GtkVScrollbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class =
  struct
    val getType_ = _import "gtk_vscrollbar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_vscrollbar_new" : GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkVScrollbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new adjustment = (GtkAdjustmentClass.FFI.withOptPtr false ---> GtkVScrollbarClass.FFI.fromPtr false) new_ adjustment before GtkAdjustmentClass.FFI.touchOptPtr adjustment
  end
