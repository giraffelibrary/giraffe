structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class = 'a GtkAccelLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_accel_label_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_accel_label_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAccelWidget_ = call (getSymbol "gtk_accel_label_get_accel_widget") (GtkAccelLabelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAccelWidth_ = call (getSymbol "gtk_accel_label_get_accel_width") (GtkAccelLabelClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val refetch_ = call (getSymbol "gtk_accel_label_refetch") (GtkAccelLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccelClosure_ = call (getSymbol "gtk_accel_label_set_accel_closure") (GtkAccelLabelClass.PolyML.cPtr &&> GObjectClosureRecord.PolyML.cPtr --> cVoid)
      val setAccelWidget_ = call (getSymbol "gtk_accel_label_set_accel_widget") (GtkAccelLabelClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkAccelLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new string = (Utf8.FFI.withPtr ---> GtkAccelLabelClass.FFI.fromPtr false) new_ string
    fun getAccelWidget self = (GtkAccelLabelClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GtkAccelLabelClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) refetch_ self
    fun setAccelClosure self accelClosure = (GtkAccelLabelClass.FFI.withPtr &&&> GObjectClosureRecord.FFI.withPtr ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GtkAccelLabelClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setAccelWidget_ (self & accelWidget)
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
