signature GTK_CALENDAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type calendar_display_options_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val clearMarks : 'a class_t -> unit
    val getDate :
      'a class_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val getDayIsMarked :
      'a class_t
       -> LargeInt.int
       -> bool
    val getDetailHeightRows : 'a class_t -> LargeInt.int
    val getDetailWidthChars : 'a class_t -> LargeInt.int
    val getDisplayOptions : 'a class_t -> calendar_display_options_t
    val markDay :
      'a class_t
       -> LargeInt.int
       -> unit
    val selectDay :
      'a class_t
       -> LargeInt.int
       -> unit
    val selectMonth :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setDetailHeightRows :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDetailWidthChars :
      'a class_t
       -> LargeInt.int
       -> unit
    val setDisplayOptions :
      'a class_t
       -> calendar_display_options_t
       -> unit
    val unmarkDay :
      'a class_t
       -> LargeInt.int
       -> unit
    val daySelectedSig : (unit -> unit) -> 'a class_t Signal.signal
    val daySelectedDoubleClickSig : (unit -> unit) -> 'a class_t Signal.signal
    val monthChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val nextMonthSig : (unit -> unit) -> 'a class_t Signal.signal
    val nextYearSig : (unit -> unit) -> 'a class_t Signal.signal
    val prevMonthSig : (unit -> unit) -> 'a class_t Signal.signal
    val prevYearSig : (unit -> unit) -> 'a class_t Signal.signal
    val dayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val detailHeightRowsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val detailWidthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val monthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val noMonthChangeProp : ('a class_t, bool, bool) Property.readwrite
    val showDayNamesProp : ('a class_t, bool, bool) Property.readwrite
    val showDetailsProp : ('a class_t, bool, bool) Property.readwrite
    val showHeadingProp : ('a class_t, bool, bool) Property.readwrite
    val showWeekNumbersProp : ('a class_t, bool, bool) Property.readwrite
    val yearProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
