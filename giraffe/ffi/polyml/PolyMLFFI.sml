infixr 0 &&> -->

structure PolyMLFFI :> POLYML_FFI =
  struct
    open CInterface

    type 'a conv = 'a Conversion
    type ('a, 'b) func =
      'a -> unit -> (Ctype, vol) Union.directedArg list * 'b Conversion

    fun mkIn conv x =
      let
        val (_, toC, Ctype) = breakConversion conv
      in
        Union.In (Union.Vol (Ctype, toC x))
      end

    fun addIn conv x (args, ret) = (mkIn conv x :: args, ret)

    fun (conv &&> convs) (x & xs) = addIn conv x o convs xs
    fun (conv --> ret) x () = addIn conv x ([], ret)

    fun call sym func x =
      let
        val (args, ret) = func x ()
        val (fromC, _, Ctype) = breakConversion ret
      in
        case call_sym_and_convert sym args (Union.chooseVol Ctype) of
          (y, []) => fromC (Union.deVol y)
        | _       => raise Foreign "out parameters not expected"
      end
  end
