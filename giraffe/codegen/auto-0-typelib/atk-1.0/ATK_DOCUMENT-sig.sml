signature ATK_DOCUMENT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getAttributeValue :
      'a class
       -> string
       -> string option
    val getCurrentPageNumber : 'a class -> LargeInt.int
    val getDocumentType : 'a class -> string
    val getLocale : 'a class -> string
    val getPageCount : 'a class -> LargeInt.int
    val setAttributeValue :
      'a class
       -> string * string
       -> bool
    val loadCompleteSig : (unit -> unit) -> 'a class Signal.t
    val loadStoppedSig : (unit -> unit) -> 'a class Signal.t
    val pageChangedSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val reloadSig : (unit -> unit) -> 'a class Signal.t
  end
