signature GTK_RADIO_BUTTON =
  sig
    type 'a class
    type 'a actionable_class
    type 'a activatable_class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActionable : 'a class -> base actionable_class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val newFromWidget : 'a class option -> base class
    val newWithLabelFromWidget : 'a class option * string -> base class
    val newWithMnemonicFromWidget : 'a class option * string -> base class
    val joinGroup :
      'a class
       -> 'b class option
       -> unit
    val groupChangedSig : (unit -> unit) -> 'a class Signal.t
    val groupProp :
      {
        set :
          'b class option
           -> 'a class
           -> unit,
        new : 'b class option -> 'a class Property.t
      }
  end
