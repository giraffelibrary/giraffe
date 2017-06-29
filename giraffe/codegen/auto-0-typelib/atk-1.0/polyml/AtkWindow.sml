structure AtkWindow :>
  ATK_WINDOW
    where type 'a class = 'a AtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_window_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun createSig f = signal "create" (void ---> ret_void) f
      fun deactivateSig f = signal "deactivate" (void ---> ret_void) f
      fun destroySig f = signal "destroy" (void ---> ret_void) f
      fun maximizeSig f = signal "maximize" (void ---> ret_void) f
      fun minimizeSig f = signal "minimize" (void ---> ret_void) f
      fun moveSig f = signal "move" (void ---> ret_void) f
      fun resizeSig f = signal "resize" (void ---> ret_void) f
      fun restoreSig f = signal "restore" (void ---> ret_void) f
    end
  end
