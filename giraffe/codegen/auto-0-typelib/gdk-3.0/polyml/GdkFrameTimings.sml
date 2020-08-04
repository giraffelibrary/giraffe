structure GdkFrameTimings :>
  GDK_FRAME_TIMINGS
    where type t = GdkFrameTimingsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_frame_timings_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getComplete_ = call (getSymbol "gdk_frame_timings_get_complete") (GdkFrameTimingsRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFrameCounter_ = call (getSymbol "gdk_frame_timings_get_frame_counter") (GdkFrameTimingsRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getFrameTime_ = call (getSymbol "gdk_frame_timings_get_frame_time") (GdkFrameTimingsRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getPredictedPresentationTime_ = call (getSymbol "gdk_frame_timings_get_predicted_presentation_time") (GdkFrameTimingsRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getPresentationTime_ = call (getSymbol "gdk_frame_timings_get_presentation_time") (GdkFrameTimingsRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getRefreshInterval_ = call (getSymbol "gdk_frame_timings_get_refresh_interval") (GdkFrameTimingsRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
    end
    type t = GdkFrameTimingsRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getComplete self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getComplete_ self
    fun getFrameCounter self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getFrameCounter_ self
    fun getFrameTime self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getFrameTime_ self
    fun getPredictedPresentationTime self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getPredictedPresentationTime_ self
    fun getPresentationTime self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getPresentationTime_ self
    fun getRefreshInterval self = (GdkFrameTimingsRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getRefreshInterval_ self
  end
