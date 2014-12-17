structure GtkLockButton :>
  GTK_LOCK_BUTTON
    where type 'a class_t = 'a GtkLockButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_lock_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_lock_button_new") (GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val setPermission_ = call (load_sym libgtk "gtk_lock_button_set_permission") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkLockButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type t = base class_t
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
