(* Copyright (C) 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ThreadFinalizable :> THREAD_FINALIZABLE =
  struct
    open ContextFinalizable

    (* Create a tag to store a context in thread-local storage. *) 
    val tag : Context.t Universal.tag = Universal.tag ()

    fun context () =
      case Thread.Thread.getLocal tag of
        SOME context => context
      | NONE =>
          let
            val context = Context.new ()
            val () = Thread.Thread.setLocal (tag, context)
          in
            context
          end

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
