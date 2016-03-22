structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class = 'a GtkAccelLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accel_label_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_accel_label_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getAccelWidget_ = _import "gtk_accel_label_get_accel_widget" : GtkAccelLabelClass.C.notnull GtkAccelLabelClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getAccelWidth_ = _import "gtk_accel_label_get_accel_width" : GtkAccelLabelClass.C.notnull GtkAccelLabelClass.C.p -> FFI.UInt32.C.val_;
    val refetch_ = _import "gtk_accel_label_refetch" : GtkAccelLabelClass.C.notnull GtkAccelLabelClass.C.p -> FFI.Bool.C.val_;
    val setAccelClosure_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_closure" : GtkAccelLabelClass.C.notnull GtkAccelLabelClass.C.p * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;) (x1, x2)
    val setAccelWidget_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_widget" : GtkAccelLabelClass.C.notnull GtkAccelLabelClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkAccelLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new string = (Utf8.C.withPtr ---> GtkAccelLabelClass.C.fromPtr false) new_ string
    fun getAccelWidget self = (GtkAccelLabelClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GtkAccelLabelClass.C.withPtr ---> FFI.UInt32.C.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) refetch_ self
    fun setAccelClosure self accelClosure = (GtkAccelLabelClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GtkAccelLabelClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setAccelWidget_ (self & accelWidget)
    local
      open Property
    in
      val accelClosureProp =
        {
          get = fn x => get "accel-closure" GObjectClosureRecord.tOpt x,
          set = fn x => set "accel-closure" GObjectClosureRecord.tOpt x
        }
      val accelWidgetProp =
        {
          get = fn x => get "accel-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "accel-widget" GtkWidgetClass.tOpt x
        }
    end
  end
