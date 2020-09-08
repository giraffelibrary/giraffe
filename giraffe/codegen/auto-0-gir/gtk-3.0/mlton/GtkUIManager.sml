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
    val getType_ = _import "gtk_ui_manager_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_ui_manager_new" : unit -> GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p;
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
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GtkUIManagerItemType.FFI.val_
               * GBool.FFI.val_
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
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addUiFromResource_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_ui_manager_add_ui_from_resource" :
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
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
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val ensureUpdate_ = _import "gtk_ui_manager_ensure_update" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p -> unit;
    val getAccelGroup_ = _import "gtk_ui_manager_get_accel_group" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p -> GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p;
    val getAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_action" :
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkActionClass.FFI.non_opt GtkActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAddTearoffs_ = _import "gtk_ui_manager_get_add_tearoffs" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p -> GBool.FFI.val_;
    val getUi_ = _import "gtk_ui_manager_get_ui" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWidget_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_ui_manager_get_widget" :
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
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
              GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p
               * GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val newMergeId_ = _import "gtk_ui_manager_new_merge_id" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p -> GUInt.FFI.val_;
    val removeActionGroup_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_action_group" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p * GtkActionGroupClass.FFI.non_opt GtkActionGroupClass.FFI.p -> unit;) (x1, x2)
    val removeUi_ = fn x1 & x2 => (_import "gtk_ui_manager_remove_ui" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_ui_manager_set_add_tearoffs" : GtkUIManagerClass.FFI.non_opt GtkUIManagerClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
         &&&> GUInt.FFI.withVal
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
         ---> GUInt.FFI.fromVal
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
         ---> GUInt.FFI.fromVal
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
         &&&> GSSize.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt.FFI.fromVal
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
         &&&> GInt.FFI.withVal
         ---> I
      )
        insertActionGroup_
        (
          self
           & actionGroup
           & pos
        )
    fun newMergeId self = (GtkUIManagerClass.FFI.withPtr false ---> GUInt.FFI.fromVal) newMergeId_ self
    fun removeActionGroup self actionGroup = (GtkUIManagerClass.FFI.withPtr false &&&> GtkActionGroupClass.FFI.withPtr false ---> I) removeActionGroup_ (self & actionGroup)
    fun removeUi self mergeId = (GtkUIManagerClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) removeUi_ (self & mergeId)
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
