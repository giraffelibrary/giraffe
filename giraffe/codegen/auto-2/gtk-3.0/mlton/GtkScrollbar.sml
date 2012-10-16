structure GtkScrollbar :>
  GTK_SCROLLBAR
    where type 'a class_t = 'a GtkScrollbarClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a orientableclass_t = 'a GtkOrientableClass.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type orientation_t = GtkOrientation.t =
  struct
    val getType_ = _import "gtk_scrollbar_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scrollbar_new" : GtkOrientation.C.val_ * unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    type 'a class_t = 'a GtkScrollbarClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a orientableclass_t = 'a GtkOrientableClass.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type orientation_t = GtkOrientation.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new orientation adjustment = (GtkOrientation.C.withVal &&&> GObjectObjectClass.C.withOptPtr ---> GtkScrollbarClass.C.fromPtr false) new_ (orientation & adjustment)
  end
