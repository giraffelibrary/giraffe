structure GtkCalendarDisplayOptions :>
  sig
    include GTK_CALENDAR_DISPLAY_OPTIONS
  end =
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
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "gtk_calendar_display_options_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
