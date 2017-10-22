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
    val accelSizeGroupProp : ('a class, 'b size_group_class option) Property.writeonly
    val heightProp : ('a class, LargeInt.int) Property.readonly
    val titleProp : ('a class, string option, string option) Property.readwrite
    val titleSizeGroupProp : ('a class, 'b size_group_class option) Property.writeonly
    val viewProp : ('a class, string option, string option) Property.readwrite
  end
