structure IntInfMath :> INT_INF_MATH =
  struct
    type int = IntInf.int

    fun log10 n =
      if n >= 10
      then 1 + log10 (n div 10)
      else if n >= 1
      then 0
      else raise Domain
  end
