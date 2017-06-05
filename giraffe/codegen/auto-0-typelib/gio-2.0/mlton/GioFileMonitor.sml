structure GioFileMonitor :>
  GIO_FILE_MONITOR
    where type 'a class = 'a GioFileMonitorClass.class
    where type file_monitor_event_t = GioFileMonitorEvent.t
    where type 'a file_class = 'a GioFileClass.class =
  struct
    val getType_ = _import "g_file_monitor_get_type" : unit -> GObjectType.FFI.val_;
    val cancel_ = _import "g_file_monitor_cancel" : GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p -> GBool.FFI.val_;
    val emitEvent_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_file_monitor_emit_event" :
              GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p
               * GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileClass.FFI.notnull GioFileClass.FFI.p
               * GioFileMonitorEvent.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isCancelled_ = _import "g_file_monitor_is_cancelled" : GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p -> GBool.FFI.val_;
    val setRateLimit_ = fn x1 & x2 => (_import "g_file_monitor_set_rate_limit" : GioFileMonitorClass.FFI.notnull GioFileMonitorClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioFileMonitorClass.class
    type file_monitor_event_t = GioFileMonitorEvent.t
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun cancel self = (GioFileMonitorClass.FFI.withPtr ---> GBool.FFI.fromVal) cancel_ self
    fun emitEvent self child otherFile eventType =
      (
        GioFileMonitorClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GioFileMonitorEvent.FFI.withVal
         ---> I
      )
        emitEvent_
        (
          self
           & child
           & otherFile
           & eventType
        )
    fun isCancelled self = (GioFileMonitorClass.FFI.withPtr ---> GBool.FFI.fromVal) isCancelled_ self
    fun setRateLimit self limitMsecs = (GioFileMonitorClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setRateLimit_ (self & limitMsecs)
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
