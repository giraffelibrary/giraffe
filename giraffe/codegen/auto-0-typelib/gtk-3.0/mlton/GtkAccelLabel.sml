structure GtkAccelLabel :>
  GTK_ACCEL_LABEL
    where type 'a class = 'a GtkAccelLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_accel_label_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_accel_label_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAccel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_label_get_accel" :
              GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p
               * GUInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAccelWidget_ = _import "gtk_accel_label_get_accel_widget" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getAccelWidth_ = _import "gtk_accel_label_get_accel_width" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GUInt32.FFI.val_;
    val refetch_ = _import "gtk_accel_label_refetch" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p -> GBool.FFI.val_;
    val setAccel_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_accel_label_set_accel" :
              GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAccelClosure_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_closure" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p * GObjectClosureRecord.FFI.non_opt GObjectClosureRecord.FFI.p -> unit;) (x1, x2)
    val setAccelWidget_ = fn x1 & x2 => (_import "gtk_accel_label_set_accel_widget" : GtkAccelLabelClass.FFI.non_opt GtkAccelLabelClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
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
    fun getAccelWidget self = (GtkAccelLabelClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getAccelWidget_ self
    fun getAccelWidth self = (GtkAccelLabelClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getAccelWidth_ self
    fun refetch self = (GtkAccelLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) refetch_ self
    fun setAccel self (acceleratorKey, acceleratorMods) =
      (
        GtkAccelLabelClass.FFI.withPtr
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
