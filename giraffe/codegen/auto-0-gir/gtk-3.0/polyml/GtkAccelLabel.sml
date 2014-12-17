structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class_t = 'a GtkAccelLabelClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_accel_label_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_accel_label_new") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getAccelWidget_ = call (load_sym libgtk "gtk_accel_label_get_accel_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAccelWidth_ = call (load_sym libgtk "gtk_accel_label_get_accel_width") (GObjectObjectClass.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val refetch_ = call (load_sym libgtk "gtk_accel_label_refetch") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setAccelClosure_ = call (load_sym libgtk "gtk_accel_label_set_accel_closure") (GObjectObjectClass.PolyML.PTR &&> GObjectClosureRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setAccelWidget_ = call (load_sym libgtk "gtk_accel_label_set_accel_widget") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkAccelLabelClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type t = base class_t
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
