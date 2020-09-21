structure GLibMainLoop :>
  G_LIB_MAIN_LOOP
    where type t = GLibMainLoopRecord.t
    where type main_context_t = GLibMainContextRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_main_loop_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_main_loop_new") (GLibMainContextRecord.PolyML.cOptPtr &&> GBool.PolyML.cVal --> GLibMainLoopRecord.PolyML.cPtr)
      val getContext_ = call (getSymbol "g_main_loop_get_context") (GLibMainLoopRecord.PolyML.cPtr --> GLibMainContextRecord.PolyML.cPtr)
      val isRunning_ = call (getSymbol "g_main_loop_is_running") (GLibMainLoopRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val quit_ = call (getSymbol "g_main_loop_quit") (GLibMainLoopRecord.PolyML.cPtr --> cVoid)
      val run_ = call (getSymbol "g_main_loop_run") (GLibMainLoopRecord.PolyML.cPtr --> cVoid)
    end
    type t = GLibMainLoopRecord.t
    type main_context_t = GLibMainContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (context, isRunning) = (GLibMainContextRecord.FFI.withOptPtr false &&&> GBool.FFI.withVal ---> GLibMainLoopRecord.FFI.fromPtr true) new_ (context & isRunning)
    fun getContext self = (GLibMainLoopRecord.FFI.withPtr false ---> GLibMainContextRecord.FFI.fromPtr false) getContext_ self before GLibMainLoopRecord.FFI.touchPtr self
    fun isRunning self = (GLibMainLoopRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isRunning_ self
    fun quit self = (GLibMainLoopRecord.FFI.withPtr false ---> I) quit_ self
    fun run self = (GLibMainLoopRecord.FFI.withPtr false ---> I) run_ self
  end
