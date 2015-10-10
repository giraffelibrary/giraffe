signature EQ_KEY =
  sig
    type key
    val eq : key * key -> bool
  end
