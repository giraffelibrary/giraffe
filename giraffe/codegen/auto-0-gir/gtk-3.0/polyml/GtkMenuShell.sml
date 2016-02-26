structure GtkMenuShell :>
  GTK_MENU_SHELL
    where type 'a class_t = 'a GtkMenuShellClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type direction_type_t = GtkDirectionType.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type menu_direction_type_t = GtkMenuDirectionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_shell_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val activateItem_ =
        call (load_sym libgtk "gtk_menu_shell_activate_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val append_ = call (load_sym libgtk "gtk_menu_shell_append") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val cancel_ = call (load_sym libgtk "gtk_menu_shell_cancel") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deactivate_ = call (load_sym libgtk "gtk_menu_shell_deactivate") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deselect_ = call (load_sym libgtk "gtk_menu_shell_deselect") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getParentShell_ = call (load_sym libgtk "gtk_menu_shell_get_parent_shell") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSelectedItem_ = call (load_sym libgtk "gtk_menu_shell_get_selected_item") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getTakeFocus_ = call (load_sym libgtk "gtk_menu_shell_get_take_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val insert_ =
        call (load_sym libgtk "gtk_menu_shell_insert")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val prepend_ = call (load_sym libgtk "gtk_menu_shell_prepend") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val selectFirst_ = call (load_sym libgtk "gtk_menu_shell_select_first") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectItem_ = call (load_sym libgtk "gtk_menu_shell_select_item") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTakeFocus_ = call (load_sym libgtk "gtk_menu_shell_set_take_focus") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkMenuShellClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type direction_type_t = GtkDirectionType.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type menu_direction_type_t = GtkMenuDirectionType.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activateItem self menuItem forceDeactivate =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        activateItem_
        (
          self
           & menuItem
           & forceDeactivate
        )
    fun append self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) append_ (self & child)
    fun cancel self = (GObjectObjectClass.C.withPtr ---> I) cancel_ self
    fun deactivate self = (GObjectObjectClass.C.withPtr ---> I) deactivate_ self
    fun deselect self = (GObjectObjectClass.C.withPtr ---> I) deselect_ self
    fun getParentShell self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getParentShell_ self
    fun getSelectedItem self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getSelectedItem_ self
    fun getTakeFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTakeFocus_ self
    fun insert self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        insert_
        (
          self
           & child
           & position
        )
    fun prepend self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) prepend_ (self & child)
    fun selectFirst self searchSensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) selectFirst_ (self & searchSensitive)
    fun selectItem self menuItem = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) selectItem_ (self & menuItem)
    fun setTakeFocus self takeFocus = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTakeFocus_ (self & takeFocus)
    local
      open ClosureMarshal Signal
    in
      fun activateCurrentSig f = signal "activate-current" (get 0w1 boolean ---> ret_void) f
      fun cancelSig f = signal "cancel" (void ---> ret_void) f
      fun cycleFocusSig f = signal "cycle-focus" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun deactivateSig f = signal "deactivate" (void ---> ret_void) f
      fun insertSig f = signal "insert" (get 0w1 GtkWidgetClass.t &&&> get 0w2 int ---> ret_void) (fn child & position => f child position)
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
