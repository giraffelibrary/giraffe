(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Utf8Vector : UTF8_VECTOR =
  struct
    type t = string list

    structure PolyML =
      struct
        local
          open GCharVecVec.C
        in
          type notnull = notnull
          type 'a in_p = 'a in_p PolyMLFFI.conversion
          type 'a out_p = 'a out_p PolyMLFFI.conversion
          type ('a, 'b) r = ('a, 'b) r PolyMLFFI.conversion 

          val INPTR = GCharVecVec.PolyML.cInPtr : notnull in_p
          val INOPTPTR = GCharVecVec.PolyML.cOptInPtr : unit in_p
          val OUTREF = GCharVecVec.PolyML.cRefOut : (unit, notnull) r
          val OUTOPTREF = GCharVecVec.PolyML.cRef : (unit, unit) r
          val INOUTREF = GCharVecVec.PolyML.cRefInOut : (notnull, notnull) r
          val RETPTR = GCharVecVec.PolyML.cOutPtr : notnull out_p
          val RETOPTPTR = GCharVecVec.PolyML.cOptOutPtr : unit out_p
        end
      end

    structure C =
      struct
        local
          open GCharVecVec.C
        in
          type notnull = notnull
          type 'a in_p = 'a in_p
          type 'a out_p = 'a out_p
          type ('a, 'b) r = ('a, 'b) r
        end

        val fromList = GCharVecVec.fromVector o Vector.fromList


        val withNullRef = GCharVecVec.C.withNullRef


        val withConstPtr = fn f => GCharVecVec.C.withConstPtr f o fromList

        val withConstOptPtr =
          fn f => GCharVecVec.C.withConstOptPtr f o Option.map fromList


        val withRefConstPtr =
          fn f => GCharVecVec.C.withRefConstPtr f o fromList

        val withRefConstOptPtr =
          fn f => GCharVecVec.C.withRefConstOptPtr f o Option.map fromList


        val withRefDupPtr =
          fn f => GCharVecVec.C.withRefDupPtr f o fromList

        val withRefDupOptPtr =
          fn f => GCharVecVec.C.withRefDupOptPtr f o Option.map fromList


        fun fromPtr transfer =
          let
            val from =
              if transfer
              then GCharVecVec.C.copyNewPtrToTabulated
              else GCharVecVec.C.copyPtrToTabulated
          in
            from List.tabulate o GCharVecVec.C.OutPointer.toNotNull
          end


        fun fromOptPtr transfer =
          let
            val from =
              if transfer
              then GCharVecVec.C.copyNewOptPtrToTabulated
              else GCharVecVec.C.copyOptPtrToTabulated
          in
            from List.tabulate
          end
      end
  end
