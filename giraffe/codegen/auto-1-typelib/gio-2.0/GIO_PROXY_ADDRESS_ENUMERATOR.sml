signature GIO_PROXY_ADDRESS_ENUMERATOR =
  sig
    type 'a class_t
    type 'a socketconnectableclass_t
    val getType : unit -> GObject.Type.t
    val connectableProp : ('a class_t, base socketconnectableclass_t option, 'b socketconnectableclass_t option) Property.readwrite
    val uriProp : ('a class_t, string option, string option) Property.readwrite
  end
