(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSpawnChildSetupFunc :> G_LIB_SPAWN_CHILD_SETUP_FUNC =
  struct
    type func = unit -> unit
    structure Pointer = CPointer(GMemory)
    structure Closure =
      Closure(
        val name = "GLib.SpawnChildSetupFunc"
        type args = unit
        type ret = unit
        val exnRetVal = ()
        val noneRetVal = ()
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn () => func ()
        fun dispatchPtr () = _address "giraffe_g_spawn_child_setup_func_dispatch" private : Pointer.t;
        fun dispatchAsyncPtr () = _address "giraffe_g_spawn_child_setup_func_dispatch_async" private : Pointer.t;
        fun destroyNotifyPtr () = _address "giraffe_g_spawn_child_setup_func_destroy" private : Pointer.t;
      )
    open Callback
    val () =
      _export "giraffe_g_spawn_child_setup_func_dispatch" private
        : (Closure.t -> unit) -> unit;
        (fn closure => Closure.call closure ())
    val () =
      _export "giraffe_g_spawn_child_setup_func_dispatch_async" private
        : (Closure.t -> unit) -> unit;
        (fn closure => Closure.call closure () before Closure.free closure)
    val () =
      _export "giraffe_g_spawn_child_setup_func_destroy" private
        : (Closure.t -> unit) -> unit;
        Closure.free
  end
