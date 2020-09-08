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
      val getType_ = call (getSymbol "gtk_ui_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_ui_manager_new") (cVoid --> GtkUIManagerClass.PolyML.cPtr)
      val addUi_ =
        call (getSymbol "gtk_ui_manager_add_ui")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkUIManagerItemType.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val addUiFromFile_ =
        call (getSymbol "gtk_ui_manager_add_ui_from_file")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addUiFromResource_ =
        call (getSymbol "gtk_ui_manager_add_ui_from_resource")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val addUiFromString_ =
        call (getSymbol "gtk_ui_manager_add_ui_from_string")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val ensureUpdate_ = call (getSymbol "gtk_ui_manager_ensure_update") (GtkUIManagerClass.PolyML.cPtr --> cVoid)
      val getAccelGroup_ = call (getSymbol "gtk_ui_manager_get_accel_group") (GtkUIManagerClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAction_ = call (getSymbol "gtk_ui_manager_get_action") (GtkUIManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkActionClass.PolyML.cPtr)
      val getAddTearoffs_ = call (getSymbol "gtk_ui_manager_get_add_tearoffs") (GtkUIManagerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUi_ = call (getSymbol "gtk_ui_manager_get_ui") (GtkUIManagerClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidget_ = call (getSymbol "gtk_ui_manager_get_widget") (GtkUIManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val insertActionGroup_ =
        call (getSymbol "gtk_ui_manager_insert_action_group")
          (
            GtkUIManagerClass.PolyML.cPtr
             &&> GtkActionGroupClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val newMergeId_ = call (getSymbol "gtk_ui_manager_new_merge_id") (GtkUIManagerClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val removeActionGroup_ = call (getSymbol "gtk_ui_manager_remove_action_group") (GtkUIManagerClass.PolyML.cPtr &&> GtkActionGroupClass.PolyML.cPtr --> cVoid)
      val removeUi_ = call (getSymbol "gtk_ui_manager_remove_ui") (GtkUIManagerClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setAddTearoffs_ = call (getSymbol "gtk_ui_manager_set_add_tearoffs") (GtkUIManagerClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkUIManagerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type u_i_manager_item_type_t = GtkUIManagerItemType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a action_group_class = 'a GtkActionGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a action_class = 'a GtkActionClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkUIManagerClass.FFI.fromPtr true) new_ ()
    fun addUi
      self
      (
        mergeId,
        path,
        name,
        action,
        type',
        top
      ) =
      (
        GtkUIManagerClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GtkUIManagerItemType.FFI.withVal
         &&&> GBool.FFI.withVal
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
        GtkUIManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addUiFromFile_
        (
          self
           & filename
           & []
        )
    fun addUiFromResource self resourcePath =
      (
        GtkUIManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addUiFromResource_
        (
          self
           & resourcePath
           & []
        )
    fun addUiFromString self (buffer, length) =
      (
        GtkUIManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt64.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        addUiFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun ensureUpdate self = (GtkUIManagerClass.FFI.withPtr false ---> I) ensureUpdate_ self
    fun getAccelGroup self = (GtkUIManagerClass.FFI.withPtr false ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self
    fun getAction self path = (GtkUIManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkActionClass.FFI.fromPtr false) getAction_ (self & path)
    fun getAddTearoffs self = (GtkUIManagerClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAddTearoffs_ self
    fun getUi self = (GtkUIManagerClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getUi_ self
    fun getWidget self path = (GtkUIManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ (self & path)
    fun insertActionGroup self (actionGroup, pos) =
      (
        GtkUIManagerClass.FFI.withPtr false
         &&&> GtkActionGroupClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        insertActionGroup_
        (
          self
           & actionGroup
           & pos
        )
    fun newMergeId self = (GtkUIManagerClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) newMergeId_ self
    fun removeActionGroup self actionGroup = (GtkUIManagerClass.FFI.withPtr false &&&> GtkActionGroupClass.FFI.withPtr false ---> I) removeActionGroup_ (self & actionGroup)
    fun removeUi self mergeId = (GtkUIManagerClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) removeUi_ (self & mergeId)
    fun setAddTearoffs self addTearoffs = (GtkUIManagerClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    local
      open ClosureMarshal Signal
    in
      fun actionsChangedSig f = signal "actions-changed" (void ---> ret_void) f
      fun addWidgetSig f = signal "add-widget" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun connectProxySig f = signal "connect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun disconnectProxySig f = signal "disconnect-proxy" (get 0w1 GtkActionClass.t &&&> get 0w2 GtkWidgetClass.t ---> ret_void) (fn action & proxy => f (action, proxy))
      fun postActivateSig f = signal "post-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
      fun preActivateSig f = signal "pre-activate" (get 0w1 GtkActionClass.t ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val addTearoffsProp =
        {
          name = "add-tearoffs",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val uiProp =
        {
          name = "ui",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
