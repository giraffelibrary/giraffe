structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class = 'a GtkActionGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_action_group_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_action_group_new") (Utf8.PolyML.cInPtr --> GtkActionGroupClass.PolyML.cPtr)
      val addAction_ = call (load_sym libgtk "gtk_action_group_add_action") (GtkActionGroupClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val addActionWithAccel_ =
        call (load_sym libgtk "gtk_action_group_add_action_with_accel")
          (
            GtkActionGroupClass.PolyML.cPtr
             &&> GtkActionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> PolyMLFFI.cVoid
          )
      val getAction_ = call (load_sym libgtk "gtk_action_group_get_action") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkActionClass.PolyML.cPtr)
      val getName_ = call (load_sym libgtk "gtk_action_group_get_name") (GtkActionGroupClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSensitive_ = call (load_sym libgtk "gtk_action_group_get_sensitive") (GtkActionGroupClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getVisible_ = call (load_sym libgtk "gtk_action_group_get_visible") (GtkActionGroupClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val removeAction_ = call (load_sym libgtk "gtk_action_group_remove_action") (GtkActionGroupClass.PolyML.cPtr &&> GtkActionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setSensitive_ = call (load_sym libgtk "gtk_action_group_set_sensitive") (GtkActionGroupClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_action_group_set_translation_domain") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
      val setVisible_ = call (load_sym libgtk "gtk_action_group_set_visible") (GtkActionGroupClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val translateString_ = call (load_sym libgtk "gtk_action_group_translate_string") (GtkActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
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
