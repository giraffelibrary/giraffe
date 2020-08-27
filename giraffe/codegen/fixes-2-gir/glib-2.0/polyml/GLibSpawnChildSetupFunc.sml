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
        local
          open PolyMLFFI
        in
          val callbackFunc = cVoid --> cVoid
        end
      )
    structure Callback =
      Callback(
        type t = func
        structure Pointer = Pointer
        structure Closure = Closure
        fun marshaller func =
          fn () => func ()
        local
          open PolyMLFFI
        in
          fun dispatchPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_spawn_child_setup_func_dispatch")
          fun dispatchAsyncPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_spawn_child_setup_func_dispatch_async")
          fun destroyNotifyPtr () = Pointer.PolyML.symbolAsAddress (getSymbol "giraffe_g_spawn_child_setup_func_destroy")
        end
      )
    open Callback
  end
