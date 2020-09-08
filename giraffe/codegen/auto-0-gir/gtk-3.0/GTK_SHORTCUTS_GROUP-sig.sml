signature GTK_SHORTCUTS_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a size_group_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val accelSizeGroupProp : ('a class, unit, 'b size_group_class option -> unit, 'b size_group_class option -> unit) Property.t
    val heightProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val titleProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val titleSizeGroupProp : ('a class, unit, 'b size_group_class option -> unit, 'b size_group_class option -> unit) Property.t
    val viewProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
