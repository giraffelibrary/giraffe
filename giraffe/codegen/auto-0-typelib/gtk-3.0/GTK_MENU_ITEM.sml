signature GTK_MENU_ITEM =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a widgetclass_t
    type 'a menuclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithLabel : string -> base class_t
    val newWithMnemonic : string -> base class_t
    val activate : 'a class_t -> unit
    val deselect : 'a class_t -> unit
    val getAccelPath : 'a class_t -> string
    val getLabel : 'a class_t -> string
    val getReserveIndicator : 'a class_t -> bool
    val getSubmenu : 'a class_t -> base widgetclass_t
    val getUseUnderline : 'a class_t -> bool
    val select : 'a class_t -> unit
    val setAccelPath :
      'a class_t
       -> string option
       -> unit
    val setLabel :
      'a class_t
       -> string
       -> unit
    val setReserveIndicator :
      'a class_t
       -> bool
       -> unit
    val setSubmenu :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val setUseUnderline :
      'a class_t
       -> bool
       -> unit
    val toggleSizeAllocate :
      'a class_t
       -> LargeInt.int
       -> unit
    val activateSig : (unit -> unit) -> 'a class_t Signal.signal
    val activateItemSig : (unit -> unit) -> 'a class_t Signal.signal
    val deselectSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleSizeAllocateSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val accelPathProp : ('a class_t, string option, string option) Property.readwrite
    val labelProp : ('a class_t, string option, string option) Property.readwrite
    val rightJustifiedProp : ('a class_t, bool, bool) Property.readwrite
    val submenuProp : ('a class_t, base menuclass_t option, 'b menuclass_t option) Property.readwrite
    val useUnderlineProp : ('a class_t, bool, bool) Property.readwrite
  end
