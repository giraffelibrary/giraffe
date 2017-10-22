structure GdkFrameClock :>
  GDK_FRAME_CLOCK
    where type 'a class = 'a GdkFrameClockClass.class
    where type frame_timings_t = GdkFrameTimingsRecord.t
    where type frame_clock_phase_t = GdkFrameClockPhase.t =
  struct
    val getType_ = _import "gdk_frame_clock_get_type" : unit -> GObjectType.FFI.val_;
    val beginUpdating_ = _import "gdk_frame_clock_begin_updating" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> unit;
    val endUpdating_ = _import "gdk_frame_clock_end_updating" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> unit;
    val getCurrentTimings_ = _import "gdk_frame_clock_get_current_timings" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> unit GdkFrameTimingsRecord.FFI.p;
    val getFrameCounter_ = _import "gdk_frame_clock_get_frame_counter" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> GInt64.FFI.val_;
    val getFrameTime_ = _import "gdk_frame_clock_get_frame_time" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> GInt64.FFI.val_;
    val getHistoryStart_ = _import "gdk_frame_clock_get_history_start" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p -> GInt64.FFI.val_;
    val getTimings_ = fn x1 & x2 => (_import "gdk_frame_clock_get_timings" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p * GInt64.FFI.val_ -> unit GdkFrameTimingsRecord.FFI.p;) (x1, x2)
    val requestPhase_ = fn x1 & x2 => (_import "gdk_frame_clock_request_phase" : GdkFrameClockClass.FFI.notnull GdkFrameClockClass.FFI.p * GdkFrameClockPhase.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkFrameClockClass.class
    type frame_timings_t = GdkFrameTimingsRecord.t
    type frame_clock_phase_t = GdkFrameClockPhase.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun beginUpdating self = (GdkFrameClockClass.FFI.withPtr ---> I) beginUpdating_ self
    fun endUpdating self = (GdkFrameClockClass.FFI.withPtr ---> I) endUpdating_ self
    fun getCurrentTimings self = (GdkFrameClockClass.FFI.withPtr ---> GdkFrameTimingsRecord.FFI.fromOptPtr true) getCurrentTimings_ self
    fun getFrameCounter self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameCounter_ self
    fun getFrameTime self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameTime_ self
    fun getHistoryStart self = (GdkFrameClockClass.FFI.withPtr ---> GInt64.FFI.fromVal) getHistoryStart_ self
    fun getTimings self frameCounter = (GdkFrameClockClass.FFI.withPtr &&&> GInt64.FFI.withVal ---> GdkFrameTimingsRecord.FFI.fromOptPtr true) getTimings_ (self & frameCounter)
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
