signature ENUM =
  sig
    eqtype t
    structure C :
      sig
        structure ValueType : C_VALUE_EQ_TYPE where type t = t
      end

    val null : t
    exception Value of GInt.t

    structure FFI :
      sig
        type val_ (* = C.ValueType.v *)
        type ref_
        val withVal : (val_ -> 'a) -> t -> 'a
        val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
