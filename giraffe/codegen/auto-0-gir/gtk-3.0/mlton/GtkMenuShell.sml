structure GtkMenuShell :>
  GTK_MENU_SHELL
    where type 'a class = 'a GtkMenuShellClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type direction_type_t = GtkDirectionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type menu_direction_type_t = GtkMenuDirectionType.t =
  struct
    val getType_ = _import "gtk_menu_shell_get_type" : unit -> GObjectType.FFI.val_;
    val activateItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_menu_shell_activate_item" :
              GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val append_ = fn x1 & x2 => (_import "gtk_menu_shell_append" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val cancel_ = _import "gtk_menu_shell_cancel" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> unit;
    val deactivate_ = _import "gtk_menu_shell_deactivate" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> unit;
    val deselect_ = _import "gtk_menu_shell_deselect" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> unit;
    val getParentShell_ = _import "gtk_menu_shell_get_parent_shell" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getSelectedItem_ = _import "gtk_menu_shell_get_selected_item" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getTakeFocus_ = _import "gtk_menu_shell_get_take_focus" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p -> GBool.FFI.val_;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_menu_shell_insert" :
              GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val prepend_ = fn x1 & x2 => (_import "gtk_menu_shell_prepend" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val selectFirst_ = fn x1 & x2 => (_import "gtk_menu_shell_select_first" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val selectItem_ = fn x1 & x2 => (_import "gtk_menu_shell_select_item" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setTakeFocus_ = fn x1 & x2 => (_import "gtk_menu_shell_set_take_focus" : GtkMenuShellClass.FFI.notnull GtkMenuShellClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkMenuShellClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type direction_type_t = GtkDirectionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type menu_direction_type_t = GtkMenuDirectionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activateItem self (menuItem, forceDeactivate) =
      (
        GtkMenuShellClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        activateItem_
        (
          self
           & menuItem
           & forceDeactivate
        )
    fun append self child = (GtkMenuShellClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) append_ (self & child)
    fun cancel self = (GtkMenuShellClass.FFI.withPtr ---> I) cancel_ self
    fun deactivate self = (GtkMenuShellClass.FFI.withPtr ---> I) deactivate_ self
    fun deselect self = (GtkMenuShellClass.FFI.withPtr ---> I) deselect_ self
    fun getParentShell self = (GtkMenuShellClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getParentShell_ self
    fun getSelectedItem self = (GtkMenuShellClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getSelectedItem_ self
    fun getTakeFocus self = (GtkMenuShellClass.FFI.withPtr ---> GBool.FFI.fromVal) getTakeFocus_ self
    fun insert self (child, position) =
      (
        GtkMenuShellClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & child
           & position
        )
    fun prepend self child = (GtkMenuShellClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) prepend_ (self & child)
    fun selectFirst self searchSensitive = (GtkMenuShellClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) selectFirst_ (self & searchSensitive)
    fun selectItem self menuItem = (GtkMenuShellClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) selectItem_ (self & menuItem)
    fun setTakeFocus self takeFocus = (GtkMenuShellClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTakeFocus_ (self & takeFocus)
    local
      open ClosureMarshal Signal
    in
      fun activateCurrentSig f = signal "activate-current" (get 0w1 boolean ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun cycleFocusSig f = signal "cycle-focus" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun deactivateSig f = signal "deactivate" (void ---> ret_void) f
      fun insertSig f = signal "insert" (get 0w1 GtkWidgetClass.t &&&> get 0w2 int ---> ret_void) (fn child & position => f (child, position))
      fun moveCurrentSig f = signal "move-current" (get 0w1 GtkMenuDirectionType.t ---> ret_void) f
      fun moveSelectedSig f = signal "move-selected" (get 0w1 int ---> ret boolean) f
      fun selectionDoneSig f = signal "selection-done" (void ---> ret_void) f
    end
    local
      open Property
    in
      val takeFocusProp =
        {
          get = fn x => get "take-focus" boolean x,
          set = fn x => set "take-focus" boolean x
        }
    end
  end
