signature GTK_PLUG =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int -> base class
    val newForDisplay : 'a Gdk.DisplayClass.class * LargeInt.int -> base class
    val construct :
      'a class
       -> LargeInt.int
       -> unit
    val constructForDisplay :
      'a class
       -> 'b Gdk.DisplayClass.class * LargeInt.int
       -> unit
    val getEmbedded : 'a class -> bool
    val getId : 'a class -> LargeInt.int
    val getSocketWindow : 'a class -> base Gdk.WindowClass.class
    val embeddedSig : (unit -> unit) -> 'a class Signal.signal
    val embeddedProp : ('a class, bool) Property.readonly
    val socketWindowProp : ('a class, base Gdk.WindowClass.class option) Property.readonly
  end
