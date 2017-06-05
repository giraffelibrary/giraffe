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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_calendar_display_options_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
