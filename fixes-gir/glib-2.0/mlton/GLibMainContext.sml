structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t
    where type source_func_t = GLibSourceFunc.t =
  struct
    val getType_ = _import "g_main_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_main_context_new" : unit -> GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p;
    val acquire_ = _import "g_main_context_acquire" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val dispatch_ = _import "g_main_context_dispatch" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> unit;
    val findSourceById_ = fn x1 & x2 => (_import "g_main_context_find_source_by_id" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p * GUInt.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;) (x1, x2)
    val invoke_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_main_context_invoke_full" reentrant :
              GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p
               * GInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.dispatch_p
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.destroy_notify_p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val isOwner_ = _import "g_main_context_is_owner" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val iteration_ = fn x1 & x2 => (_import "g_main_context_iteration" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val pending_ = _import "g_main_context_pending" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val popThreadDefault_ = _import "g_main_context_pop_thread_default" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> unit;
    val prepare_ = fn x1 & x2 => (_import "g_main_context_prepare" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p * GInt.FFI.ref_ -> GBool.FFI.val_;) (x1, x2)
    val pushThreadDefault_ = _import "g_main_context_push_thread_default" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> unit;
    val release_ = _import "g_main_context_release" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> unit;
    val wakeup_ = _import "g_main_context_wakeup" : GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p -> unit;
    val default_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p;
    val getThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p;
    val refThreadDefault_ = _import "g_main_context_ref_thread_default" : unit -> GLibMainContextRecord.FFI.non_opt GLibMainContextRecord.FFI.p;
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    type source_func_t = GLibSourceFunc.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr true
    in
      fun new () = call new_ ()
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun acquire self = call acquire_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun dispatch self = call dispatch_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr false
    in
      fun findSourceById self sourceId = call findSourceById_ (self & sourceId) before GLibMainContextRecord.FFI.touchPtr self
    end
    local
      val call =
        GLibMainContextRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> I
    in
      fun invoke self (priority, function) =
        call invoke_
          (
            self
             & priority
             & ()
             & function
             & ()
          )
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isOwner self = call isOwner_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun iteration self mayBlock = call iteration_ (self & mayBlock)
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun pending self = call pending_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun popThreadDefault self = call popThreadDefault_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GBool.FFI.fromVal
    in
      fun prepare self =
        let
          val priority & retVal = call prepare_ (self & GInt.null)
        in
          if retVal then SOME priority else NONE
        end
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun pushThreadDefault self = call pushThreadDefault_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun release self = call release_ self
    end
    local
      val call = GLibMainContextRecord.FFI.withPtr false ---> I
    in
      fun wakeup self = call wakeup_ self
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr false
    in
      fun default () = call default_ ()
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr false
    in
      fun getThreadDefault () = call getThreadDefault_ ()
    end
    local
      val call = I ---> GLibMainContextRecord.FFI.fromPtr true
    in
      fun refThreadDefault () = call refThreadDefault_ ()
    end
  end
