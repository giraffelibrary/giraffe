signature GTK_SOURCE_COMPLETION =
  sig
    type 'a class_t
    type 'a completion_info_class_t
    type 'a completion_provider_class_t
    type 'a completion_context_class_t
    type 'a view_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val addProvider :
      'a class_t
       -> 'b completion_provider_class_t
       -> bool
    val blockInteractive : 'a class_t -> unit
    val createContext :
      'a class_t
       -> Gtk.TextIterRecord.t option
       -> base completion_context_class_t
    val getInfoWindow : 'a class_t -> base completion_info_class_t
    val getView : 'a class_t -> base view_class_t
    val hide : 'a class_t -> unit
    val moveWindow :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> unit
    val removeProvider :
      'a class_t
       -> 'b completion_provider_class_t
       -> bool
    val unblockInteractive : 'a class_t -> unit
    val activateProposalSig : (unit -> unit) -> 'a class_t Signal.signal
    val hideSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (Gtk.ScrollStep.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val movePageSig :
      (Gtk.ScrollStep.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val populateContextSig : (base completion_context_class_t -> unit) -> 'a class_t Signal.signal
    val showSig : (unit -> unit) -> 'a class_t Signal.signal
    val acceleratorsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val autoCompleteDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val proposalPageSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val providerPageSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rememberInfoVisibilityProp : ('a class_t, bool, bool) Property.readwrite
    val selectOnShowProp : ('a class_t, bool, bool) Property.readwrite
    val showHeadersProp : ('a class_t, bool, bool) Property.readwrite
    val showIconsProp : ('a class_t, bool, bool) Property.readwrite
    val viewProp : ('a class_t, base view_class_t option, 'b view_class_t option) Property.readwrite
  end
