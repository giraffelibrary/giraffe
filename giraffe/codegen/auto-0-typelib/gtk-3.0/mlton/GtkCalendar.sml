structure GtkCalendar :>
  GTK_CALENDAR
    where type 'a class = 'a GtkCalendarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type calendar_display_options_t = GtkCalendarDisplayOptions.t =
  struct
    val getType_ = _import "gtk_calendar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_calendar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val clearMarks_ = _import "gtk_calendar_clear_marks" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> unit;
    val getDate_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_calendar_get_date" :
              GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p
               * GUInt32.FFI.ref_
               * GUInt32.FFI.ref_
               * GUInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDayIsMarked_ = fn x1 & x2 => (_import "gtk_calendar_get_day_is_marked" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getDetailHeightRows_ = _import "gtk_calendar_get_detail_height_rows" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GInt32.FFI.val_;
    val getDetailWidthChars_ = _import "gtk_calendar_get_detail_width_chars" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GInt32.FFI.val_;
    val getDisplayOptions_ = _import "gtk_calendar_get_display_options" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GtkCalendarDisplayOptions.FFI.val_;
    val markDay_ = fn x1 & x2 => (_import "gtk_calendar_mark_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val selectDay_ = fn x1 & x2 => (_import "gtk_calendar_select_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val selectMonth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_calendar_select_month" :
              GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDetailHeightRows_ = fn x1 & x2 => (_import "gtk_calendar_set_detail_height_rows" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDetailWidthChars_ = fn x1 & x2 => (_import "gtk_calendar_set_detail_width_chars" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDisplayOptions_ = fn x1 & x2 => (_import "gtk_calendar_set_display_options" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GtkCalendarDisplayOptions.FFI.val_ -> unit;) (x1, x2)
    val unmarkDay_ = fn x1 & x2 => (_import "gtk_calendar_unmark_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCalendarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type calendar_display_options_t = GtkCalendarDisplayOptions.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCalendarClass.FFI.fromPtr false) new_ ()
    fun clearMarks self = (GtkCalendarClass.FFI.withPtr false ---> I) clearMarks_ self
    fun getDate self =
      let
        val year
         & month
         & day
         & () =
          (
            GtkCalendarClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && I
          )
            getDate_
            (
              self
               & GUInt32.null
               & GUInt32.null
               & GUInt32.null
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun getDayIsMarked self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) getDayIsMarked_ (self & day)
    fun getDetailHeightRows self = (GtkCalendarClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getDetailHeightRows_ self
    fun getDetailWidthChars self = (GtkCalendarClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getDetailWidthChars_ self
    fun getDisplayOptions self = (GtkCalendarClass.FFI.withPtr false ---> GtkCalendarDisplayOptions.FFI.fromVal) getDisplayOptions_ self
    fun markDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) markDay_ (self & day)
    fun selectDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) selectDay_ (self & day)
    fun selectMonth self (month, year) =
      (
        GtkCalendarClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        selectMonth_
        (
          self
           & month
           & year
        )
    fun setDetailHeightRows self rows = (GtkCalendarClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDetailHeightRows_ (self & rows)
    fun setDetailWidthChars self chars = (GtkCalendarClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDetailWidthChars_ (self & chars)
    fun setDisplayOptions self flags = (GtkCalendarClass.FFI.withPtr false &&&> GtkCalendarDisplayOptions.FFI.withVal ---> I) setDisplayOptions_ (self & flags)
    fun unmarkDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) unmarkDay_ (self & day)
    local
      open ClosureMarshal Signal
    in
      fun daySelectedSig f = signal "day-selected" (void ---> ret_void) f
      fun daySelectedDoubleClickSig f = signal "day-selected-double-click" (void ---> ret_void) f
      fun monthChangedSig f = signal "month-changed" (void ---> ret_void) f
      fun nextMonthSig f = signal "next-month" (void ---> ret_void) f
      fun nextYearSig f = signal "next-year" (void ---> ret_void) f
      fun prevMonthSig f = signal "prev-month" (void ---> ret_void) f
      fun prevYearSig f = signal "prev-year" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val dayProp =
        {
          name = "day",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val detailHeightRowsProp =
        {
          name = "detail-height-rows",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val detailWidthCharsProp =
        {
          name = "detail-width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val monthProp =
        {
          name = "month",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val noMonthChangeProp =
        {
          name = "no-month-change",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showDayNamesProp =
        {
          name = "show-day-names",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showDetailsProp =
        {
          name = "show-details",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showHeadingProp =
        {
          name = "show-heading",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val showWeekNumbersProp =
        {
          name = "show-week-numbers",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val yearProp =
        {
          name = "year",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
