signature GTK_ASSISTANT =
  sig
    type 'a class
    type 'a buildable_class
    type assistant_page_type_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addActionWidget :
      'a class
       -> 'b widget_class
       -> unit
    val appendPage :
      'a class
       -> 'b widget_class
       -> LargeInt.int
    val commit : 'a class -> unit
    val getCurrentPage : 'a class -> LargeInt.int
    val getNPages : 'a class -> LargeInt.int
    val getNthPage :
      'a class
       -> LargeInt.int
       -> base widget_class
    val getPageComplete :
      'a class
       -> 'b widget_class
       -> bool
    val getPageTitle :
      'a class
       -> 'b widget_class
       -> string
    val getPageType :
      'a class
       -> 'b widget_class
       -> assistant_page_type_t
    val insertPage :
      'a class
       -> 'b widget_class
       -> LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class -> unit
    val prependPage :
      'a class
       -> 'b widget_class
       -> LargeInt.int
    val previousPage : 'a class -> unit
    val removeActionWidget :
      'a class
       -> 'b widget_class
       -> unit
    val removePage :
      'a class
       -> LargeInt.int
       -> unit
    val setCurrentPage :
      'a class
       -> LargeInt.int
       -> unit
    val setPageComplete :
      'a class
       -> 'b widget_class
       -> bool
       -> unit
    val setPageTitle :
      'a class
       -> 'b widget_class
       -> string
       -> unit
    val setPageType :
      'a class
       -> 'b widget_class
       -> assistant_page_type_t
       -> unit
    val updateButtonsState : 'a class -> unit
    val applySig : (unit -> unit) -> 'a class Signal.signal
    val cancelSig : (unit -> unit) -> 'a class Signal.signal
    val closeSig : (unit -> unit) -> 'a class Signal.signal
    val prepareSig : (base widget_class -> unit) -> 'a class Signal.signal
  end
