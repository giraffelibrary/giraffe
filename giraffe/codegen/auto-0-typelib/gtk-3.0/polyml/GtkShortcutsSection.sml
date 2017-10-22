structure GtkShortcutsSection :>
  GTK_SHORTCUTS_SECTION
    where type 'a class = 'a GtkShortcutsSectionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcuts_section_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkShortcutsSectionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ClosureMarshal Signal
    in
      fun changeCurrentPageSig f = signal "change-current-page" (get 0w1 int ---> ret boolean) f
    end
    local
      open Property
    in
      val maxHeightProp =
        {
          get = fn x => get "max-height" uint x,
          set = fn x => set "max-height" uint x
        }
      val sectionNameProp =
        {
          get = fn x => get "section-name" stringOpt x,
          set = fn x => set "section-name" stringOpt x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val viewNameProp =
        {
          get = fn x => get "view-name" stringOpt x,
          set = fn x => set "view-name" stringOpt x
        }
    end
  end
