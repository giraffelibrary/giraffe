signature ORD_KEY =
  sig
    type key
    val compare : key * key -> order
  end
