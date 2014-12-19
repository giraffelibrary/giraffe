(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharVec :>
  sig
    include
      C_ARRAY
        where type elem = char
        where type vector = string

    structure PolyML :
      sig
        val OUTPTR : 'a C.out_p CInterface.Conversion
        val INPTR : 'a C.in_p CInterface.Conversion
        val INOUTREF : ('a, 'b) C.r CInterface.Conversion
      end
  end =
  struct
    (**
     * For Poly/ML, `t`, the representation of a C string, is always
     * just a pointer to a null terminated string.  Although conversion from
     * an SML string will, therefore, allocate a copy of the string on the
     * C heap, this would have happened anyway before the SML string was
     * passed to a C function.  Furthermore, by doing the allocation on
     * conversion from an SML string, multiple copies of the same string on
     * the C heap can be avoided by using the same `t` value.
     *)
    type t = CPointer.notnull CPointer.t Finalizable.t

    type vector = string
    type elem = char

    structure C =
      struct
        structure Pointer = CPointer
        type 'a p = 'a Pointer.t
        type notnull = Pointer.notnull

        local
          open CInterface
          open Pointer
          open PolyML
        in
          val g_strdup_sym = load_sym libglib "g_strdup"
          val g_free_sym = load_sym libglib "g_free"
          val strlen_sym = load_sym libc "strlen"

          val dupPointer_ : notnull t -> notnull t =
            fn p => call1 g_strdup_sym POINTER POINTER p
          val free_ : notnull t -> unit = call1 g_free_sym POINTER VOID
          val len_ : notnull t -> int = call1 strlen_sym POINTER INT
          val sub_ : notnull t -> int -> char = CPointer.PolyML.derefOffset CHAR
        end

        val len = len_
        val sub = sub_

        type 'a tabulator = int * (int -> elem) -> 'a


        (**
         * Conversion functions to/from C arrays
         *)
        val fromCarray = Pointer.PolyML.fromCstring
        val toCarray   = Pointer.PolyML.toCstring  (* null terminates *)


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a p

        fun fromPtr (p : notnull out_p) : t = Finalizable.new p

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val t = Finalizable.new p
          in
            Finalizable.addFinalizer (t, g_free_sym);
            t
          end

        fun copyPtr (p : notnull out_p) : t =
          fromNewPtr (dupPointer_ p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free_ p

        fun copyPtrToVector (p : notnull out_p) : vector =
          fromCarray p

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free_ p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          tabulate (len p, sub p)

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free_ p


        fun fromOptPtr (p : 'a out_p) : t option =
          Option.map fromPtr (Pointer.toOpt p)

        fun fromNewOptPtr (p : 'a out_p) : t option =
          Option.map fromNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr (p : 'a out_p) : t option =
          Option.map copyPtr (Pointer.toOpt p)

        fun copyNewOptPtr (p : 'a out_p) : t option =
          Option.map copyNewPtr (Pointer.toOpt p)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)


        (**
         * Value parameters
         *)
        type 'a in_p = unit p

        local
          val fromPointer : 'a p -> 'b in_p = Pointer.toOptNull

          fun withPointer f p = f (fromPointer p)

          fun withDupPointer f p =
            p & f (fromPointer p)
              handle
                e => (
                  (* free new pointer `p` if `f (fromPointer p)`
                   * raises an exception *)
                  Option.app free_ (Pointer.toOpt p);
                  raise e
                )
        in
          fun withPtr f t = Finalizable.withValue (t, withPointer f)

          val withConstPtr = withPtr

          fun withDupPtr f t =
            Finalizable.withValue (t, withDupPointer f o dupPointer_)


          fun withOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withPointer f)
            | NONE   => withPointer f Pointer.null

          val withConstOptPtr = withOptPtr

          (* `withDupOptPtr` handles null pointer explicitly to avoid
           * call to `dupPointer_` with a null pointer. *)
          fun withDupOptPtr f =
            fn
              SOME t =>
                Finalizable.withValue
                  (t, withDupPointer f o Pointer.toOptNull o dupPointer_)
            | NONE   => withDupPointer f Pointer.null
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = unit p

        local
          val null = Pointer.null

          (* In the MLton implementation, a reference to pointer `p` (i.e.
           * the address of `p`) is passed via the FFI as `ref p`.  Any
           * change to the referenced value by the C function will be present
           * in the ref variable after the call, and extracted using `!`.
           * Importantly, `p` is not changed: it is not a mutable value.
           *
           * With Poly/ML, a reference to pointer `p` is passed via the FFI
           * as `address p`.  However, `p` is a `vol`, so any change to the
           * referenced value by the C function will cause `p` to change.
           * Consequently, the type `t` argument value would be overwritten
           * by the exported pointer.
           *
           * Therefore, the implementation creates a fresh `vol` `v` that is
           * a copy of `p` and passes `addressFromVol v` to the C function.
           * As `v` will hold any modification, there is no need to
           * dereference the address value afterwards --- just use `v`.
           * Thus `fromPointer` returns `v` for the result as well as
           * `addressFromVol v`. *)
          fun fromPointer (p : 'a p) : CInterface.vol * ('b, 'c) r =
            let
              open Pointer
              open PolyML
              val v = toVol p  (* `toVol` creates copy of `p` *)
            in
              (v, toOptNull (addressFromVol v))
            end

          fun apply f (v, x) =
            let val y = f x in Pointer.PolyML.fromVol v & y end
            (* must evaluate `f x` before `Pointer.PolyML.fromVol v` *)

          fun withPointer f p =
            let val q & y = f (fromPointer p) in q & y end

          fun withDupPointer f p =
            let val q & y = f (fromPointer p) in q & y end
              handle
                e => (
                  (* free new pointer `p` if `f (fromPointer p)`
                   * raises an exception *)
                  Option.app free_ (Pointer.toOpt p);
                  raise e
                )
        in
          fun withNullRef f () = f null


          fun withRefPtr f t = Finalizable.withValue (t, withPointer (apply f))

          val withRefConstPtr = withRefPtr

          fun withRefDupPtr f t =
            Finalizable.withValue (t, withDupPointer (apply f) o dupPointer_)


          fun withRefOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withPointer (apply f))
            | NONE   => withPointer (apply f) Pointer.null

          val withRefConstOptPtr = withRefOptPtr

          (* `withRefDupOptPtr` handles null pointer explicitly to avoid
           * call to `dupPointer_` with a null pointer. *)
          fun withRefDupOptPtr f =
            fn
              SOME t =>
                Finalizable.withValue
                  (t, withDupPointer (apply f) o dupPointer_)
            | NONE   => withDupPointer (apply f) Pointer.null
        end
      end

    type vector = string

    fun fromVector v = Finalizable.new (C.toCarray v)

    fun toVector t = Finalizable.withValue (t, C.copyPtrToVector)

    fun length t = Finalizable.withValue (t, C.len)


    fun sub t =
      let
        val len = length t
        val sub = Finalizable.withValue (t, C.sub)
      in
        fn i =>
          if 0 <= i andalso i < len
          then sub i
          else raise Subscript
      end

    structure PolyML =
      struct
        val OUTPTR : 'a C.out_p CInterface.Conversion = C.Pointer.PolyML.POINTER
        val INPTR : 'a C.in_p CInterface.Conversion = C.Pointer.PolyML.POINTER
        val INOUTREF : ('a, 'b) C.r CInterface.Conversion = C.Pointer.PolyML.POINTER
      end
  end
