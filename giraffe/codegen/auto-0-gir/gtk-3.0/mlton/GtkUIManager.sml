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
    val getType_ = _import "gtk_ui_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_ui_manager_new" : unit -> GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p;
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
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * FFI.UInt.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt.C.val_;
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
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.SSize.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val ensureUpdate_ = _import "gtk_ui_manager_ensure_update" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p -> unit;
    val getAccelGroup_ = _import "gtk_ui_manager_get_accel_group" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p -> GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p;
    val getAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_action" :
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkActionClass.C.notnull GtkActionClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAddTearoffs_ = _import "gtk_ui_manager_get_add_tearoffs" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p -> FFI.Bool.C.val_;
    val getUi_ = _import "gtk_ui_manager_get_ui" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_widget" :
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
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
              GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p
               * GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val newMergeId_ = _import "gtk_ui_manager_new_merge_id" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p -> FFI.UInt.C.val_;
    val removeActionGroup_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_action_group" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p * GtkActionGroupClass.C.notnull GtkActionGroupClass.C.p -> unit;) (x1, x2)
    val removeUi_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_ui" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_ui_manager_set_add_tearoffs" : GtkUIManagerClass.C.notnull GtkUIManagerClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
