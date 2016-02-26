structure AtkWindow :>
  ATK_WINDOW
    where type 'a class_t = 'a AtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a AtkWindowClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
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
