(* Copyright (C) 2013, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature F_F_I_FLAGS_ENUM =
  sig
    type t
    structure C :
      sig
        type val_
        type ref_
        val withRef :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
      end
    sharing type t = C.val_
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end
