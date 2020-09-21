structure GLibMainLoop :>
  G_LIB_MAIN_LOOP
    where type t = GLibMainLoopRecord.t
    where type main_context_t = GLibMainContextRecord.t =
  struct
    val getType_ = _import "g_main_loop_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_main_loop_new" : GLibMainContextRecord.FFI.opt GLibMainContextRecord.FFI.p * GBool.FFI.val_ -> GLibMainLoopRecord.FFI.non_opt GLibMainLoopRecord.FFI.p;) (x1, x2)
    val getContext_ = _import "g_main_loop_get_context" : GLibMainLoopRecord.FFI.non_opt GLibMainLoopRecord.FFI.p -> GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p;
    val isRunning_ = _import "g_main_loop_is_running" : GLibMainLoopRecord.FFI.non_opt GLibMainLoopRecord.FFI.p -> GBool.FFI.val_;
    val quit_ = _import "g_main_loop_quit" : GLibMainLoopRecord.FFI.non_opt GLibMainLoopRecord.FFI.p -> unit;
    val run_ = _import "g_main_loop_run" : GLibMainLoopRecord.FFI.non_opt GLibMainLoopRecord.FFI.p -> unit;
    type t = GLibMainLoopRecord.t
    type main_context_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (context, isRunning) = (GLibMainContextRecord.FFI.withOptPtr false &&&> GBool.FFI.withVal ---> GLibMainLoopRecord.FFI.fromPtr true) new_ (context & isRunning)
    fun getContext self = (GLibMainLoopRecord.FFI.withPtr false ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self before GLibMainLoopRecord.FFI.touchPtr self
    fun isRunning self = (GLibMainLoopRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isRunning_ self
    fun quit self = (GLibMainLoopRecord.FFI.withPtr false ---> I) quit_ self
    fun run self = (GLibMainLoopRecord.FFI.withPtr false ---> I) run_ self
  end
