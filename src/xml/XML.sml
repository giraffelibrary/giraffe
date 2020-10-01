(* Simplified interface for reading non-enormous XML documents into
   a datatype.
   Tom Murphy VII, 2009. 
   This file only: Use and distribute freely.

   Removed parts not used by Giraffe GIR file parser.
   Removed unreferenced identifiers.
   Modified definitions of vectortoutf8 and datatoutf8.
   Phil Clayton, 2020.
*)

structure XML :> XML =
struct

  exception XML of string

  type attribute = string * string
  type tag = string * attribute list

  datatype tree = 
      Text of string
    | Elem of tag * tree list

  val dtd = Dtd.initDtdTables()

  fun seqToUtf8 foldl seq =
      let
          val BUFFER_SIZE = 1024
              
          fun write ((s, arr, sz), w) =
              let in
                  CharArray.update(arr, sz, chr (Word8.toInt w));
                  (s, arr, sz + 1)
              end handle Subscript =>
                  write ((CharArraySlice.vector
                            (CharArraySlice.slice(arr, 0, NONE)) :: s, 
                          arr, 0), w)

          fun finalize (s, arr, sz) = 
              String.concat(rev (CharArraySlice.vector
                                 (CharArraySlice.slice(arr, 0, SOME sz)) :: s))

          val start = (nil, CharArray.array(BUFFER_SIZE, chr 0), 0)

          val finish = foldl (EncodeUTF8.writeCharUtf8 write) start seq
      in
          finalize finish
      end

  val vectorToUtf8 = seqToUtf8 Vector.foldl
  val listToUtf8   = seqToUtf8 List.foldl

  fun spectoattr (i : int, ap : HookData.AttPresent,
                  (* This is the text before the attribute name
                     and between the attribute and value (I think),
                     which is useless except for unparsing *)
                  _ : (UniChar.Data * UniChar.Data) option) =
      (listToUtf8 (Dtd.Index2AttNot dtd i), 
       case ap of
           (* XXX ??? *)
           HookData.AP_IMPLIED => "IMPLIED"
         | HookData.AP_MISSING => "MISSING"
         | HookData.AP_DEFAULT (_, v2, _) => vectorToUtf8 v2
         | HookData.AP_PRESENT (_, v2, _) => vectorToUtf8 v2)

  structure Hooks =
  struct
      open IgnoreHooks


      type AppData = tree list * (tag * tree list) list
      type AppFinal = tree

      val appstart = (nil, nil)
          
      fun hookStartTag ((content, stack),
                        (_ (* dtd *), id, atts, _, empty)) =
          let val t = listToUtf8 (Dtd.Index2Element dtd id)
          in
              if empty 
              then (Elem ((t, map spectoattr atts), nil) :: content, stack)
              else (nil, ((t, map spectoattr atts), content) :: stack)
          end

      fun hookEndTag ((_, nil), _) = raise XML "ill-formed: no tag open"
        | hookEndTag ((content, (tag, content') :: stack), _) =
          (Elem (tag, rev content) :: content', stack)

      fun hookData ((content, stack), (_, vec, _)) =
          let in
              (*
              print "hookData:\n  ";
              Vector.app (fn uc =>
                          print (UniChar.Char2String uc ^ "(" ^ Word.toString uc ^ ")")
                          ) vec;
              print "\nend hookData\n";
              *)
              (Text (vectorToUtf8 vec) :: content, stack)
          end

      fun hookCData ((content, stack), (_, vec)) =
          (Text (vectorToUtf8 vec) :: content, stack)

      fun hookCharRef ((content, stack), (_, c, _)) =
          (Text (listToUtf8 [c]) :: content, stack)

      fun hookFinish ([tree], nil) = tree
        | hookFinish (nil, _) = raise XML "ill-formed: parsed zero trees"
        | hookFinish _ = raise XML "ill-formed: multiple trees?"
  end

  structure Opt = ParserOptions ()
  (* Turn off validation. Almost universally the DTD is given via a URL,
     and fetching that is not easy to support and doesn't give much
     benefit. If validation is on, then basically all attributes will
     be rejected as errors, because they are undeclared. *)
  val () = Opt.O_VALIDATE := false 
  structure Parser = Parse(structure Dtd = Dtd
                           structure Hooks = Hooks
                           structure ParserOptions = Opt
                           structure Resolve = ResolveNull)

  fun normalize (Elem(tag, tl)) =
      let
          fun make s (Text "" :: rest) = make s rest
            | make s (Text t :: rest) = make (t :: s) rest
            | make nil ((e as Elem _) :: rest) = normalize e :: make nil rest
            | make l ((e as Elem _) :: rest) = 
                Text (String.concat (rev l)) :: normalize e :: make nil rest
            | make nil nil = nil
            | make l nil = [Text (String.concat (rev l))]
      in
          Elem(tag, make nil tl)
      end
    | normalize e = e

  fun parsefile file = 
      normalize(Parser.parseDocument
                (SOME (Uri.String2Uri file)) (SOME dtd) Hooks.appstart)

  fun getattr nil _ = NONE
    | getattr ((s, v) :: rest) ss = if s = ss 
                                    then SOME v 
                                    else getattr rest ss
end
