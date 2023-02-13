(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ThreadFinalizable :> THREAD_FINALIZABLE =
  struct
    open ContextFinalizable

    (* MLton code runs in a single thread so there is only one context. *) 
    val context = Fn.lazy Context.new

    structure Thread =
      struct
        type marshaler = Context.marshaler

        fun setMarshaler optMarshaler =
          Context.setMarshaler (context ()) optMarshaler

        fun finalize (marshaler, doGC) =
          Context.finalize (context ()) (marshaler, doGC)
      end

    fun newInThread v = newInContext (context ()) v
  end
