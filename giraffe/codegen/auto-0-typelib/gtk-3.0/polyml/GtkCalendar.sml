structure GtkCalendar :>
  GTK_CALENDAR
    where type 'a class = 'a GtkCalendarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type calendar_display_options_t = GtkCalendarDisplayOptions.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_calendar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_calendar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val clearMarks_ = call (getSymbol "gtk_calendar_clear_marks") (GtkCalendarClass.PolyML.cPtr --> cVoid)
      val getDate_ =
        call (getSymbol "gtk_calendar_get_date")
          (
            GtkCalendarClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             --> cVoid
          )
      val getDayIsMarked_ = call (getSymbol "gtk_calendar_get_day_is_marked") (GtkCalendarClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val getDetailHeightRows_ = call (getSymbol "gtk_calendar_get_detail_height_rows") (GtkCalendarClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDetailWidthChars_ = call (getSymbol "gtk_calendar_get_detail_width_chars") (GtkCalendarClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDisplayOptions_ = call (getSymbol "gtk_calendar_get_display_options") (GtkCalendarClass.PolyML.cPtr --> GtkCalendarDisplayOptions.PolyML.cVal)
      val markDay_ = call (getSymbol "gtk_calendar_mark_day") (GtkCalendarClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val selectDay_ = call (getSymbol "gtk_calendar_select_day") (GtkCalendarClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val selectMonth_ =
        call (getSymbol "gtk_calendar_select_month")
          (
            GtkCalendarClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val setDetailHeightRows_ = call (getSymbol "gtk_calendar_set_detail_height_rows") (GtkCalendarClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setDetailWidthChars_ = call (getSymbol "gtk_calendar_set_detail_width_chars") (GtkCalendarClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setDisplayOptions_ = call (getSymbol "gtk_calendar_set_display_options") (GtkCalendarClass.PolyML.cPtr &&> GtkCalendarDisplayOptions.PolyML.cVal --> cVoid)
      val unmarkDay_ = call (getSymbol "gtk_calendar_unmark_day") (GtkCalendarClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
    end
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
