signature OPTION =
  sig
    include OPTION

    val fold : ('a * 'b -> 'b) -> ('a option * 'b -> 'b)
  end
