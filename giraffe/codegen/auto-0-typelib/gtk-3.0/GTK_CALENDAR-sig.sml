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
    val daySelectedSig : (unit -> unit) -> 'a class Signal.t
    val daySelectedDoubleClickSig : (unit -> unit) -> 'a class Signal.t
    val monthChangedSig : (unit -> unit) -> 'a class Signal.t
    val nextMonthSig : (unit -> unit) -> 'a class Signal.t
    val nextYearSig : (unit -> unit) -> 'a class Signal.t
    val prevMonthSig : (unit -> unit) -> 'a class Signal.t
    val prevYearSig : (unit -> unit) -> 'a class Signal.t
    val dayProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val detailHeightRowsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val detailWidthCharsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val monthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val noMonthChangeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showDayNamesProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showDetailsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showHeadingProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showWeekNumbersProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val yearProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
