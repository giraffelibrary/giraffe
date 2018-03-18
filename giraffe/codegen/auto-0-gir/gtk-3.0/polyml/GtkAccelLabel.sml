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
      val getAccel_ =
        call (getSymbol "gtk_accel_label_get_accel")
          (
            GtkAccelLabelClass.PolyML.cPtr
             &&> GUInt.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val getAccelWidget_ = call (getSymbol "gtk_accel_label_get_accel_widget") (GtkAccelLabelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getAccelWidth_ = call (getSymbol "gtk_accel_label_get_accel_width") (GtkAccelLabelClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val refetch_ = call (getSymbol "gtk_accel_label_refetch") (GtkAccelLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccel_ =
        call (getSymbol "gtk_accel_label_set_accel")
          (
            GtkAccelLabelClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> cVoid
          )
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
    fun getAccel self =
      let
        val acceleratorKey
         & acceleratorMods
         & () =
          (
            GtkAccelLabelClass.FFI.withPtr
             &&&> GUInt.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            getAccel_
            (
              self
               & GUInt.null
               & GdkModifierType.flags []
            )
      in
        (acceleratorKey, acceleratorMods)
      end
    fun getAccelWidget self = (GtkAccelLabelClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GtkAccelLabelClass.FFI.withPtr ---> GUInt.FFI.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) refetch_ self
    fun setAccel self (acceleratorKey, acceleratorMods) =
      (
        GtkAccelLabelClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        setAccel_
        (
          self
           & acceleratorKey
           & acceleratorMods
        )
    fun setAccelClosure self accelClosure = (GtkAccelLabelClass.FFI.withPtr &&&> GObjectClosureRecord.FFI.withPtr ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GtkAccelLabelClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setAccelWidget_ (self & accelWidget)
    local
      open Property
    in
      val accelClosureProp =
        {
          get = fn x => get "accel-closure" GObjectClosureRecord.tOpt x,
          set = fn x => set "accel-closure" GObjectClosureRecord.tOpt x,
          new = fn x => new "accel-closure" GObjectClosureRecord.tOpt x
        }
      val accelWidgetProp =
        {
          get = fn x => get "accel-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "accel-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "accel-widget" GtkWidgetClass.tOpt x
        }
    end
  end
