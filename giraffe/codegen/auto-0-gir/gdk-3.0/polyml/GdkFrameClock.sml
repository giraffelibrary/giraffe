structure GdkFrameClock :>
  GDK_FRAME_CLOCK
    where type 'a class = 'a GdkFrameClockClass.class
    where type frame_timings_t = GdkFrameTimingsRecord.t
    where type frame_clock_phase_t = GdkFrameClockPhase.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_frame_clock_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val beginUpdating_ = call (getSymbol "gdk_frame_clock_begin_updating") (GdkFrameClockClass.PolyML.cPtr --> cVoid)
      val endUpdating_ = call (getSymbol "gdk_frame_clock_end_updating") (GdkFrameClockClass.PolyML.cPtr --> cVoid)
      val getCurrentTimings_ = call (getSymbol "gdk_frame_clock_get_current_timings") (GdkFrameClockClass.PolyML.cPtr --> GdkFrameTimingsRecord.PolyML.cPtr)
      val getFrameCounter_ = call (getSymbol "gdk_frame_clock_get_frame_counter") (GdkFrameClockClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getFrameTime_ = call (getSymbol "gdk_frame_clock_get_frame_time") (GdkFrameClockClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getHistoryStart_ = call (getSymbol "gdk_frame_clock_get_history_start") (GdkFrameClockClass.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getTimings_ = call (getSymbol "gdk_frame_clock_get_timings") (GdkFrameClockClass.PolyML.cPtr &&> GInt64.PolyML.cVal --> GdkFrameTimingsRecord.PolyML.cPtr)
      val requestPhase_ = call (getSymbol "gdk_frame_clock_request_phase") (GdkFrameClockClass.PolyML.cPtr &&> GdkFrameClockPhase.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GdkFrameClockClass.class
    type frame_timings_t = GdkFrameTimingsRecord.t
    type frame_clock_phase_t = GdkFrameClockPhase.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun beginUpdating self = (GdkFrameClockClass.FFI.withPtr ---> I) beginUpdating_ self
    fun endUpdating self = (GdkFrameClockClass.FFI.withPtr ---> I) endUpdating_ self
    fun getCurrentTimings self = (GdkFrameClockClass.FFI.withPtr ---> GdkFrameTimingsRecord.FFI.fromPtr true) getCurrentTimings_ self
    fun getFrameCounter self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameCounter_ self
    fun getFrameTime self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameTime_ self
    fun getHistoryStart self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getHistoryStart_ self
    fun getTimings self frameCounter = (GdkFrameClockClass.FFI.withPtr &&&> GInt64.FFI.withVal ---> GdkFrameTimingsRecord.FFI.fromPtr true) getTimings_ (self & frameCounter)
    fun requestPhase self phase = (GdkFrameClockClass.FFI.withPtr &&&> GdkFrameClockPhase.FFI.withVal ---> I) requestPhase_ (self & phase)
    local
      open ClosureMarshal Signal
    in
      fun afterPaintSig f = signal "after-paint" (void ---> ret_void) f
      fun beforePaintSig f = signal "before-paint" (void ---> ret_void) f
      fun flushEventsSig f = signal "flush-events" (void ---> ret_void) f
      fun layoutSig f = signal "layout" (void ---> ret_void) f
      fun paintSig f = signal "paint" (void ---> ret_void) f
      fun resumeEventsSig f = signal "resume-events" (void ---> ret_void) f
      fun updateSig f = signal "update" (void ---> ret_void) f
    end
  end
