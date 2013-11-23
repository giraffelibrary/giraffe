signature GIO_SIMPLE_ACTION =
  sig
    type 'a class_t
    type 'a actionclass_t
    val asAction : 'a class_t -> base actionclass_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> GLib.VariantTypeRecord.t option
       -> base class_t
    val newStateful :
      string
       -> GLib.VariantTypeRecord.t option
       -> GLib.VariantRecord.t
       -> base class_t
    val setEnabled :
      'a class_t
       -> bool
       -> unit
    val setState :
      'a class_t
       -> GLib.VariantRecord.t
       -> unit
    val activateSig : (GLib.VariantRecord.t option -> unit) -> 'a class_t Signal.signal
    val changeStateSig : (GLib.VariantRecord.t option -> unit) -> 'a class_t Signal.signal
    val enabledProp : ('a class_t, bool) Property.readonly
    val nameProp : ('a class_t, string option) Property.readonly
    val parameterTypeProp : ('a class_t, GLib.VariantTypeRecord.t option) Property.readonly
    val stateProp : ('a class_t, GLib.VariantRecord.t option) Property.readonly
    val stateTypeProp : ('a class_t, GLib.VariantTypeRecord.t option) Property.readonly
  end
