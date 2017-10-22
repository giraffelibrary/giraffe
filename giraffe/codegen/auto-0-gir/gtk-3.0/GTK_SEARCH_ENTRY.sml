signature GTK_SEARCH_ENTRY =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_editable_class
    type 'a editable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellEditable : 'a class -> base cell_editable_class
    val asEditable : 'a class -> base editable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val handleEvent :
      'a class
       -> 'b Gdk.Event.union
       -> bool
    val nextMatchSig : (unit -> unit) -> 'a class Signal.t
    val previousMatchSig : (unit -> unit) -> 'a class Signal.t
    val searchChangedSig : (unit -> unit) -> 'a class Signal.t
    val stopSearchSig : (unit -> unit) -> 'a class Signal.t
  end
