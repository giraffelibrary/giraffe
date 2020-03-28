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


(* Support for strings *)

fun stripPrefix s1 s2 =
  if String.isPrefix s1 s2
  then SOME (String.extract (s2, String.size s1, NONE))
  else NONE


(* Support for lists *)

open ListExtras
