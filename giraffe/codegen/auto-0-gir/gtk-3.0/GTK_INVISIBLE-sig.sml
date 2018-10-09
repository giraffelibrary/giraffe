signature GTK_INVISIBLE =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newForScreen : 'a Gdk.ScreenClass.class -> base class
    val getScreen : 'a class -> base Gdk.ScreenClass.class
    val setScreen :
      'a class
       -> 'b Gdk.ScreenClass.class
       -> unit
    val screenProp :
      {
        get : 'a class -> base Gdk.ScreenClass.class option,
        set :
          'b Gdk.ScreenClass.class option
           -> 'a class
           -> unit,
        new : 'b Gdk.ScreenClass.class option -> 'a class Property.t
      }
  end
