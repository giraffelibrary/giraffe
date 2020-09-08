signature GTK_APPLICATION =
  sig
    type 'a class
    type application_inhibit_flags_t
    type 'a window_class
    type t = base class
    val asActionGroup : 'a class -> base Gio.ActionGroupClass.class
    val asActionMap : 'a class -> base Gio.ActionMapClass.class
    val getType : unit -> GObject.Type.t
    val new : string option * Gio.ApplicationFlags.t -> base class
    val addAccelerator :
      'a class
       -> string
           * string
           * GLib.VariantRecord.t option
       -> unit
    val addWindow :
      'a class
       -> 'b window_class
       -> unit
    val getAccelsForAction :
      'a class
       -> string
       -> Utf8CPtrArray.t
    val getActionsForAccel :
      'a class
       -> string
       -> Utf8CPtrArray.t
    val getActiveWindow : 'a class -> base window_class option
    val getAppMenu : 'a class -> base Gio.MenuModelClass.class option
    val getMenuById :
      'a class
       -> string
       -> base Gio.MenuClass.class
    val getMenubar : 'a class -> base Gio.MenuModelClass.class
    val getWindowById :
      'a class
       -> LargeInt.int
       -> base window_class option
    val inhibit :
      'a class
       -> 'b window_class option
           * application_inhibit_flags_t
           * string option
       -> LargeInt.int
    val isInhibited :
      'a class
       -> application_inhibit_flags_t
       -> bool
    val listActionDescriptions : 'a class -> Utf8CPtrArray.t
    val prefersAppMenu : 'a class -> bool
    val removeAccelerator :
      'a class
       -> string * GLib.VariantRecord.t option
       -> unit
    val removeWindow :
      'a class
       -> 'b window_class
       -> unit
    val setAccelsForAction :
      'a class
       -> string * Utf8CPtrArray.t
       -> unit
    val setAppMenu :
      'a class
       -> 'b Gio.MenuModelClass.class option
       -> unit
    val setMenubar :
      'a class
       -> 'b Gio.MenuModelClass.class option
       -> unit
    val uninhibit :
      'a class
       -> LargeInt.int
       -> unit
    val windowAddedSig : (base window_class -> unit) -> 'a class Signal.t
    val windowRemovedSig : (base window_class -> unit) -> 'a class Signal.t
    val activeWindowProp : ('a class, unit -> base window_class option, unit, unit) Property.t
    val appMenuProp : ('a class, unit -> base Gio.MenuModelClass.class option, 'b Gio.MenuModelClass.class option -> unit, 'b Gio.MenuModelClass.class option -> unit) Property.t
    val menubarProp : ('a class, unit -> base Gio.MenuModelClass.class option, 'b Gio.MenuModelClass.class option -> unit, 'b Gio.MenuModelClass.class option -> unit) Property.t
    val registerSessionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
