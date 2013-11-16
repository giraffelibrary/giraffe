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
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end
