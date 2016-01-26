(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
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
        val cOutPtr    : C.notnull C.out_p PolyMLFFI.conversion
        val cOptOutPtr : unit      C.out_p PolyMLFFI.conversion

        val cInPtr    : C.notnull C.in_p PolyMLFFI.conversion
        val cOptInPtr : unit      C.in_p PolyMLFFI.conversion

        val cRef      : ('a,        unit) C.r PolyMLFFI.conversion
        val cRefIn    : (C.notnull, unit) C.r PolyMLFFI.conversion
        val cRefOut   : ('a,        'b)   C.r PolyMLFFI.conversion
        val cRefInOut : (C.notnull, 'a)   C.r PolyMLFFI.conversion
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
    structure ElemType = GCharVec.C.OutPointer.OptNullType
    structure Pointer = CTypedPointer (ElemType)
    type t = Pointer.t Finalizable.t

    type vector = string Vector.vector
    type elem = string

    structure C =
      struct
        type 'a p = 'a Pointer.p
        type notnull = Pointer.notnull

        local
          open PolyMLFFI
          val cPtr = Pointer.PolyML.cVal
        in
          val g_malloc_sym = getSymbol libglib "g_malloc"
          val g_strdupv_sym = getSymbol libglib "g_strdupv"
          val g_strfreev_sym = getSymbol libglib "g_strfreev"
          val g_strv_length_sym = getSymbol libglib "g_strv_length"

          val malloc_ = call g_malloc_sym (cUlong --> cPtr)
          val dup_ = call g_strdupv_sym (cPtr --> cPtr)
          val free_ = call g_strfreev_sym (cPtr --> cVoid)
          val len_ = call g_strv_length_sym (cPtr --> cInt)
        end

        fun new n = malloc_ (n * Word.toInt ElemType.size)
        val free = free_
        val dup = dup_
        val len = len_
        fun sub p i =
          GCharVec.C.OutPointer.toNotNull (Pointer.get (p, i))
            handle GCharVec.C.OutPointer.Null => raise Subscript
        (* For `sub p i` we must ensure `0 <= i andalso i < len p` *)

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to value of `i` that satisfy
         * `0 <= i andalso i < n` *)


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        fun fromPtr (p : notnull out_p) : t =
          Finalizable.new p

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val arr = Finalizable.new p
          in
            Finalizable.addFinalizer (arr, free);
            arr
          end

        fun copyPtr (p : notnull out_p) : t =
          fromNewPtr (dup p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          tabulate (len p, GCharVec.C.copyPtrToVector o sub p)
          (* For `sub p i` we have `0 <= i andalso i < len p` by `tabulate`. *)

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free p

        fun copyPtrToVector (p : notnull out_p) : vector =
          copyPtrToTabulated Vector.tabulate p

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free p


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

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)


        fun fromVector v =
          let
            val n = Vector.length v
            val p = new (n + 1)
            fun set (i, v) =
              Pointer.set (
                p,
                i,
                GCharVec.C.OutPointer.toOptNull (GCharVec.C.fromVector v)
              )
            val () = Vector.appi set v
            val () = Pointer.set (p, n, GCharVec.C.OutPointer.null)
          in
            p
          end


        (**
         * Value parameters
         *)
        type 'a in_p = 'a Pointer.p

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer f p =
            p & withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer f pOpt =
            Pointer.fromOpt pOpt & withOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)
        in
          fun withPtr f t = Finalizable.withValue (t, withPointer f)

          val withConstPtr = withPtr

          fun withDupPtr f t = Finalizable.withValue (t, withDupPointer f o dup)


          fun withOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withOptPointer f o SOME)
            | NONE   => withOptPointer f NONE

          val withConstOptPtr = withOptPtr

          fun withDupOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withDupOptPointer f o SOME o dup)
            | NONE   => withDupOptPointer f NONE
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withRefPointer f    = Pointer.withRefVal f

          fun withRefOptPointer f = Pointer.withRefOptVal f

          fun withRefDupPointer f p =
            withRefPointer f p handle e => (free p; raise e)

          fun withRefDupOptPointer f pOpt =
            withRefOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)
        in
          fun withNullRef f = Pointer.withNullRef f


          fun withRefPtr f t = Finalizable.withValue (t, withRefPointer f)

          val withRefConstPtr = withRefPtr

          fun withRefDupPtr f t = Finalizable.withValue (t, withRefDupPointer f o dup)


          fun withRefOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withRefOptPointer f o SOME)
            | NONE   => withRefOptPointer f NONE

          val withRefConstOptPtr = withRefOptPtr

          fun withRefDupOptPtr f =
            fn
              SOME t =>
                Finalizable.withValue (t, withRefDupOptPointer f o SOME o dup)
            | NONE   => withRefDupOptPointer f NONE
        end
      end


    fun fromVector v = C.fromNewPtr (C.fromVector v)

    fun toVector t = Finalizable.withValue (t, C.copyPtrToVector)

    fun length t = Finalizable.withValue (t, C.len)

    fun sub t =
      let
        val len = length t
        val sub = Finalizable.withValue (t, C.sub)
      in
        fn i =>
          if 0 <= i andalso i < len
          then GCharVec.C.copyPtrToVector (sub i)
          else raise Subscript
      end


    structure PolyML =
      struct
        val cOutPtr    : C.notnull C.out_p PolyMLFFI.conversion = Pointer.PolyML.cVal
        val cOptOutPtr : unit      C.out_p PolyMLFFI.conversion = Pointer.PolyML.cOptVal

        val cInPtr    : C.notnull C.in_p PolyMLFFI.conversion = Pointer.PolyML.cVal
        val cOptInPtr : unit      C.in_p PolyMLFFI.conversion = Pointer.PolyML.cOptVal

        val cRef      : ('a,        unit) C.r PolyMLFFI.conversion = Pointer.PolyML.cRef
        val cRefIn    : (C.notnull, unit) C.r PolyMLFFI.conversion = Pointer.PolyML.cRefIn
        val cRefOut   : ('a,        'b)   C.r PolyMLFFI.conversion = Pointer.PolyML.cRefOut
        val cRefInOut : (C.notnull, 'a)   C.r PolyMLFFI.conversion = Pointer.PolyML.cRefInOut
      end
  end
