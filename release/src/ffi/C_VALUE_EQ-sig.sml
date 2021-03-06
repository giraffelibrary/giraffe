(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * The signature C_VALUE_EQ defines types for the representation of a C value
 * (i.e. non-pointer) type such as 'unsigned int', 'long signed int' or a
 * C struct type.
 *)
signature C_VALUE_EQ =
  sig
    (**
     * `t` is a portable type for the C value (same across all compilers)
     * that is able to represent all valid C values.  Typically `t` would
     * involve types from the Basis Library and not compiler-specific types.
     *)
    eqtype t

    (**
     * `v` is the type for the C value used by the compiler in the FFI.
     * This may be a compiler-specific type.
     *)
    eqtype v

    (**
     * `p` is the type of a C pointer to the C value.
     *)
    eqtype p
  end
