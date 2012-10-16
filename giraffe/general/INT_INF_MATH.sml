signature INT_INF_MATH =
  sig
    type int = IntInf.int

    (* `log10 n` returns the floor of log (to base 10) of `n` if `0 < n`.
     * The exception `Domain` is raised if `n <= 0`.
     *)
    val log10 : int -> int
  end
