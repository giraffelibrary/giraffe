(* Copyright (C) 2023-2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ThreadFinalizable :> THREAD_FINALIZABLE =
  struct
    open ContextFinalizable

    (* MLton code runs in a single thread so there is only one context. *)
    fun marshalNow run = run ()
    fun newLocalContext () =
      let
        val context = Context.new ()
        val () = OS.Process.atExit (fn () => Context.setMarshaler context (SOME marshalNow))
      in
        context
      end
    val getLocalContext = Fn.lazy newLocalContext 

    structure Thread =
      struct
        type marshaler = Context.marshaler

        fun setMarshaler optMarshaler =
          Context.setMarshaler (getLocalContext ()) optMarshaler

        fun finalize (marshaler, doGC) =
          Context.finalize (getLocalContext ()) (marshaler, doGC)
      end

    fun newInThread v = newInContext (getLocalContext ()) v
  end
