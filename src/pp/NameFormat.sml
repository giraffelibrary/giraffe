structure NameFormat :> NAME_FORMAT =
  struct
    (* Field formatters *)
    val LL = CharVectorSlice.map Char.toLower
    val UU = CharVectorSlice.map Char.toUpper
    val UL =
      CharVectorSlice.mapi (
        fn
          (0, c) => Char.toUpper c
        | (_, c) => Char.toLower c
      )

    (* Support for extracting fields *)
    (*
     * Allow dash as separator for signal parameter names that have dash
     * instead of underscore.
     * See https://bugzilla.gnome.org/show_bug.cgi?id=679228
     * In future, use
     *
     *   fun step1 ss = Substring.tokens (fn c => c = #"_") ss
     *)
    fun step1 ss = Substring.tokens (fn c => c = #"_" orelse c = #"-") ss

    local
      fun breakNext isCC ss =
        let
          open Substring

          fun aux n prevIsAlpha =
            let
              val c = sub (ss, n)
            in
              if (isCC andalso Char.isUpper c)
                  orelse (not (Char.isAlpha c) andalso prevIsAlpha)
              then (slice (ss, 0, SOME n), SOME (slice (ss, n, NONE)))
              else aux (n + 1) (Char.isAlpha c)
            end
              handle
                Subscript => (ss, NONE)

          val c = sub (ss, 0)
        in
          aux (0 + 1) (Char.isAlpha c)
        end
          handle
            Subscript => (ss, NONE)

      fun breakRest isCC fields ss =
        case breakNext isCC ss of
          (field, SOME ss') => breakRest isCC (field :: fields) ss'
        | (field, NONE)     => field :: fields
    in
      fun step2 isCC (ss, fields) = breakRest isCC fields ss
    end

    (* General name formatter *)
    fun toX (convFirst, convRest, sep) s =
      let
        val ss = Substring.full s

        val revFields =
          case step1 ss of
            [x] => step2 (not (CharVectorSlice.all Char.isUpper x)) (x, [])
          | xs  => foldl (step2 false) [] xs

        val (field1, fields) =
          case rev revFields of
            []      => (Substring.full "", [])
          | x :: xs => (x, xs)
      in
        String.concatWith sep (convFirst field1 :: map convRest fields)
      end

    (* Specific name formatters *)
    val toLCC = toX (LL, UL, "")
    val toUCC = toX (UL, UL, "")
    val toLC  = toX (LL, LL, "")
    val toUC  = toX (UU, UU, "")
    val toLCU = toX (LL, LL, "_")
    val toUCU = toX (UU, UU, "_")
  end
