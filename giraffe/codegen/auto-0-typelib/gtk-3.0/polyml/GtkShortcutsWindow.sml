structure GtkShortcutsWindow :>
  GTK_SHORTCUTS_WINDOW
    where type 'a class = 'a GtkShortcutsWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_shortcuts_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GtkShortcutsWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ClosureMarshal Signal
    in
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun searchSig f = signal "search" (void ---> ret_void) f
    end
    local
      open Property
    in
      val sectionNameProp =
        {
          get = fn x => get "section-name" stringOpt x,
          set = fn x => set "section-name" stringOpt x,
          new = fn x => new "section-name" stringOpt x
        }
      val viewNameProp =
        {
          get = fn x => get "view-name" stringOpt x,
          set = fn x => set "view-name" stringOpt x,
          new = fn x => new "view-name" stringOpt x
        }
    end
  end
