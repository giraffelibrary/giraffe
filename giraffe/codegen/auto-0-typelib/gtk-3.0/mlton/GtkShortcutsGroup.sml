structure GtkShortcutsGroup :>
  GTK_SHORTCUTS_GROUP
    where type 'a class = 'a GtkShortcutsGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    val getType_ = _import "gtk_shortcuts_group_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkShortcutsGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ValueAccessor
    in
      val accelSizeGroupProp =
        {
          name = "accel-size-group",
          gtype = fn () => C.gtype GtkSizeGroupClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkSizeGroupClass.tOpt x,
          init = fn x => C.set GtkSizeGroupClass.tOpt x
        }
      val heightProp =
        {
          name = "height",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = ignore
        }
      val titleProp =
        {
          name = "title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val titleSizeGroupProp =
        {
          name = "title-size-group",
          gtype = fn () => C.gtype GtkSizeGroupClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkSizeGroupClass.tOpt x,
          init = fn x => C.set GtkSizeGroupClass.tOpt x
        }
      val viewProp =
        {
          name = "view",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
