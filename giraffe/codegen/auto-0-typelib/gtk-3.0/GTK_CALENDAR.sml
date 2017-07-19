signature GTK_CALENDAR =
  sig
    type 'a class
    type 'a buildable_class
    type calendar_display_options_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val clearMarks : 'a class -> unit
    val getDate :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getDayIsMarked :
      'a class
       -> LargeInt.int
       -> bool
    val getDetailHeightRows : 'a class -> LargeInt.int
    val getDetailWidthChars : 'a class -> LargeInt.int
    val getDisplayOptions : 'a class -> calendar_display_options_t
    val markDay :
      'a class
       -> LargeInt.int
       -> unit
    val selectDay :
      'a class
       -> LargeInt.int
       -> unit
    val selectMonth :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setDetailHeightRows :
      'a class
       -> LargeInt.int
       -> unit
    val setDetailWidthChars :
      'a class
       -> LargeInt.int
       -> unit
    val setDisplayOptions :
      'a class
       -> calendar_display_options_t
       -> unit
    val unmarkDay :
      'a class
       -> LargeInt.int
       -> unit
    val daySelectedSig : (unit -> unit) -> 'a class Signal.signal
    val daySelectedDoubleClickSig : (unit -> unit) -> 'a class Signal.signal
    val monthChangedSig : (unit -> unit) -> 'a class Signal.signal
    val nextMonthSig : (unit -> unit) -> 'a class Signal.signal
    val nextYearSig : (unit -> unit) -> 'a class Signal.signal
    val prevMonthSig : (unit -> unit) -> 'a class Signal.signal
    val prevYearSig : (unit -> unit) -> 'a class Signal.signal
    val dayProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val detailHeightRowsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val detailWidthCharsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val monthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val noMonthChangeProp : ('a class, bool, bool) Property.readwrite
    val showDayNamesProp : ('a class, bool, bool) Property.readwrite
    val showDetailsProp : ('a class, bool, bool) Property.readwrite
    val showHeadingProp : ('a class, bool, bool) Property.readwrite
    val showWeekNumbersProp : ('a class, bool, bool) Property.readwrite
    val yearProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
