structure GioFileMonitor :>
  GIO_FILE_MONITOR
    where type 'a class = 'a GioFileMonitorClass.class
    where type file_monitor_event_t = GioFileMonitorEvent.t
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_monitor_get_type" : unit -> GObjectType.C.val_;
    val cancel_ = _import "g_file_monitor_cancel" : GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p -> FFI.Bool.C.val_;
    val emitEvent_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor_emit_event" :
              GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p
               * GioFileClass.C.notnull GioFileClass.C.p
               * GioFileClass.C.notnull GioFileClass.C.p
               * GioFileMonitorEvent.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isCancelled_ = _import "g_file_monitor_is_cancelled" : GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p -> FFI.Bool.C.val_;
    val setRateLimit_ = fn x1 & x2 => (_import "g_file_monitor_set_rate_limit" : GioFileMonitorClass.C.notnull GioFileMonitorClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFileMonitorClass.class
    type file_monitor_event_t = GioFileMonitorEvent.t
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun cancel self = (GioFileMonitorClass.C.withPtr ---> FFI.Bool.C.fromVal) cancel_ self
    fun emitEvent self child otherFile eventType =
      (
        GioFileMonitorClass.C.withPtr
         &&&> GioFileClass.C.withPtr
         &&&> GioFileClass.C.withPtr
         &&&> GioFileMonitorEvent.C.withVal
         ---> I
      )
        emitEvent_
        (
          self
           & child
           & otherFile
           & eventType
        )
    fun isCancelled self = (GioFileMonitorClass.C.withPtr ---> FFI.Bool.C.fromVal) isCancelled_ self
    fun setRateLimit self limitMsecs = (GioFileMonitorClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setRateLimit_ (self & limitMsecs)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f =
        signal "changed"
          (
            get 0w1 GioFileClass.t
             &&&> get 0w2 GioFileClass.t
             &&&> get 0w3 GioFileMonitorEvent.t
             ---> ret_void
          )
          (
            fn
              file
               & otherFile
               & eventType =>
                f file otherFile eventType
          )
    end
    local
      open Property
    in
      val cancelledProp = {get = fn x => get "cancelled" boolean x}
      val rateLimitProp =
        {
          get = fn x => get "rate-limit" int x,
          set = fn x => set "rate-limit" int x
        }
    end
  end
