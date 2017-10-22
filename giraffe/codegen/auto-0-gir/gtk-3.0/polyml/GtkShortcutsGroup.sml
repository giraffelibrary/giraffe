structure GtkShortcutsGroup :>
  GTK_SHORTCUTS_GROUP
    where type 'a class = 'a GtkShortcutsGroupClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcuts_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkShortcutsGroupClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open Property
    in
      val accelSizeGroupProp = {set = fn x => set "accel-size-group" GtkSizeGroupClass.tOpt x}
      val heightProp = {get = fn x => get "height" uint x}
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val titleSizeGroupProp = {set = fn x => set "title-size-group" GtkSizeGroupClass.tOpt x}
      val viewProp =
        {
          get = fn x => get "view" stringOpt x,
          set = fn x => set "view" stringOpt x
        }
    end
  end
