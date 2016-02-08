(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Utf8 :> UTF8 =
  struct
    type t = string

    structure PolyML =
      struct
        local
          open GCharVec.C
        in
          type notnull = notnull
          type 'a in_p = 'a in_p PolyMLFFI.conversion
          type 'a out_p = 'a out_p PolyMLFFI.conversion
          type ('a, 'b) r = ('a, 'b) r PolyMLFFI.conversion 

          val INPTR = GCharVec.PolyML.cInPtr : notnull in_p
          val INOPTPTR = GCharVec.PolyML.cOptInPtr : unit in_p
          val OUTREF = GCharVec.PolyML.cRefOut : (unit, notnull) r
          val OUTOPTREF = GCharVec.PolyML.cRef : (unit, unit) r
          val INOUTREF = GCharVec.PolyML.cRefInOut: (notnull, notnull) r
          val RETPTR = GCharVec.PolyML.cOutPtr : notnull out_p
          val RETOPTPTR = GCharVec.PolyML.cOptOutPtr : unit out_p
        end
      end

    structure C =
      struct
        local
          open GCharVec.C
        in
          type notnull = notnull
          type 'a in_p = 'a in_p
          type 'a out_p = 'a out_p
          type ('a, 'b) r = ('a, 'b) r
        end


        val withNullRef = GCharVec.C.withNullRef


        val withConstPtr =
          fn f => GCharVec.C.withConstPtr f o GCharVec.fromVector

        val withConstOptPtr =
          fn f => GCharVec.C.withConstOptPtr f o Option.map GCharVec.fromVector


        val withRefConstPtr =
          fn f => GCharVec.C.withRefConstPtr f o GCharVec.fromVector

        val withRefConstOptPtr =
          fn f => GCharVec.C.withRefConstOptPtr f o Option.map GCharVec.fromVector


        val withRefDupPtr =
          fn f => GCharVec.C.withRefDupPtr f o GCharVec.fromVector

        val withRefDupOptPtr =
          fn f => GCharVec.C.withRefDupOptPtr f o Option.map GCharVec.fromVector


        fun fromPtr transfer =
          if transfer
          then GCharVec.C.copyNewPtrToVector o GCharVec.C.OutPointer.toNotNull
          else GCharVec.C.copyPtrToVector o GCharVec.C.OutPointer.toNotNull

        fun fromOptPtr transfer =
          if transfer
          then GCharVec.C.copyNewOptPtrToVector
          else GCharVec.C.copyOptPtrToVector
      end
  end
