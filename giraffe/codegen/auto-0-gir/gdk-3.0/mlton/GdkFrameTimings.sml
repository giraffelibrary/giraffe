structure GdkFrameTimings :>
  GDK_FRAME_TIMINGS
    where type t = GdkFrameTimingsRecord.t =
  struct
    val getType_ = _import "gdk_frame_timings_get_type" : unit -> GObjectType.FFI.val_;
    val getComplete_ = _import "gdk_frame_timings_get_complete" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GBool.FFI.val_;
    val getFrameCounter_ = _import "gdk_frame_timings_get_frame_counter" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GInt64.FFI.val_;
    val getFrameTime_ = _import "gdk_frame_timings_get_frame_time" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GInt64.FFI.val_;
    val getPredictedPresentationTime_ = _import "gdk_frame_timings_get_predicted_presentation_time" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GInt64.FFI.val_;
    val getPresentationTime_ = _import "gdk_frame_timings_get_presentation_time" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GInt64.FFI.val_;
    val getRefreshInterval_ = _import "gdk_frame_timings_get_refresh_interval" : GdkFrameTimingsRecord.FFI.notnull GdkFrameTimingsRecord.FFI.p -> GInt64.FFI.val_;
    type t = GdkFrameTimingsRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getComplete self = (GdkFrameTimingsRecord.FFI.withPtr ---> GBool.FFI.fromVal) getComplete_ self
    fun getFrameCounter self = (GdkFrameTimingsRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameCounter_ self
    fun getFrameTime self = (GdkFrameTimingsRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getFrameTime_ self
    fun getPredictedPresentationTime self = (GdkFrameTimingsRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getPredictedPresentationTime_ self
    fun getPresentationTime self = (GdkFrameTimingsRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getPresentationTime_ self
    fun getRefreshInterval self = (GdkFrameTimingsRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getRefreshInterval_ self
  end
