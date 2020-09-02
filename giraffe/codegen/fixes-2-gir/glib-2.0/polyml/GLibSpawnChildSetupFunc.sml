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
    structure Callback =
      Callback(
        type t = func
        structure Closure = Closure
        fun marshaller func =
          fn () => func ()
        type dispatch_args = Closure.t
        local
          open PolyMLFFI
          val dispatchFunc = Closure.PolyML.cVal --> cVoid
          val destroyNotifyFunc = Closure.PolyML.cVal --> cVoid
        in
          val dispatchPtr = closure dispatchFunc dispatch
          val dispatchAsyncPtr = closure dispatchFunc dispatchAsync
          val destroyNotifyPtr = closure destroyNotifyFunc destroyNotify
        end
      )
    open Callback
  end
