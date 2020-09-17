structure GtkLockButton :>
  GTK_LOCK_BUTTON
    where type 'a class = 'a GtkLockButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_lock_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_lock_button_new" : GioPermissionClass.FFI.opt GioPermissionClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getPermission_ = _import "gtk_lock_button_get_permission" : GtkLockButtonClass.FFI.non_opt GtkLockButtonClass.FFI.p -> GioPermissionClass.FFI.non_opt GioPermissionClass.FFI.p;
    val setPermission_ = fn x1 & x2 => (_import "gtk_lock_button_set_permission" : GtkLockButtonClass.FFI.non_opt GtkLockButtonClass.FFI.p * GioPermissionClass.FFI.opt GioPermissionClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkLockButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new permission = (GioPermissionClass.FFI.withOptPtr false ---> GtkLockButtonClass.FFI.fromPtr false) new_ permission before GioPermissionClass.FFI.touchOptPtr permission
    fun getPermission self = (GtkLockButtonClass.FFI.withPtr false ---> GioPermissionClass.FFI.fromPtr false) getPermission_ self before GtkLockButtonClass.FFI.touchPtr self
    fun setPermission self permission = (GtkLockButtonClass.FFI.withPtr false &&&> GioPermissionClass.FFI.withOptPtr false ---> I) setPermission_ (self & permission)
    local
      open ValueAccessor
    in
      val permissionProp =
        {
          name = "permission",
          gtype = fn () => C.gtype GioPermissionClass.tOpt (),
          get = fn x => fn () => C.get GioPermissionClass.tOpt x,
          set = fn x => C.set GioPermissionClass.tOpt x,
          init = fn x => C.set GioPermissionClass.tOpt x
        }
      val textLockProp =
        {
          name = "text-lock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val textUnlockProp =
        {
          name = "text-unlock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipLockProp =
        {
          name = "tooltip-lock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipNotAuthorizedProp =
        {
          name = "tooltip-not-authorized",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipUnlockProp =
        {
          name = "tooltip-unlock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
