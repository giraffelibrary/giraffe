structure GtkUIManager :>
  GTK_U_I_MANAGER
    where type 'a class = 'a GtkUIManagerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type u_i_manager_item_type_t = GtkUIManagerItemType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a action_group_class = 'a GtkActionGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a action_class = 'a GtkActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_ui_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_ui_manager_new") (PolyMLFFI.cVoid --> GtkUIManagerClass.PolyML.cPtr)
      val addUi_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkUIManagerItemType.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val addUiFromFile_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui_from_file")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt.PolyML.cVal
          )
      val addUiFromString_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui_from_string")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt.PolyML.cVal
          )
      val ensureUpdate_ = call (load_sym libgtk "gtk_ui_manager_ensure_update") (GtkUIManagerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getAccelGroup_ = call (load_sym libgtk "gtk_ui_manager_get_accel_group") (GtkUIManagerClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAction_ = call (load_sym libgtk "gtk_ui_manager_get_action") (GtkUIManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkActionClass.PolyML.cPtr)
      val getAddTearoffs_ = call (load_sym libgtk "gtk_ui_manager_get_add_tearoffs") (GtkUIManagerClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getUi_ = call (load_sym libgtk "gtk_ui_manager_get_ui") (GtkUIManagerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidget_ = call (load_sym libgtk "gtk_ui_manager_get_widget") (GtkUIManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val insertActionGroup_ =
        call (load_sym libgtk "gtk_ui_manager_insert_action_group")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> GtkActionGroupClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val newMergeId_ = call (load_sym libgtk "gtk_ui_manager_new_merge_id") (GtkUIManagerClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val removeActionGroup_ = call (load_sym libgtk "gtk_ui_manager_remove_action_group") (GtkUIManagerClass.PolyML.cPtr &&> GtkActionGroupClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeUi_ = call (load_sym libgtk "gtk_ui_manager_remove_ui") (GtkUIManagerClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setAddTearoffs_ = call (load_sym libgtk "gtk_ui_manager_set_add_tearoffs") (GtkUIManagerClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkUIManagerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type u_i_manager_item_type_t = GtkUIManagerItemType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a action_group_class = 'a GtkActionGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a action_class = 'a GtkActionClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkUIManagerClass.C.fromPtr true) new_ ()
    fun addUi self mergeId path name action type' top =
      (
        GtkUIManagerClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GtkUIManagerItemType.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        addUi_
        (
          self
           & mergeId
           & path
           & name
           & action
           & type'
           & top
        )
    fun addUiFromFile self filename =
      (
        GtkUIManagerClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt.C.fromVal
      )
        addUiFromFile_
        (
          self
           & filename
           & []
        )
    fun addUiFromString self buffer length =
      (
        GtkUIManagerClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt.C.fromVal
      )
        addUiFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun ensureUpdate self = (GtkUIManagerClass.C.withPtr ---> I) ensureUpdate_ self
    fun getAccelGroup self = (GtkUIManagerClass.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) getAccelGroup_ self
    fun getAction self path = (GtkUIManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkActionClass.C.fromPtr false) getAction_ (self & path)
    fun getAddTearoffs self = (GtkUIManagerClass.C.withPtr ---> FFI.Bool.C.fromVal) getAddTearoffs_ self
    fun getUi self = (GtkUIManagerClass.C.withPtr ---> Utf8.C.fromPtr true) getUi_ self
    fun getWidget self path = (GtkUIManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ (self & path)
    fun insertActionGroup self actionGroup pos =
      (
        GtkUIManagerClass.C.withPtr
         &&&> GtkActionGroupClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        insertActionGroup_
        (
          self
           & actionGroup
           & pos
        )
    fun newMergeId self = (GtkUIManagerClass.C.withPtr ---> FFI.UInt.C.fromVal) newMergeId_ self
    fun removeActionGroup self actionGroup = (GtkUIManagerClass.C.withPtr &&&> GtkActionGroupClass.C.withPtr ---> I) removeActionGroup_ (self & actionGroup)
    fun removeUi self mergeId = (GtkUIManagerClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeUi_ (self & mergeId)
    fun setAddTearoffs self addTearoffs = (GtkUIManagerClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    local
      open ClosureMarshal Signal
    in
      fun actionsChangedSig f = signal "actions-changed" (void ---> ret_void) f
      fun addWidgetSig f = signal "add-widget" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun connectProxySig f = signal "connect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f action proxy)
      fun disconnectProxySig f = signal "disconnect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f action proxy)
      fun postActivateSig f = signal "post-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
      fun preActivateSig f = signal "pre-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val addTearoffsProp =
        {
          get = fn x => get "add-tearoffs" boolean x,
          set = fn x => set "add-tearoffs" boolean x
        }
      val uiProp = {get = fn x => get "ui" stringOpt x}
    end
  end
