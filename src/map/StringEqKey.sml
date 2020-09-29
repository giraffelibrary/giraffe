structure StringEqKey :> EQ_KEY where type key = string =
  struct
    type key = string
    val eq = (op =)
  end
