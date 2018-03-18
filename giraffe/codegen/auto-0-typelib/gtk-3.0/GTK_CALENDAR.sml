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
    val dayProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val detailHeightRowsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val detailWidthCharsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val monthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val noMonthChangeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showDayNamesProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showDetailsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showHeadingProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showWeekNumbersProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val yearProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
