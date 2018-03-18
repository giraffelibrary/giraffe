structure GtkShortcutsShortcut :>
  GTK_SHORTCUTS_SHORTCUT
    where type 'a class = 'a GtkShortcutsShortcutClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type text_direction_t = GtkTextDirection.t
    where type shortcut_type_t = GtkShortcutType.t
    where type 'a size_group_class = 'a GtkSizeGroupClass.class =
  struct
    val getType_ = _import "gtk_shortcuts_shortcut_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GtkShortcutsShortcutClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type text_direction_t = GtkTextDirection.t
    type shortcut_type_t = GtkShortcutType.t
    type 'a size_group_class = 'a GtkSizeGroupClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open Property
    in
      val accelSizeGroupProp =
        {
          set = fn x => set "accel-size-group" GtkSizeGroupClass.tOpt x,
          new = fn x => new "accel-size-group" GtkSizeGroupClass.tOpt x
        }
      val acceleratorProp =
        {
          get = fn x => get "accelerator" stringOpt x,
          set = fn x => set "accelerator" stringOpt x,
          new = fn x => new "accelerator" stringOpt x
        }
      val actionNameProp =
        {
          get = fn x => get "action-name" stringOpt x,
          set = fn x => set "action-name" stringOpt x,
          new = fn x => new "action-name" stringOpt x
        }
      val directionProp =
        {
          get = fn x => get "direction" GtkTextDirection.t x,
          set = fn x => set "direction" GtkTextDirection.t x,
          new = fn x => new "direction" GtkTextDirection.t x
        }
      val iconProp =
        {
          get = fn x => get "icon" GioIconClass.tOpt x,
          set = fn x => set "icon" GioIconClass.tOpt x,
          new = fn x => new "icon" GioIconClass.tOpt x
        }
      val iconSetProp =
        {
          get = fn x => get "icon-set" boolean x,
          set = fn x => set "icon-set" boolean x,
          new = fn x => new "icon-set" boolean x
        }
      val shortcutTypeProp =
        {
          get = fn x => get "shortcut-type" GtkShortcutType.t x,
          set = fn x => set "shortcut-type" GtkShortcutType.t x,
          new = fn x => new "shortcut-type" GtkShortcutType.t x
        }
      val subtitleProp =
        {
          get = fn x => get "subtitle" stringOpt x,
          set = fn x => set "subtitle" stringOpt x,
          new = fn x => new "subtitle" stringOpt x
        }
      val subtitleSetProp =
        {
          get = fn x => get "subtitle-set" boolean x,
          set = fn x => set "subtitle-set" boolean x,
          new = fn x => new "subtitle-set" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x,
          new = fn x => new "title" stringOpt x
        }
      val titleSizeGroupProp =
        {
          set = fn x => set "title-size-group" GtkSizeGroupClass.tOpt x,
          new = fn x => new "title-size-group" GtkSizeGroupClass.tOpt x
        }
    end
  end
