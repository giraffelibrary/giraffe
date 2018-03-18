structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class = 'a GtkActionGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_action_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_action_group_new") (Utf8.PolyML.cInPtr --> GtkActionGroupClass.PolyML.cPtr)
      val addAction_ = call (getSymbol "gtk_action_group_add_action") (GtkActionGroupClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> cVoid)
      val addActionWithAccel_ =
        call (getSymbol "gtk_action_group_add_action_with_accel")
          (
            GtkActionGroupClass.PolyML.cPtr
             &&> GtkActionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val getAccelGroup_ = call (getSymbol "gtk_action_group_get_accel_group") (GtkActionGroupClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAction_ = call (getSymbol "gtk_action_group_get_action") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkActionClass.PolyML.cPtr)
      val getName_ = call (getSymbol "gtk_action_group_get_name") (GtkActionGroupClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSensitive_ = call (getSymbol "gtk_action_group_get_sensitive") (GtkActionGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisible_ = call (getSymbol "gtk_action_group_get_visible") (GtkActionGroupClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeAction_ = call (getSymbol "gtk_action_group_remove_action") (GtkActionGroupClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> cVoid)
      val setAccelGroup_ = call (getSymbol "gtk_action_group_set_accel_group") (GtkActionGroupClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> cVoid)
      val setSensitive_ = call (getSymbol "gtk_action_group_set_sensitive") (GtkActionGroupClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTranslationDomain_ = call (getSymbol "gtk_action_group_set_translation_domain") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setVisible_ = call (getSymbol "gtk_action_group_set_visible") (GtkActionGroupClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val translateString_ = call (getSymbol "gtk_action_group_translate_string") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GtkActionGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a action_class = 'a GtkActionClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withPtr ---> GtkActionGroupClass.FFI.fromPtr true) new_ name
    fun addAction self action = (GtkActionGroupClass.FFI.withPtr &&&> GtkActionClass.FFI.withPtr ---> I) addAction_ (self & action)
    fun addActionWithAccel self (action, accelerator) =
      (
        GtkActionGroupClass.FFI.withPtr
         &&&> GtkActionClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        addActionWithAccel_
        (
          self
           & action
           & accelerator
        )
    fun getAccelGroup self = (GtkActionGroupClass.FFI.withPtr ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self
    fun getAction self actionName = (GtkActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkActionClass.FFI.fromPtr false) getAction_ (self & actionName)
    fun getName self = (GtkActionGroupClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSensitive self = (GtkActionGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getSensitive_ self
    fun getVisible self = (GtkActionGroupClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisible_ self
    fun removeAction self action = (GtkActionGroupClass.FFI.withPtr &&&> GtkActionClass.FFI.withPtr ---> I) removeAction_ (self & action)
    fun setAccelGroup self accelGroup = (GtkActionGroupClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setSensitive self sensitive = (GtkActionGroupClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setTranslationDomain self domain = (GtkActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun setVisible self visible = (GtkActionGroupClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun translateString self string = (GtkActionGroupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) translateString_ (self & string)
    local
      open ClosureMarshal Signal
    in
      fun connectProxySig f = signal "connect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun disconnectProxySig f = signal "disconnect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun postActivateSig f = signal "post-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
      fun preActivateSig f = signal "pre-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val accelGroupProp =
        {
          get = fn x => get "accel-group" GtkAccelGroupClass.tOpt x,
          set = fn x => set "accel-group" GtkAccelGroupClass.tOpt x,
          new = fn x => new "accel-group" GtkAccelGroupClass.tOpt x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          new = fn x => new "name" stringOpt x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x,
          new = fn x => new "sensitive" boolean x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x,
          new = fn x => new "visible" boolean x
        }
    end
  end
