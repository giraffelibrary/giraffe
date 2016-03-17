signature ATK_DOCUMENT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAttributeValue :
      'a class
       -> string
       -> string
    val getDocumentType : 'a class -> string
    val getLocale : 'a class -> string
    val setAttributeValue :
      'a class
       -> string
       -> string
       -> bool
    val loadCompleteSig : (unit -> unit) -> 'a class Signal.signal
    val loadStoppedSig : (unit -> unit) -> 'a class Signal.signal
    val reloadSig : (unit -> unit) -> 'a class Signal.signal
  end
