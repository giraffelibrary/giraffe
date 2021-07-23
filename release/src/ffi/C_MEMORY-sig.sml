(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_MEMORY =
  sig
    structure Pointer :
      sig
        eqtype t
        val null : t

        val toSysWord : t -> SysWord.word
        val fromSysWord : SysWord.word -> t

        val toPointer : t -> CMemory.Pointer.t
        val fromPointer : CMemory.Pointer.t -> t

        (**
         * `add (p, w)` returns a pointer `w` bytes after `p`.
         * `sub (p, w)` returns a pointer `w` bytes before `p`.
         * Both functions treat the offset `w` as signed, i.e. if the type
         * `word` is not wide enough to represent the full address space, `w`
         * is sign-extended to the type of addresses.
         *)
        val add : t * word -> t
        val sub : t * word -> t

        (**
         * `size` is the size of a pointer in bytes.
         *)
        val size : word
      end

    val getPointer : Pointer.t * int -> Pointer.t
    val setPointer : Pointer.t * int * Pointer.t -> unit

    structure Size :
      sig
        eqtype t (* = compiler-specific type, not abstract *)
        include WORD where type word = t
      end

    val malloc  : Size.t -> Pointer.t
    val malloc0 : Size.t -> Pointer.t
    val free : Pointer.t -> unit
  end
