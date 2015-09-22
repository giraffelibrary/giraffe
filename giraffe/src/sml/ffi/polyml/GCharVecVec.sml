(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharVecVec :>
  sig
    include
      C_ARRAY
        where type elem = string
        where type vector = string Vector.vector

    structure PolyML :
      sig
        val OUTPTR : 'a C.out_p CInterface.Conversion
        val INPTR : 'a C.in_p CInterface.Conversion
        val INOUTREF : ('a, 'b) C.r CInterface.Conversion
      end
  end =
  struct
    (**
     * For Poly/ML, `t`, the representation of a C string array, is always
     * just a pointer to a null terminated array of pointers to null-
     * terminated strings.  Although conversion from an SML string vector
     * will, therefore, allocate a copy of the string vector on the C heap,
     * this would have happened anyway before the SML string vector was
     * passed to a C function.  Furthermore, by doing the allocation on
     * conversion from an SML string  vector, multiple copies of the same
     * string vector on the C heap can be avoided by using the same `t`
     * value.
     *)
    type t = CPointer.notnull CPointer.t Finalizable.t

    type vector = string Vector.vector
    type elem = string

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
          val g_strdupv_sym = load_sym libglib "g_strdupv"
          val g_strfreev_sym = load_sym libglib "g_strfreev"
          val g_strv_length_sym = load_sym libglib "g_strv_length"

          val dupPointer_ : notnull t -> notnull t =
            fn p => call1 g_strdupv_sym POINTER POINTER p
          val free_ : notnull t -> unit = call1 g_strfreev_sym POINTER VOID
          val len_ : notnull t -> int = call1 g_strv_length_sym POINTER INT
          val sub_ : notnull t -> int -> GCharVec.C.notnull GCharVec.C.out_p =
            derefOffset GCharVec.PolyML.OUTPTR
        end

        val len = len_
        val sub = sub_
        (* For `sub p i` we must ensure `0 <= i andalso i < len p` *)

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to value of `i` that satisfy
         * `0 <= i andalso i < n` *)


        (**
         * Conversion functions to/from C arrays
         *)
        fun fromCarray (tabulate : 'a tabulator) (p : notnull p) : 'a =
          tabulate (len p, GCharVec.C.copyPtrToVector o sub p)
          (* For `sub p i` we have `0 <= i andalso i < len p` by
           * `tabulate`. *)

        local
          open CInterface
          val (_, toC, Ctype) = breakConversion STRING
        in
          fun toCarray (v : string Vector.vector) : notnull p =
            let
              val len = Vector.length v
              val arr = alloc (len + 1) Ctype
              fun updateArr (i, s) =
                assign Ctype (offset i Ctype arr) (toC s)
            in
              Vector.appi updateArr v;
              assign Ctype (offset len Ctype arr) null;
              Pointer.PolyML.addressFromVol arr
            end
        end


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a p

        fun fromPtr (p : notnull out_p) : t = Finalizable.new p

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val arr = Finalizable.new p
          in
            Finalizable.addFinalizer (arr, free_);
            arr
          end

        fun copyPtr (p : notnull out_p) : t =
          fromNewPtr (dupPointer_ p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free_ p

        fun copyPtrToVector (p : notnull out_p) : vector =
          fromCarray Vector.tabulate p

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free_ p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          fromCarray tabulate p

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
          then
            GCharVec.C.copyPtrToVector (sub i)
            (* For `sub i` we have `0 <= i andalso i < length t` by the guard. *)
          else
            raise Subscript
      end

    structure PolyML =
      struct
        val OUTPTR : 'a C.out_p CInterface.Conversion = C.Pointer.PolyML.POINTER
        val INPTR : 'a C.in_p CInterface.Conversion = C.Pointer.PolyML.POINTER
        val INOUTREF : ('a, 'b) C.r CInterface.Conversion = C.Pointer.PolyML.POINTER
      end
  end
