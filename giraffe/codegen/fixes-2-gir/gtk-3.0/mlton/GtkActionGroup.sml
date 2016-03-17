structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class = 'a GtkActionGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type action_entry_t = GtkActionEntry.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    val getType_ = _import "gtk_action_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_action_group_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addAction_ = fn x1 & x2 => (_import "gtk_action_group_add_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val addActionWithAccel_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_action_group_add_action_with_accel" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "gtk_action_group_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSensitive_ = _import "gtk_action_group_get_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getVisible_ = _import "gtk_action_group_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val removeAction_ = fn x1 & x2 => (_import "gtk_action_group_remove_action" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setSensitive_ = fn x1 & x2 => (_import "gtk_action_group_set_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTranslationDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_set_translation_domain" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisible_ = fn x1 & x2 => (_import "gtk_action_group_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val translateString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_action_group_translate_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    type action_entry_t = GtkActionEntry.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a action_class = 'a GtkActionClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (Utf8.C.withPtr ---> GtkActionGroupClass.C.fromPtr true) new_ name
    fun addAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addAction_ (self & action)
    fun addActionWithAccel self action accelerator =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        addActionWithAccel_
        (
          self
           & action
           & accelerator
        )
    local
      fun add self {name, stockId, label, accelerator, tooltip, callback} =
        let
          val action = GtkAction.new name label tooltip stockId
        in
          Option.map (Signal.connect action GtkAction.activateSig) callback;
          addActionWithAccel self action accelerator
        end
    in
      fun addActions self entries = List.app (add self) entries
    end
    fun getAction self actionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkActionClass.C.fromPtr false) getAction_ (self & actionName)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun removeAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeAction_ (self & action)
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setTranslationDomain self domain = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun translateString self string = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) translateString_ (self & string)
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
