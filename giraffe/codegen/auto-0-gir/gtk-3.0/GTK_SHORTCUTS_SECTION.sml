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
    val maxHeightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val sectionNameProp : ('a class, string option, string option) Property.readwrite
    val titleProp : ('a class, string option, string option) Property.readwrite
    val viewNameProp : ('a class, string option, string option) Property.readwrite
  end
