signature GTK_CALENDAR_DISPLAY_OPTIONS =
  sig
    include FLAGS
    val SHOW_HEADING : t
    val SHOW_DAY_NAMES : t
    val NO_MONTH_CHANGE : t
    val SHOW_WEEK_NUMBERS : t
    val SHOW_DETAILS : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
