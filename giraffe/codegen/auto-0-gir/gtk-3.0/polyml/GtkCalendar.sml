structure GtkCalendar :>
  GTK_CALENDAR
    where type 'a class = 'a GtkCalendarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type calendar_display_options_t = GtkCalendarDisplayOptions.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_calendar_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_calendar_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val clearMarks_ = call (load_sym libgtk "gtk_calendar_clear_marks") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getDate_ =
        call (load_sym libgtk "gtk_calendar_get_date")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.UInt.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getDayIsMarked_ = call (load_sym libgtk "gtk_calendar_get_day_is_marked") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getDetailHeightRows_ = call (load_sym libgtk "gtk_calendar_get_detail_height_rows") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getDetailWidthChars_ = call (load_sym libgtk "gtk_calendar_get_detail_width_chars") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getDisplayOptions_ = call (load_sym libgtk "gtk_calendar_get_display_options") (GObjectObjectClass.PolyML.cPtr --> GtkCalendarDisplayOptions.PolyML.cVal)
      val markDay_ = call (load_sym libgtk "gtk_calendar_mark_day") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectDay_ = call (load_sym libgtk "gtk_calendar_select_day") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val selectMonth_ =
        call (load_sym libgtk "gtk_calendar_select_month")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDetailHeightRows_ = call (load_sym libgtk "gtk_calendar_set_detail_height_rows") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDetailWidthChars_ = call (load_sym libgtk "gtk_calendar_set_detail_width_chars") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDisplayOptions_ = call (load_sym libgtk "gtk_calendar_set_display_options") (GObjectObjectClass.PolyML.cPtr &&> GtkCalendarDisplayOptions.PolyML.cVal --> FFI.PolyML.cVoid)
      val unmarkDay_ = call (load_sym libgtk "gtk_calendar_unmark_day") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkCalendarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type calendar_display_options_t = GtkCalendarDisplayOptions.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCalendarClass.C.fromPtr false) new_ ()
    fun clearMarks self = (GObjectObjectClass.C.withPtr ---> I) clearMarks_ self
    fun getDate self =
      let
        val year
         & month
         & day
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            getDate_
            (
              self
               & FFI.UInt.null
               & FFI.UInt.null
               & FFI.UInt.null
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun getDayIsMarked self day = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) getDayIsMarked_ (self & day)
    fun getDetailHeightRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getDetailHeightRows_ self
    fun getDetailWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getDetailWidthChars_ self
    fun getDisplayOptions self = (GObjectObjectClass.C.withPtr ---> GtkCalendarDisplayOptions.C.fromVal) getDisplayOptions_ self
    fun markDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) markDay_ (self & day)
    fun selectDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) selectDay_ (self & day)
    fun selectMonth self month year =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        selectMonth_
        (
          self
           & month
           & year
        )
    fun setDetailHeightRows self rows = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDetailHeightRows_ (self & rows)
    fun setDetailWidthChars self chars = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDetailWidthChars_ (self & chars)
    fun setDisplayOptions self flags = (GObjectObjectClass.C.withPtr &&&> GtkCalendarDisplayOptions.C.withVal ---> I) setDisplayOptions_ (self & flags)
    fun unmarkDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) unmarkDay_ (self & day)
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
          set = fn x => set "day" int x
        }
      val detailHeightRowsProp =
        {
          get = fn x => get "detail-height-rows" int x,
          set = fn x => set "detail-height-rows" int x
        }
      val detailWidthCharsProp =
        {
          get = fn x => get "detail-width-chars" int x,
          set = fn x => set "detail-width-chars" int x
        }
      val monthProp =
        {
          get = fn x => get "month" int x,
          set = fn x => set "month" int x
        }
      val noMonthChangeProp =
        {
          get = fn x => get "no-month-change" boolean x,
          set = fn x => set "no-month-change" boolean x
        }
      val showDayNamesProp =
        {
          get = fn x => get "show-day-names" boolean x,
          set = fn x => set "show-day-names" boolean x
        }
      val showDetailsProp =
        {
          get = fn x => get "show-details" boolean x,
          set = fn x => set "show-details" boolean x
        }
      val showHeadingProp =
        {
          get = fn x => get "show-heading" boolean x,
          set = fn x => set "show-heading" boolean x
        }
      val showWeekNumbersProp =
        {
          get = fn x => get "show-week-numbers" boolean x,
          set = fn x => set "show-week-numbers" boolean x
        }
      val yearProp =
        {
          get = fn x => get "year" int x,
          set = fn x => set "year" int x
        }
    end
  end
