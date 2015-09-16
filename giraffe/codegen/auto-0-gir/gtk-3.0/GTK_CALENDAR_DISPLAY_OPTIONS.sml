signature GTK_CALENDAR_DISPLAY_OPTIONS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val SHOW_HEADING : t
    val SHOW_DAY_NAMES : t
    val NO_MONTH_CHANGE : t
    val SHOW_WEEK_NUMBERS : t
    val SHOW_DETAILS : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
