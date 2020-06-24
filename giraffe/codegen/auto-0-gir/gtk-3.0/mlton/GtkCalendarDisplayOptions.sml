structure GtkCalendarDisplayOptions :> GTK_CALENDAR_DISPLAY_OPTIONS =
  struct
    val SHOW_HEADING = 0w1
    val SHOW_DAY_NAMES = 0w2
    val NO_MONTH_CHANGE = 0w4
    val SHOW_WEEK_NUMBERS = 0w8
    val SHOW_DETAILS = 0w32
    val allFlags =
      [
        SHOW_HEADING,
        SHOW_DAY_NAMES,
        NO_MONTH_CHANGE,
        SHOW_WEEK_NUMBERS,
        SHOW_DETAILS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gtk_calendar_display_options_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
