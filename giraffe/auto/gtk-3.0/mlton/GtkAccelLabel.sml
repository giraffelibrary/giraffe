structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class_t = 'a GtkAccelLabelClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_accel_label_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_accel_label_new" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAccelWidget_ = _import "gtk_accel_label_get_accel_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAccelWidth_ = _import "gtk_accel_label_get_accel_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val refetch_ = _import "gtk_accel_label_refetch" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAccelClosure_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_closure" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectClosureRecord.C.notnull GObjectClosureRecord.C.p -> unit;) (x1, x2)
    val setAccelWidget_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GtkAccelLabelClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new string = (FFI.String.C.withConstPtr ---> GtkAccelLabelClass.C.fromPtr false) new_ string
    fun getAccelWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getAccelWidth_ self
    fun refetch self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) refetch_ self
    fun setAccelClosure self accelClosure = (GObjectObjectClass.C.withPtr &&&> GObjectClosureRecord.C.withPtr ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setAccelWidget_ (self & accelWidget)
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
