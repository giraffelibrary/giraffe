signature GTK_SOURCE_COMPLETION =
  sig
    type 'a class
    type 'a completion_info_class
    type 'a completion_provider_class
    type 'a completion_context_class
    type 'a view_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addProvider :
      'a class
       -> 'b completion_provider_class
       -> bool
    val blockInteractive : 'a class -> unit
    val createContext :
      'a class
       -> Gtk.TextIterRecord.t option
       -> base completion_context_class
    val getInfoWindow : 'a class -> base completion_info_class
    val getView : 'a class -> base view_class
    val hide : 'a class -> unit
    val moveWindow :
      'a class
       -> Gtk.TextIterRecord.t
       -> unit
    val removeProvider :
      'a class
       -> 'b completion_provider_class
       -> bool
    val unblockInteractive : 'a class -> unit
    val activateProposalSig : (unit -> unit) -> 'a class Signal.signal
    val hideSig : (unit -> unit) -> 'a class Signal.signal
    val moveCursorSig : (Gtk.ScrollStep.t * LargeInt.int -> unit) -> 'a class Signal.signal
    val movePageSig : (Gtk.ScrollStep.t * LargeInt.int -> unit) -> 'a class Signal.signal
    val populateContextSig : (base completion_context_class -> unit) -> 'a class Signal.signal
    val showSig : (unit -> unit) -> 'a class Signal.signal
    val acceleratorsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val autoCompleteDelayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val proposalPageSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val providerPageSizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val rememberInfoVisibilityProp : ('a class, bool, bool) Property.readwrite
    val selectOnShowProp : ('a class, bool, bool) Property.readwrite
    val showHeadersProp : ('a class, bool, bool) Property.readwrite
    val showIconsProp : ('a class, bool, bool) Property.readwrite
    val viewProp : ('a class, base view_class option, 'b view_class option) Property.readwrite
  end
