structure HText =
  struct
    datatype t =
      String of string
    | Space  of int
    | Seq    of t list

    fun string s = String s
    fun seq s = Seq s
    fun concat ss = Seq (map string ss)
    fun space n = Space n

    fun toStrings t =
      let
        fun aux (t, acc) =
          case t of
            String s => s :: acc
          | Space n  => CharVector.tabulate (n, fn _ => #" ") :: acc
          | Seq ts   => foldr aux acc ts
      in
        aux (t, [])
      end
  end
