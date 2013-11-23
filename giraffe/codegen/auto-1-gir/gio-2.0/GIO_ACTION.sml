signature GIO_ACTION =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> GLib.VariantRecord.t option
       -> unit
    val changeState :
      'a class_t
       -> GLib.VariantRecord.t
       -> unit
    val getEnabled : 'a class_t -> bool
    val getName : 'a class_t -> string
    val getParameterType : 'a class_t -> GLib.VariantTypeRecord.t
    val getState : 'a class_t -> GLib.VariantRecord.t
    val getStateHint : 'a class_t -> GLib.VariantRecord.t
    val getStateType : 'a class_t -> GLib.VariantTypeRecord.t
    val enabledProp : ('a class_t, bool) Property.readonly
    val nameProp : ('a class_t, string option) Property.readonly
    val parameterTypeProp : ('a class_t, GLib.VariantTypeRecord.t option) Property.readonly
    val stateProp : ('a class_t, GLib.VariantRecord.t option) Property.readonly
    val stateTypeProp : ('a class_t, GLib.VariantTypeRecord.t option) Property.readonly
  end
