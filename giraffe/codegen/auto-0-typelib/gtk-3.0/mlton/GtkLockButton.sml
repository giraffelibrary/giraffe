structure GtkLockButton :>
  GTK_LOCK_BUTTON
    where type 'a class = 'a GtkLockButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_lock_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_lock_button_new" : unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setPermission_ = fn x1 & x2 => (_import "gtk_lock_button_set_permission" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkLockButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new permission = (GObjectObjectClass.C.withOptPtr ---> GtkLockButtonClass.C.fromPtr false) new_ permission
    fun setPermission self permission = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setPermission_ (self & permission)
    local
      open Property
    in
      val permissionProp =
        {
          get = fn x => get "permission" GioPermissionClass.tOpt x,
          set = fn x => set "permission" GioPermissionClass.tOpt x
        }
      val textLockProp =
        {
          get = fn x => get "text-lock" stringOpt x,
          set = fn x => set "text-lock" stringOpt x
        }
      val textUnlockProp =
        {
          get = fn x => get "text-unlock" stringOpt x,
          set = fn x => set "text-unlock" stringOpt x
        }
      val tooltipLockProp =
        {
          get = fn x => get "tooltip-lock" stringOpt x,
          set = fn x => set "tooltip-lock" stringOpt x
        }
      val tooltipNotAuthorizedProp =
        {
          get = fn x => get "tooltip-not-authorized" stringOpt x,
          set = fn x => set "tooltip-not-authorized" stringOpt x
        }
      val tooltipUnlockProp =
        {
          get = fn x => get "tooltip-unlock" stringOpt x,
          set = fn x => set "tooltip-unlock" stringOpt x
        }
    end
  end
