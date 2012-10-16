structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class_t = 'a GtkActionGroupClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a actionclass_t = 'a GtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_action_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_action_group_new") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val addAction_ = call (load_sym libgtk "gtk_action_group_add_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addActionWithAccel_ =
        call (load_sym libgtk "gtk_action_group_add_action_with_accel")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val getAction_ = call (load_sym libgtk "gtk_action_group_get_action") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getName_ = call (load_sym libgtk "gtk_action_group_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getSensitive_ = call (load_sym libgtk "gtk_action_group_get_sensitive") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getVisible_ = call (load_sym libgtk "gtk_action_group_get_visible") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val removeAction_ = call (load_sym libgtk "gtk_action_group_remove_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setSensitive_ = call (load_sym libgtk "gtk_action_group_set_sensitive") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_action_group_set_translation_domain") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setVisible_ = call (load_sym libgtk "gtk_action_group_set_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val translateString_ = call (load_sym libgtk "gtk_action_group_translate_string") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
    end
    type 'a class_t = 'a GtkActionGroupClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a actionclass_t = 'a GtkActionClass.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (FFI.String.withConstPtr ---> GtkActionGroupClass.C.fromPtr true) new_ name
    fun addAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addAction_ (self & action)
    fun addActionWithAccel self action accelerator =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstOptPtr
         ---> I
      )
        addActionWithAccel_
        (
          self
           & action
           & accelerator
        )
    fun getAction self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GtkActionClass.C.fromPtr false) getAction_ (self & actionName)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getSensitive_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisible_ self
    fun removeAction self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeAction_ (self & action)
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setSensitive_ (self & sensitive)
    fun setTranslationDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setTranslationDomain_ (self & domain)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisible_ (self & visible)
    fun translateString self string = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) translateString_ (self & string)
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
