signature GTK_ASSISTANT =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type assistant_page_type_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addActionWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val appendPage :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
    val commit : 'a class_t -> unit
    val getCurrentPage : 'a class_t -> LargeInt.int
    val getNPages : 'a class_t -> LargeInt.int
    val getNthPage :
      'a class_t
       -> LargeInt.int
       -> base widget_class_t
    val getPageComplete :
      'a class_t
       -> 'b widget_class_t
       -> bool
    val getPageTitle :
      'a class_t
       -> 'b widget_class_t
       -> string
    val getPageType :
      'a class_t
       -> 'b widget_class_t
       -> assistant_page_type_t
    val insertPage :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class_t -> unit
    val prependPage :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
    val previousPage : 'a class_t -> unit
    val removeActionWidget :
      'a class_t
       -> 'b widget_class_t
       -> unit
    val removePage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setCurrentPage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPageComplete :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> unit
    val setPageTitle :
      'a class_t
       -> 'b widget_class_t
       -> string
       -> unit
    val setPageType :
      'a class_t
       -> 'b widget_class_t
       -> assistant_page_type_t
       -> unit
    val updateButtonsState : 'a class_t -> unit
    val applySig : (unit -> unit) -> 'a class_t Signal.signal
    val cancelSig : (unit -> unit) -> 'a class_t Signal.signal
    val closeSig : (unit -> unit) -> 'a class_t Signal.signal
    val prepareSig : (base widget_class_t -> unit) -> 'a class_t Signal.signal
  end
