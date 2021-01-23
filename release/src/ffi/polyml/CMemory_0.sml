(* Copyright (C) 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * An initial version of the structure CMemory that provides the types
 * referenced in the signature C_MEMORY.  The full version of this structure
 * is declared after the signature C_MEMORY has been declared.
 *)
structure CMemory =
  struct
    structure Pointer =
      struct
        type t = PolyMLFFI.Memory.Pointer.t
      end
  end
