signature GTK_PLUG =
  sig
    type 'a class_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : LargeInt.int -> base class_t
    val newForDisplay :
      'a Gdk.DisplayClass.t
       -> LargeInt.int
       -> base class_t
    val construct :
      'a class_t
       -> LargeInt.int
       -> unit
    val constructForDisplay :
      'a class_t
       -> 'b Gdk.DisplayClass.t
       -> LargeInt.int
       -> unit
    val getEmbedded : 'a class_t -> bool
    val getId : 'a class_t -> LargeInt.int
    val getSocketWindow : 'a class_t -> base Gdk.WindowClass.t
    val embeddedSig : (unit -> unit) -> 'a class_t Signal.signal
    val embeddedProp : ('a class_t, bool) Property.readonly
    val socketWindowProp : ('a class_t, base Gdk.WindowClass.t option) Property.readonly
  end
