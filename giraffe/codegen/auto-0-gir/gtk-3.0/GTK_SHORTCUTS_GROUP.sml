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
    val accelSizeGroupProp :
      {
        set :
          'b size_group_class option
           -> 'a class
           -> unit,
        new : 'b size_group_class option -> 'a class Property.t
      }
    val heightProp : {get : 'a class -> LargeInt.int}
    val titleProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val titleSizeGroupProp :
      {
        set :
          'b size_group_class option
           -> 'a class
           -> unit,
        new : 'b size_group_class option -> 'a class Property.t
      }
    val viewProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
