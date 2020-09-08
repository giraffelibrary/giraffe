structure GtkShortcutsShortcut :>
  GTK_SHORTCUTS_SHORTCUT
    where type 'a class = 'a GtkShortcutsShortcutClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type text_direction_t = GtkTextDirection.t
    where type shortcut_type_t = GtkShortcutType.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcuts_shortcut_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkShortcutsShortcutClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type text_direction_t = GtkTextDirection.t
    type shortcut_type_t = GtkShortcutType.t
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
      val acceleratorProp =
        {
          name = "accelerator",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val actionNameProp =
        {
          name = "action-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val directionProp =
        {
          name = "direction",
          gtype = fn () => C.gtype GtkTextDirection.t (),
          get = fn x => fn () => C.get GtkTextDirection.t x,
          set = fn x => C.set GtkTextDirection.t x,
          init = fn x => C.set GtkTextDirection.t x
        }
      val iconProp =
        {
          name = "icon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val iconSetProp =
        {
          name = "icon-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val shortcutTypeProp =
        {
          name = "shortcut-type",
          gtype = fn () => C.gtype GtkShortcutType.t (),
          get = fn x => fn () => C.get GtkShortcutType.t x,
          set = fn x => C.set GtkShortcutType.t x,
          init = fn x => C.set GtkShortcutType.t x
        }
      val subtitleProp =
        {
          name = "subtitle",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val subtitleSetProp =
        {
          name = "subtitle-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
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
    end
  end
