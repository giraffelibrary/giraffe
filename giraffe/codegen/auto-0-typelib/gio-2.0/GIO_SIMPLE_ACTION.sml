signature GIO_SIMPLE_ACTION =
  sig
    type 'a class
    type 'a action_class
    type t = base class
    val asAction : 'a class -> base action_class
    val getType : unit -> GObject.Type.t
    val new : string * GLib.VariantTypeRecord.t option -> base class
    val newStateful :
      string
       * GLib.VariantTypeRecord.t option
       * GLib.VariantRecord.t
       -> base class
    val setEnabled :
      'a class
       -> bool
       -> unit
    val setState :
      'a class
       -> GLib.VariantRecord.t
       -> unit
    val activateSig : (GLib.VariantRecord.t option -> unit) -> 'a class Signal.t
    val changeStateSig : (GLib.VariantRecord.t option -> unit) -> 'a class Signal.t
    val enabledProp : ('a class, bool) Property.readonly
    val nameProp : ('a class, string option) Property.readonly
    val parameterTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
    val stateProp : ('a class, GLib.VariantRecord.t option) Property.readonly
    val stateTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
  end
