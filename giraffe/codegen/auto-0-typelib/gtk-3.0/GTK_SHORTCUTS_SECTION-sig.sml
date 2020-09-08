signature GTK_SHORTCUTS_SECTION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val changeCurrentPageSig : (LargeInt.int -> bool) -> 'a class Signal.t
    val maxHeightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val sectionNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val viewNameProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
