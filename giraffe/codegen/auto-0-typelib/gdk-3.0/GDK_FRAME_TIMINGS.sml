signature GDK_FRAME_TIMINGS =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val getComplete : t -> bool
    val getFrameCounter : t -> LargeInt.int
    val getFrameTime : t -> LargeInt.int
    val getPredictedPresentationTime : t -> LargeInt.int
    val getPresentationTime : t -> LargeInt.int
    val getRefreshInterval : t -> LargeInt.int
  end
