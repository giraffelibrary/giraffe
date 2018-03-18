structure GtkLockButton :>
  GTK_LOCK_BUTTON
    where type 'a class = 'a GtkLockButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_lock_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_lock_button_new") (GioPermissionClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getPermission_ = call (getSymbol "gtk_lock_button_get_permission") (GtkLockButtonClass.PolyML.cPtr --> GioPermissionClass.PolyML.cPtr)
      val setPermission_ = call (getSymbol "gtk_lock_button_set_permission") (GtkLockButtonClass.PolyML.cPtr &&> GioPermissionClass.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkLockButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new permission = (GioPermissionClass.FFI.withOptPtr ---> GtkLockButtonClass.FFI.fromPtr false) new_ permission
    fun getPermission self = (GtkLockButtonClass.FFI.withPtr ---> GioPermissionClass.FFI.fromPtr false) getPermission_ self
    fun setPermission self permission = (GtkLockButtonClass.FFI.withPtr &&&> GioPermissionClass.FFI.withOptPtr ---> I) setPermission_ (self & permission)
    local
      open Property
    in
      val permissionProp =
        {
          get = fn x => get "permission" GioPermissionClass.tOpt x,
          set = fn x => set "permission" GioPermissionClass.tOpt x,
          new = fn x => new "permission" GioPermissionClass.tOpt x
        }
      val textLockProp =
        {
          get = fn x => get "text-lock" stringOpt x,
          set = fn x => set "text-lock" stringOpt x,
          new = fn x => new "text-lock" stringOpt x
        }
      val textUnlockProp =
        {
          get = fn x => get "text-unlock" stringOpt x,
          set = fn x => set "text-unlock" stringOpt x,
          new = fn x => new "text-unlock" stringOpt x
        }
      val tooltipLockProp =
        {
          get = fn x => get "tooltip-lock" stringOpt x,
          set = fn x => set "tooltip-lock" stringOpt x,
          new = fn x => new "tooltip-lock" stringOpt x
        }
      val tooltipNotAuthorizedProp =
        {
          get = fn x => get "tooltip-not-authorized" stringOpt x,
          set = fn x => set "tooltip-not-authorized" stringOpt x,
          new = fn x => new "tooltip-not-authorized" stringOpt x
        }
      val tooltipUnlockProp =
        {
          get = fn x => get "tooltip-unlock" stringOpt x,
          set = fn x => set "tooltip-unlock" stringOpt x,
          new = fn x => new "tooltip-unlock" stringOpt x
        }
    end
  end
