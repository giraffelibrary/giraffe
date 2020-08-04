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
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDayIsMarked_ = fn x1 & x2 => (_import "gtk_calendar_get_day_is_marked" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getDetailHeightRows_ = _import "gtk_calendar_get_detail_height_rows" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GInt.FFI.val_;
    val getDetailWidthChars_ = _import "gtk_calendar_get_detail_width_chars" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GInt.FFI.val_;
    val getDisplayOptions_ = _import "gtk_calendar_get_display_options" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p -> GtkCalendarDisplayOptions.FFI.val_;
    val markDay_ = fn x1 & x2 => (_import "gtk_calendar_mark_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val selectDay_ = fn x1 & x2 => (_import "gtk_calendar_select_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val selectMonth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_calendar_select_month" :
              GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDetailHeightRows_ = fn x1 & x2 => (_import "gtk_calendar_set_detail_height_rows" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setDetailWidthChars_ = fn x1 & x2 => (_import "gtk_calendar_set_detail_width_chars" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setDisplayOptions_ = fn x1 & x2 => (_import "gtk_calendar_set_display_options" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GtkCalendarDisplayOptions.FFI.val_ -> unit;) (x1, x2)
    val unmarkDay_ = fn x1 & x2 => (_import "gtk_calendar_unmark_day" : GtkCalendarClass.FFI.non_opt GtkCalendarClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
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
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && I
          )
            getDate_
            (
              self
               & GUInt.null
               & GUInt.null
               & GUInt.null
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun getDayIsMarked self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal) getDayIsMarked_ (self & day)
    fun getDetailHeightRows self = (GtkCalendarClass.FFI.withPtr false ---> GInt.FFI.fromVal) getDetailHeightRows_ self
    fun getDetailWidthChars self = (GtkCalendarClass.FFI.withPtr false ---> GInt.FFI.fromVal) getDetailWidthChars_ self
    fun getDisplayOptions self = (GtkCalendarClass.FFI.withPtr false ---> GtkCalendarDisplayOptions.FFI.fromVal) getDisplayOptions_ self
    fun markDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) markDay_ (self & day)
    fun selectDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) selectDay_ (self & day)
    fun selectMonth self (month, year) =
      (
        GtkCalendarClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        selectMonth_
        (
          self
           & month
           & year
        )
    fun setDetailHeightRows self rows = (GtkCalendarClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setDetailHeightRows_ (self & rows)
    fun setDetailWidthChars self chars = (GtkCalendarClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setDetailWidthChars_ (self & chars)
    fun setDisplayOptions self flags = (GtkCalendarClass.FFI.withPtr false &&&> GtkCalendarDisplayOptions.FFI.withVal ---> I) setDisplayOptions_ (self & flags)
    fun unmarkDay self day = (GtkCalendarClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) unmarkDay_ (self & day)
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
      open Property
    in
      val dayProp =
        {
          get = fn x => get "day" int x,
          set = fn x => set "day" int x,
          new = fn x => new "day" int x
        }
      val detailHeightRowsProp =
        {
          get = fn x => get "detail-height-rows" int x,
          set = fn x => set "detail-height-rows" int x,
          new = fn x => new "detail-height-rows" int x
        }
      val detailWidthCharsProp =
        {
          get = fn x => get "detail-width-chars" int x,
          set = fn x => set "detail-width-chars" int x,
          new = fn x => new "detail-width-chars" int x
        }
      val monthProp =
        {
          get = fn x => get "month" int x,
          set = fn x => set "month" int x,
          new = fn x => new "month" int x
        }
      val noMonthChangeProp =
        {
          get = fn x => get "no-month-change" boolean x,
          set = fn x => set "no-month-change" boolean x,
          new = fn x => new "no-month-change" boolean x
        }
      val showDayNamesProp =
        {
          get = fn x => get "show-day-names" boolean x,
          set = fn x => set "show-day-names" boolean x,
          new = fn x => new "show-day-names" boolean x
        }
      val showDetailsProp =
        {
          get = fn x => get "show-details" boolean x,
          set = fn x => set "show-details" boolean x,
          new = fn x => new "show-details" boolean x
        }
      val showHeadingProp =
        {
          get = fn x => get "show-heading" boolean x,
          set = fn x => set "show-heading" boolean x,
          new = fn x => new "show-heading" boolean x
        }
      val showWeekNumbersProp =
        {
          get = fn x => get "show-week-numbers" boolean x,
          set = fn x => set "show-week-numbers" boolean x,
          new = fn x => new "show-week-numbers" boolean x
        }
      val yearProp =
        {
          get = fn x => get "year" int x,
          set = fn x => set "year" int x,
          new = fn x => new "year" int x
        }
    end
  end
