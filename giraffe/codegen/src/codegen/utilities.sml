(* Support for lazy evalation *)

fun lazy (f : unit -> 'a) : unit -> 'a =
  let
    datatype 'a result =
      UNKNOWN of (unit -> 'a)
    | SUCCESS of 'a
    | FAILURE of exn

    val r = ref (UNKNOWN f)
  in
    fn () =>
      case ! r of
        UNKNOWN f =>
          let
            val a = f () handle e => (r := FAILURE e; raise e)
          in
            r := SUCCESS a;
            a
          end
      | SUCCESS a => a
      | FAILURE e => raise e
  end


(* Support for lists *)

open ListExtras
