signature GTK_LIST_BOX_ROW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val changed : 'a class -> unit
    val getActivatable : 'a class -> bool
    val getHeader : 'a class -> base widget_class option
    val getIndex : 'a class -> LargeInt.int
    val getSelectable : 'a class -> bool
    val isSelected : 'a class -> bool
    val setActivatable :
      'a class
       -> bool
       -> unit
    val setHeader :
      'a class
       -> 'b widget_class option
       -> unit
    val setSelectable :
      'a class
       -> bool
       -> unit
    val activateSig : (unit -> unit) -> 'a class Signal.t
    val activatableProp : ('a class, bool, bool) Property.readwrite
    val selectableProp : ('a class, bool, bool) Property.readwrite
  end
