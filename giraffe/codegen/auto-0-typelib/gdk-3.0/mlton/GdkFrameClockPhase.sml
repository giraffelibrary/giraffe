structure GdkFrameClockPhase :> GDK_FRAME_CLOCK_PHASE =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val FLUSH_EVENTS = 0w1
    val BEFORE_PAINT = 0w2
    val UPDATE = 0w4
    val LAYOUT = 0w8
    val PAINT = 0w16
    val RESUME_EVENTS = 0w32
    val AFTER_PAINT = 0w64
    val allFlags =
      [
        NONE,
        FLUSH_EVENTS,
        BEFORE_PAINT,
        UPDATE,
        LAYOUT,
        PAINT,
        RESUME_EVENTS,
        AFTER_PAINT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_frame_clock_phase_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
