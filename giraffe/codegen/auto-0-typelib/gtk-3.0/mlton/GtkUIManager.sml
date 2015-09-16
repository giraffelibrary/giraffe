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
    val getType_ = _import "gtk_ui_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_ui_manager_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addUi_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & (x7, x8)
         & x9
         & x10 =>
          (
            _import "mlton_gtk_ui_manager_add_ui" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GtkUIManagerItemType.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val addUiFromFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_ui_manager_add_ui_from_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt32.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addUiFromString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_ui_manager_add_ui_from_string" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt32.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val ensureUpdate_ = _import "gtk_ui_manager_ensure_update" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAccelGroup_ = _import "gtk_ui_manager_get_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_action" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAddTearoffs_ = _import "gtk_ui_manager_get_add_tearoffs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUi_ = _import "gtk_ui_manager_get_ui" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_widget" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val insertActionGroup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_ui_manager_insert_action_group" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val newMergeId_ = _import "gtk_ui_manager_new_merge_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val removeActionGroup_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_action_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val removeUi_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_ui" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_ui_manager_set_add_tearoffs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
         &&&> FFI.UInt32.C.withVal
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
         ---> FFI.UInt32.C.fromVal
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
         &&&> FFI.Int64.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.UInt32.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        insertActionGroup_
        (
          self
           & actionGroup
           & pos
        )
    fun newMergeId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) newMergeId_ self
    fun removeActionGroup self actionGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeActionGroup_ (self & actionGroup)
    fun removeUi self mergeId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) removeUi_ (self & mergeId)
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
