structure GtkUIManager :>
  GTK_U_I_MANAGER
    where type 'a class_t = 'a GtkUIManagerClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type u_i_manager_item_type_t = GtkUIManagerItemType.t
    where type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    where type 'a action_group_class_t = 'a GtkActionGroupClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a action_class_t = 'a GtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_ui_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_ui_manager_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addUi_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GtkUIManagerItemType.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val addUiFromFile_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui_from_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt.PolyML.VAL
          )
      val addUiFromString_ =
        call (load_sym libgtk "gtk_ui_manager_add_ui_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.SSize.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.UInt.PolyML.VAL
          )
      val ensureUpdate_ = call (load_sym libgtk "gtk_ui_manager_ensure_update") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAccelGroup_ = call (load_sym libgtk "gtk_ui_manager_get_accel_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAction_ = call (load_sym libgtk "gtk_ui_manager_get_action") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getAddTearoffs_ = call (load_sym libgtk "gtk_ui_manager_get_add_tearoffs") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getUi_ = call (load_sym libgtk "gtk_ui_manager_get_ui") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getWidget_ = call (load_sym libgtk "gtk_ui_manager_get_widget") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val insertActionGroup_ =
        call (load_sym libgtk "gtk_ui_manager_insert_action_group")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val newMergeId_ = call (load_sym libgtk "gtk_ui_manager_new_merge_id") (GObjectObjectClass.PolyML.PTR --> FFI.UInt.PolyML.VAL)
      val removeActionGroup_ = call (load_sym libgtk "gtk_ui_manager_remove_action_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeUi_ = call (load_sym libgtk "gtk_ui_manager_remove_ui") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val setAddTearoffs_ = call (load_sym libgtk "gtk_ui_manager_set_add_tearoffs") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkUIManagerClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type u_i_manager_item_type_t = GtkUIManagerItemType.t
    type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    type 'a action_group_class_t = 'a GtkActionGroupClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a action_class_t = 'a GtkActionClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkUIManagerClass.C.fromPtr true) new_ ()
    fun addUi self mergeId path name action type' top =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.UInt.C.fromVal
      )
        addUiFromString_
        (
          self
           & buffer
           & length
           & []
        )
    fun ensureUpdate self = (GObjectObjectClass.C.withPtr ---> I) ensureUpdate_ self
    fun getAccelGroup self = (GObjectObjectClass.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) getAccelGroup_ self
    fun getAction self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkActionClass.C.fromPtr false) getAction_ (self & path)
    fun getAddTearoffs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAddTearoffs_ self
    fun getUi self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getUi_ self
    fun getWidget self path = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ (self & path)
    fun insertActionGroup self actionGroup pos =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        insertActionGroup_
        (
          self
           & actionGroup
           & pos
        )
    fun newMergeId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) newMergeId_ self
    fun removeActionGroup self actionGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeActionGroup_ (self & actionGroup)
    fun removeUi self mergeId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeUi_ (self & mergeId)
    fun setAddTearoffs self addTearoffs = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
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
