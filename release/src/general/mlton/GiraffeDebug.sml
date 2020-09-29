(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeDebug :> GIRAFFE_DEBUG =
  struct
    fun isDefinedSome var =
      case OS.Process.getEnv var of
        NONE    => false
      | SOME "" => false
      | SOME _  => true

    (* To fix `isEnabled` at compile time with MLton, it is not possible to
     * use `OS.Process.getEnv` because that uses the run-time environment. *)
    val isEnabled = _command_line_const "GiraffeDebug.isEnabled" : bool = false;

    fun getRefCount () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_REF_COUNT"
    fun getClosure () = isEnabled andalso isDefinedSome "GIRAFFE_DEBUG_CLOSURE"
  end
