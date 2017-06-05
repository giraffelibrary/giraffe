signature FLAGS =
  sig
    eqtype t
    include BIT_FLAGS where type flags = t
  end
