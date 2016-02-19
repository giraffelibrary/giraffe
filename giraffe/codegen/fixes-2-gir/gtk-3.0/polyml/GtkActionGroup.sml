structure GtkActionGroup :>
  GTK_ACTION_GROUP
    where type 'a class_t = 'a GtkActionGroupClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type action_entry_t = GtkActionEntry.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a action_class_t = 'a GtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_action_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_action_group_new") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val addAction_ = call (load_sym libgtk "gtk_action_group_add_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addActionWithAccel_ =
        call (load_sym libgtk "gtk_action_group_add_action_with_accel")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val getAction_ = call (load_sym libgtk "gtk_action_group_get_action") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getName_ = call (load_sym libgtk "gtk_action_group_get_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getSensitive_ = call (load_sym libgtk "gtk_action_group_get_sensitive") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getVisible_ = call (load_sym libgtk "gtk_action_group_get_visible") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val removeAction_ = call (load_sym libgtk "gtk_action_group_remove_action") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setSensitive_ = call (load_sym libgtk "gtk_action_group_set_sensitive") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTranslationDomain_ = call (load_sym libgtk "gtk_action_group_set_translation_domain") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setVisible_ = call (load_sym libgtk "gtk_action_group_set_visible") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val translateString_ = call (load_sym libgtk "gtk_action_group_translate_string") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> Utf8.PolyML.RETPTR)
    end
    type 'a class_t = 'a GtkActionGroupClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type action_entry_t = GtkActionEntry.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a action_class_t = 'a GtkActionClass.t
    type t = base class_t
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
