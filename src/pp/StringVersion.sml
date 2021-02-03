structure StringVersion :> VERSION where type version = string =
  struct
    type version = string
    val compare = String.compare
    val toString = Fn.id
  end
