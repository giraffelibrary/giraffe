structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class = 'a GtkActionGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class =
  struct
    val getType_ = _import "gtk_action_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_action_group_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p;
    val addAction_ = fn x1 & x2 => (_import "gtk_action_group_add_action" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p * GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;) (x1, x2)
    val addActionWithAccel_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_action_group_add_action_with_accel" :
              GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p
               * GtkActionClass.FFI.non_opt GtkActionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAccelGroup_ = _import "gtk_action_group_get_accel_group" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p -> GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p;
    val getAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_get_action" :
              GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "gtk_action_group_get_name" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getSensitive_ = _import "gtk_action_group_get_sensitive" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p -> GBool.FFI.val_;
    val getVisible_ = _import "gtk_action_group_get_visible" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p -> GBool.FFI.val_;
    val removeAction_ = fn x1 & x2 => (_import "gtk_action_group_remove_action" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p * GtkActionClass.FFI.non_opt GtkActionClass.FFI.p -> unit;) (x1, x2)
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_action_group_set_accel_group" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p * GtkAccelGroupClass.FFI.opt GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_group_set_sensitive" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_set_translation_domain" :
              GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_group_set_visible" : GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val translateString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_translate_string" :
              GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkActionGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a action_class = 'a GtkActionClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withPtr 0 ---> GtkActionGroupClass.FFI.fromPtr true) new_ name
    fun addAction self action = (GtkActionGroupClass.FFI.withPtr false &&&> GtkActionClass.FFI.withPtr false ---> I) addAction_ (self & action)
    fun addActionWithAccel self (action, accelerator) =
      (
        GtkActionGroupClass.FFI.withPtr false
         &&&> GtkActionClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        addActionWithAccel_
        (
          self
           & action
           & accelerator
        )
    fun getAccelGroup self = (GtkActionGroupClass.FFI.withPtr false ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self
    fun getAction self actionName = (GtkActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkActionClass.FFI.fromPtr false) getAction_ (self & actionName)
    fun getName self = (GtkActionGroupClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSensitive self = (GtkActionGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSensitive_ self
    fun getVisible self = (GtkActionGroupClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun removeAction self action = (GtkActionGroupClass.FFI.withPtr false &&&> GtkActionClass.FFI.withPtr false ---> I) removeAction_ (self & action)
    fun setAccelGroup self accelGroup = (GtkActionGroupClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withOptPtr false ---> I) setAccelGroup_ (self & accelGroup)
    fun setSensitive self sensitive = (GtkActionGroupClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setTranslationDomain self domain = (GtkActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTranslationDomain_ (self & domain)
    fun setVisible self visible = (GtkActionGroupClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun translateString self string = (GtkActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) translateString_ (self & string)
    local
      open ClosureMarshal Signal
    in
      fun connectProxySig f = signal "connect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun disconnectProxySig f = signal "disconnect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun postActivateSig f = signal "post-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
      fun preActivateSig f = signal "pre-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val accelGroupProp =
        {
          name = "accel-group",
          gtype = fn () => C.gtype GtkAccelGroupClass.tOpt (),
          get = fn x => fn () => C.get GtkAccelGroupClass.tOpt x,
          set = fn x => C.set GtkAccelGroupClass.tOpt x,
          init = fn x => C.set GtkAccelGroupClass.tOpt x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val sensitiveProp =
        {
          name = "sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
