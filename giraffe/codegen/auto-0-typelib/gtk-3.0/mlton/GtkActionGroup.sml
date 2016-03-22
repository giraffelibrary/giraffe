structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class = 'a GtkActionGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    val getType_ = _import "gtk_action_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_action_group_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p;
    val addAction_ = fn x1 & x2 => (_import "gtk_action_group_add_action" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p * GtkActionClass.C.notnull GtkActionClass.C.p -> unit;) (x1, x2)
    val addActionWithAccel_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_action_group_add_action_with_accel" :
              GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p
               * GtkActionClass.C.notnull GtkActionClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_get_action" :
              GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkActionClass.C.notnull GtkActionClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "gtk_action_group_get_name" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSensitive_ = _import "gtk_action_group_get_sensitive" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p -> FFI.Bool.C.val_;
    val getVisible_ = _import "gtk_action_group_get_visible" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p -> FFI.Bool.C.val_;
    val removeAction_ = fn x1 & x2 => (_import "gtk_action_group_remove_action" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p * GtkActionClass.C.notnull GtkActionClass.C.p -> unit;) (x1, x2)
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_group_set_sensitive" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_set_translation_domain" :
              GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_group_set_visible" : GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val translateString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_translate_string" :
              GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
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
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (Utf8.C.withPtr ---> GtkActionGroupClass.C.fromPtr true) new_ name
    fun addAction self action = (GtkActionGroupClass.C.withPtr &&&> GtkActionClass.C.withPtr ---> I) addAction_ (self & action)
    fun addActionWithAccel self action accelerator =
      (
        GtkActionGroupClass.C.withPtr
         &&&> GtkActionClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        addActionWithAccel_
        (
          self
           & action
           & accelerator
        )
    fun getAction self actionName = (GtkActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkActionClass.C.fromPtr false) getAction_ (self & actionName)
    fun getName self = (GtkActionGroupClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSensitive self = (GtkActionGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getVisible self = (GtkActionGroupClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun removeAction self action = (GtkActionGroupClass.C.withPtr &&&> GtkActionClass.C.withPtr ---> I) removeAction_ (self & action)
    fun setSensitive self sensitive = (GtkActionGroupClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setTranslationDomain self domain = (GtkActionGroupClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun setVisible self visible = (GtkActionGroupClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun translateString self string = (GtkActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) translateString_ (self & string)
    local
      open ClosureMarshal Signal
    in
      fun connectProxySig f = signal "connect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f action proxy)
      fun disconnectProxySig f = signal "disconnect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f action proxy)
      fun postActivateSig f = signal "post-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
      fun preActivateSig f = signal "pre-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
    end
  end
