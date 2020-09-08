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
             &&> GUInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val getAccelWidget_ = call (getSymbol "gtk_accel_label_get_accel_widget") (GtkAccelLabelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getAccelWidth_ = call (getSymbol "gtk_accel_label_get_accel_width") (GtkAccelLabelClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val refetch_ = call (getSymbol "gtk_accel_label_refetch") (GtkAccelLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccel_ =
        call (getSymbol "gtk_accel_label_set_accel")
          (
            GtkAccelLabelClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new string = (Utf8.FFI.withPtr 0 ---> GtkAccelLabelClass.FFI.fromPtr false) new_ string
    fun getAccel self =
      let
        val acceleratorKey
         & acceleratorMods
         & () =
          (
            GtkAccelLabelClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            getAccel_
            (
              self
               & GUInt32.null
               & GdkModifierType.flags []
            )
      in
        (acceleratorKey, acceleratorMods)
      end
    fun getAccelWidget self = (GtkAccelLabelClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GtkAccelLabelClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) refetch_ self
    fun setAccel self (acceleratorKey, acceleratorMods) =
      (
        GtkAccelLabelClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        setAccel_
        (
          self
           & acceleratorKey
           & acceleratorMods
        )
    fun setAccelClosure self accelClosure = (GtkAccelLabelClass.FFI.withPtr false &&&> GObjectClosureRecord.FFI.withPtr false ---> I) setAccelClosure_ (self & accelClosure)
    fun setAccelWidget self accelWidget = (GtkAccelLabelClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setAccelWidget_ (self & accelWidget)
    local
      open ValueAccessor
    in
      val accelClosureProp =
        {
          name = "accel-closure",
          gtype = fn () => C.gtype GObjectClosureRecord.tOpt (),
          get = fn x => fn () => C.get GObjectClosureRecord.tOpt x,
          set = fn x => C.set GObjectClosureRecord.tOpt x,
          init = fn x => C.set GObjectClosureRecord.tOpt x
        }
      val accelWidgetProp =
        {
          name = "accel-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
    end
  end
