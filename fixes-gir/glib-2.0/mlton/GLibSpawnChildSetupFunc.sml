(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSpawnChildSetupFunc :> G_LIB_SPAWN_CHILD_SETUP_FUNC =
  struct
    type func = unit -> unit
    structure Closure =
      Closure(
        val name = "GLib.SpawnChildSetupFunc"
        type args = unit
        type ret = unit
        val exnRetVal = ()
        val noneRetVal = ()
      )
    fun dispatch closure = Closure.call closure ()
    fun dispatchAsync closure = Closure.call closure () before Closure.free closure
    fun destroyNotify closure = Closure.free closure
    val () =
      _export "giraffe_g_spawn_child_setup_func_dispatch" private
        : (Closure.t -> unit) -> unit;
        dispatch
    val () =
      _export "giraffe_g_spawn_child_setup_func_dispatch_async" private
        : (Closure.t -> unit) -> unit;
        dispatchAsync
    val () =
      _export "giraffe_g_spawn_child_setup_func_destroy" private
        : (Closure.t -> unit) -> unit;
        destroyNotify
    structure Callback =
      Callback(
        type t = func
        structure Pointer = CPointer(GMemory)
        structure Closure = Closure
        fun marshaller func =
          fn () => func ()
        val dispatchPtr = _address "giraffe_g_spawn_child_setup_func_dispatch" private : Pointer.t;
        val dispatchAsyncPtr = _address "giraffe_g_spawn_child_setup_func_dispatch_async" private : Pointer.t;
        val destroyNotifyPtr = _address "giraffe_g_spawn_child_setup_func_destroy" private : Pointer.t;
      )
    open Callback
  end
