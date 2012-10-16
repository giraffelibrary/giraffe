structure GtkCalendar :>
  GTK_CALENDAR
    where type 'a class_t = 'a GtkCalendarClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type calendardisplayoptions_t = GtkCalendarDisplayOptions.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_calendar_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_calendar_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val clearMarks_ = call (load_sym libgtk "gtk_calendar_clear_marks") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getDate_ =
        call (load_sym libgtk "gtk_calendar_get_date")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.REF
             &&> FFI.PolyML.Word32.REF
             &&> FFI.PolyML.Word32.REF
             --> FFI.PolyML.VOID
          )
      val getDayIsMarked_ = call (load_sym libgtk "gtk_calendar_get_day_is_marked") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.Bool.VAL)
      val getDetailHeightRows_ = call (load_sym libgtk "gtk_calendar_get_detail_height_rows") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getDetailWidthChars_ = call (load_sym libgtk "gtk_calendar_get_detail_width_chars") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getDisplayOptions_ = call (load_sym libgtk "gtk_calendar_get_display_options") (GObjectObjectClass.PolyML.PTR --> GtkCalendarDisplayOptions.PolyML.VAL)
      val markDay_ = call (load_sym libgtk "gtk_calendar_mark_day") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val selectDay_ = call (load_sym libgtk "gtk_calendar_select_day") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val selectMonth_ =
        call (load_sym libgtk "gtk_calendar_select_month")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.VOID
          )
      val setDetailHeightRows_ = call (load_sym libgtk "gtk_calendar_set_detail_height_rows") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setDetailWidthChars_ = call (load_sym libgtk "gtk_calendar_set_detail_width_chars") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setDisplayOptions_ = call (load_sym libgtk "gtk_calendar_set_display_options") (GObjectObjectClass.PolyML.PTR &&> GtkCalendarDisplayOptions.PolyML.VAL --> FFI.PolyML.VOID)
      val unmarkDay_ = call (load_sym libgtk "gtk_calendar_unmark_day") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkCalendarClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type calendardisplayoptions_t = GtkCalendarDisplayOptions.t
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
             &&&> FFI.Word32.withRefVal
             &&&> FFI.Word32.withRefVal
             &&&> FFI.Word32.withRefVal
             ---> FFI.Word32.fromVal
                   && FFI.Word32.fromVal
                   && FFI.Word32.fromVal
                   && I
          )
            getDate_
            (
              self
               & 0
               & 0
               & 0
            )
      in
        (
          year,
          month,
          day
        )
      end
    fun getDayIsMarked self day = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> FFI.Bool.fromVal) getDayIsMarked_ (self & day)
    fun getDetailHeightRows self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getDetailHeightRows_ self
    fun getDetailWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getDetailWidthChars_ self
    fun getDisplayOptions self = (GObjectObjectClass.C.withPtr ---> GtkCalendarDisplayOptions.C.fromVal) getDisplayOptions_ self
    fun markDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) markDay_ (self & day)
    fun selectDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) selectDay_ (self & day)
    fun selectMonth self month year =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         ---> I
      )
        selectMonth_
        (
          self
           & month
           & year
        )
    fun setDetailHeightRows self rows = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setDetailHeightRows_ (self & rows)
    fun setDetailWidthChars self chars = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setDetailWidthChars_ (self & chars)
    fun setDisplayOptions self flags = (GObjectObjectClass.C.withPtr &&&> GtkCalendarDisplayOptions.C.withVal ---> I) setDisplayOptions_ (self & flags)
    fun unmarkDay self day = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) unmarkDay_ (self & day)
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
