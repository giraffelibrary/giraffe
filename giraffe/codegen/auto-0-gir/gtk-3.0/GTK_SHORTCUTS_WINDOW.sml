signature GTK_SHORTCUTS_WINDOW =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val closeSig : (unit -> unit) -> 'a class Signal.t
    val searchSig : (unit -> unit) -> 'a class Signal.t
    val sectionNameProp : ('a class, string option, string option) Property.readwrite
    val viewNameProp : ('a class, string option, string option) Property.readwrite
  end
