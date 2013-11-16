signature F_F_I_SCALAR =
  sig
    type t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end
