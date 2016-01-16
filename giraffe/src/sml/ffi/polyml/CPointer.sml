(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CPointer :> POINTER =
  struct
    open PolyMLFFI

    type 'a t = Memory.Pointer.t
    fun eq (p, q) = p = q
    val null = Memory.Pointer.null
    fun isNull p = p = null
    exception Null

    type notnull = unit
    fun toNotNull p = if isNull p then raise Null else p

    fun toOptNull p = p

    fun toOpt p = SOME (toNotNull p) handle Null => NONE
    val fromOpt = fn NONE => null | SOME x => x
    fun mapOpt f = fromOpt o Option.map f o toOpt
    fun appOpt f = Option.app f o toOpt

    val add = Memory.Pointer.add
    val sub = Memory.Pointer.sub

    fun getPointer (p, n) = Memory.getPointer (p, Word.fromInt n)
    fun getWord8 (p, n) = Memory.getWord8 (p, Word.fromInt n)
    fun setPointer (p, n, v) = Memory.setPointer (p, Word.fromInt n, v)
    fun setWord8 (p, n, v) = Memory.setWord8 (p, Word.fromInt n, v)

    val size = Memory.Pointer.size

    structure PolyML =
      struct
        val toSysWord = Memory.Pointer.toSysWord

        val cVal = cPointer
        val POINTER = cPointer

        type ref_ = Memory.Pointer.t
        (* In the MLton implementation, a reference to pointer `p` (i.e.
         * the address of `p`) is passed via the FFI as `ref p`.  Any
         * change to the referenced value by the C function will be present
         * in the ref variable after the call, and extracted using `!`.
         * Importantly, `p` is not changed: it is not a mutable value.
         *
         * With Poly/ML, a reference to pointer `p` is passed via the FFI
         * by copying `p` into mutable memory created with `new` that
         * can be destructively updated by the C function.  After the
         * C function returns, the updated pointer is read from the mutable
         * memory, which is freed. *)
        local
        in
          fun withRef f x =
            let
              val mem = Memory.malloc size
              val () = Memory.setPointer (mem, 0w0, x)
              fun freeMem () = Memory.free mem
            in
              let
                val y = f mem
                val p' = Memory.getPointer (mem, 0w0)
                val () = freeMem ()
              in
                p' & y
              end
                handle e => (freeMem (); raise e)
            end
        end
        val nullRef = Memory.Pointer.null
        val cRef = cPointer
      end
  end
