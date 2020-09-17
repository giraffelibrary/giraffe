structure GtkMenuShell :>
  GTK_MENU_SHELL
    where type 'a class = 'a GtkMenuShellClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a menu_item_class = 'a GtkMenuItemClass.class
    where type direction_type_t = GtkDirectionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type menu_direction_type_t = GtkMenuDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_shell_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activateItem_ =
        call (getSymbol "gtk_menu_shell_activate_item")
          (
            GtkMenuShellClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val append_ = call (getSymbol "gtk_menu_shell_append") (GtkMenuShellClass.PolyML.cPtr &&> GtkMenuItemClass.PolyML.cPtr --> cVoid)
      val bindModel_ =
        call (getSymbol "gtk_menu_shell_bind_model")
          (
            GtkMenuShellClass.PolyML.cPtr
             &&> GioMenuModelClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val cancel_ = call (getSymbol "gtk_menu_shell_cancel") (GtkMenuShellClass.PolyML.cPtr --> cVoid)
      val deactivate_ = call (getSymbol "gtk_menu_shell_deactivate") (GtkMenuShellClass.PolyML.cPtr --> cVoid)
      val deselect_ = call (getSymbol "gtk_menu_shell_deselect") (GtkMenuShellClass.PolyML.cPtr --> cVoid)
      val getParentShell_ = call (getSymbol "gtk_menu_shell_get_parent_shell") (GtkMenuShellClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getSelectedItem_ = call (getSymbol "gtk_menu_shell_get_selected_item") (GtkMenuShellClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getTakeFocus_ = call (getSymbol "gtk_menu_shell_get_take_focus") (GtkMenuShellClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val insert_ =
        call (getSymbol "gtk_menu_shell_insert")
          (
            GtkMenuShellClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val prepend_ = call (getSymbol "gtk_menu_shell_prepend") (GtkMenuShellClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val selectFirst_ = call (getSymbol "gtk_menu_shell_select_first") (GtkMenuShellClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val selectItem_ = call (getSymbol "gtk_menu_shell_select_item") (GtkMenuShellClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setTakeFocus_ = call (getSymbol "gtk_menu_shell_set_take_focus") (GtkMenuShellClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkMenuShellClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a menu_item_class = 'a GtkMenuItemClass.class
    type direction_type_t = GtkDirectionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type menu_direction_type_t = GtkMenuDirectionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activateItem self (menuItem, forceDeactivate) =
      (
        GtkMenuShellClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        activateItem_
        (
          self
           & menuItem
           & forceDeactivate
        )
    fun append self child = (GtkMenuShellClass.FFI.withPtr false &&&> GtkMenuItemClass.FFI.withPtr false ---> I) append_ (self & child)
    fun bindModel
      self
      (
        model,
        actionNamespace,
        withSeparators
      ) =
      (
        GtkMenuShellClass.FFI.withPtr false
         &&&> GioMenuModelClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GBool.FFI.withVal
         ---> I
      )
        bindModel_
        (
          self
           & model
           & actionNamespace
           & withSeparators
        )
    fun cancel self = (GtkMenuShellClass.FFI.withPtr false ---> I) cancel_ self
    fun deactivate self = (GtkMenuShellClass.FFI.withPtr false ---> I) deactivate_ self
    fun deselect self = (GtkMenuShellClass.FFI.withPtr false ---> I) deselect_ self
    fun getParentShell self = (GtkMenuShellClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getParentShell_ self before GtkMenuShellClass.FFI.touchPtr self
    fun getSelectedItem self = (GtkMenuShellClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getSelectedItem_ self before GtkMenuShellClass.FFI.touchPtr self
    fun getTakeFocus self = (GtkMenuShellClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTakeFocus_ self
    fun insert self (child, position) =
      (
        GtkMenuShellClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        insert_
        (
          self
           & child
           & position
        )
    fun prepend self child = (GtkMenuShellClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) prepend_ (self & child)
    fun selectFirst self searchSensitive = (GtkMenuShellClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) selectFirst_ (self & searchSensitive)
    fun selectItem self menuItem = (GtkMenuShellClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) selectItem_ (self & menuItem)
    fun setTakeFocus self takeFocus = (GtkMenuShellClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTakeFocus_ (self & takeFocus)
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
      open ValueAccessor
    in
      val takeFocusProp =
        {
          name = "take-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
