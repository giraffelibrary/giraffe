(* Copyright (C) 2012, 2018, 2020-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor WordTable(Key : WORD) :> TABLE where type key = Key.word =
  struct

    (**
     * Unlike many map data structures, the a table determines the key
     * associated with each entry: the function `insert` returns the key
     * that is used when an entry is added.  Each entry must have a unique
     * key so that the key can be used to identify the entry.  The type
     * `key`, which represents keys, is implemented as a word which
     * enables efficient bitwise tranformations on the keys.
     *
     * Note that this implementation recycles a key when its associated
     * element is deleted.  Consequently, accidentally using a key for an
     * element that has been reused may result in errors that are hard to
     * track down.  Care should be taken to ensure that a key used to
     * delete an element is not retained.
     *)
    type key = Key.word
    val fromWord = Key.fromLarge o Word.toLarge

    val fmtKey = Key.fmt StringCvt.DEC

     (* The keys are simply an index into the concatenation of the blocks
     * and are allocated sequentially starting from 1. For type `key`
     * defined as `Key.word` and excluding key 0, at most `Key.wordSize`
     * blocks are required.
     *)
    val nullKey = fromWord 0w0
    val firstKey = fromWord 0w1
    val numBlocks = Key.wordSize

   (* The table is effectively a dynamic array whose size grows as
     * required.  No attempt is made to shrink the structure where
     * possible.  The dynamic array is allocated in blocks whose sizes
     * increase exponentially.  Once a block is allocated, it is never
     * removed.  The blocks are indexed from zero and the size of a block
     * is given by the function `blockLength`.
     *)
    local
      val << = Key.<<
      infix <<
    in
      fun blockLength (idx : Word.word) = firstKey << idx
    end

    (* When an entry is removed its key is recycled by maintaining a list
     * of recovered keys.  When a fresh key is required, recovered keys
     * are used in preference to new keys.  Consequently
     *
     *   - the list of recovered keys is never more than the number of
     *     entries held in the structure at any time in its life;
     *
     *   - the overall size of the dynamic array is never more than the
     *     smallest power of two that is at least as large as the most
     *     number of entries held in the structure at any time in its life.
     *
     * The entry indexed by a given key is accessed via two indexes: the
     * index of the block and the index of the entry within the block.
     * These indices are computed by the function `keyIndex`.
     *)
    local
      (**
       * `log2` computes log to base 2 for Key.word values by
       *
       *   pow (0w2, log2 w) <= w < pow (0w2, (log2 w) + 1)
       *
       * where `pow (x, y)` raises `x` to the power `y`.  This returns the
       * same integral values as `IntInf.log2`.  When `w` is zero, there is
       * no value for `log2 w` that satisfies the specification above so
       * `log2 0w0` raises `Domain`, like `IntInf.log2 0`.
       *)
      fun log2 (w : Key.word) : Word.word =
        let
          val >> = Key.>>
          infix >>

          fun aux (n, w) =
            if w = nullKey
            then n
            else aux (n + 0w1, w >> 0w1)
        in
          if w = nullKey
          then raise Domain
          else aux (0w0, w >> 0w1)
        end

      val andb = Key.andb
      val toInt = Key.toInt
    in
      fun keyIndex (key : key) =
        let
          val op - = Key.-
          val bIdx : Word.word = log2 key
          val bLen : Key.word  = blockLength bIdx
          val eIdx : Key.word  = andb (bLen - firstKey, key)
        in
          {bIdx = Word.toInt bIdx, eIdx = toInt eIdx, bLen = toInt bLen}
        end
    end

    fun indexKey (bi : int) =
      let
        val op + = Key.+
        val << = Key.<<
        infix <<
        val baseIdx = firstKey << Word.fromInt bi
      in
        fn ei : int => baseIdx + (Key.fromInt ei)
      end

    (**
     * A table with elements of type `'a` is represented by the type `'a t`.
     *)
    type 'a block = 'a option array
    type 'a t = {
      nextKey : key ref,
      recKeys : key list ref,
      blocks  : 'a block option array
    }

    (* The state components are as follows:
     *
     *   `nextKey`
     *     The next new key.
     *
     *   `recKeys`
     *     A stack of recovered keys.
     *
     *   `blocks`
     *     The array of blocks.
     *
     * `Array.length blocks = numBlocks`.  When `Array.sub (blocks, i)` is
     * `SOME block`, then `Array.length block = blockLength i`.
     *
     * As a recovered key is used in preference to a new key, every element
     * of `!recKeys` is less than `!nextKey`.  The function `getFreshId` is
     * is used to allocate a fresh key.
     *)


    (**
     * New
     *)
    fun new () : 'a t = {
      nextKey = ref firstKey,
      recKeys = ref [],
      blocks  = Array.array (numBlocks, NONE)
    }


    (**
     * Insertion
     *)
    val op + = Key.+
    fun getFreshKey (nextKey, recKeys) =
      case !recKeys of
        key :: keys => key before recKeys := keys
      | []          => !nextKey before nextKey := !nextKey + firstKey

    fun insert {nextKey, recKeys, blocks} x =
      let
        val key = getFreshKey (nextKey, recKeys)
        val {bIdx, bLen, eIdx} = keyIndex key
      in
        case Array.sub (blocks, bIdx) of
          SOME block => Array.update (block, eIdx, SOME x)
        | NONE       =>
            let
              val block = Array.array (bLen, NONE)
            in
              Array.update (block, eIdx, SOME x);
              Array.update (blocks, bIdx, SOME block)
            end;
        key
      end


    (**
     * Deletion
     *)
    fun delete {recKeys, blocks, ...} key =
      let
        val {bIdx, eIdx, ...} = keyIndex key
      in
        case Array.sub (blocks, bIdx) of
          SOME block =>
            let
              val e = Array.sub (block, eIdx)
            in
              case e of
                SOME _ => (
                  recKeys := key :: !recKeys;
                  Array.update (block, eIdx, NONE)
                )
              | NONE   => ();
              e
            end
        | NONE       => NONE
      end


    (**
     * Filtering
     *)
    fun filter {recKeys, blocks, ...} f =
      let
        fun filterElem block indexKey =
          fn
            (ei, SOME e, keys) =>
              if f e
              then keys
              else (
                Array.update (block, ei, NONE);
                indexKey ei :: keys
              )
          | (_,  NONE,   keys) => keys

        exception Done of key list
        val filterBlock =
          fn
            (bi, SOME block, keys) => Array.foldli (filterElem block (indexKey bi)) keys block
          | (_,  NONE,       keys) => raise Done keys

        val keys = Array.foldli filterBlock [] blocks handle Done keys => keys 
      in
        recKeys := List.revAppend (keys, !recKeys);
        keys
      end


    (**
     * Look up
     *)
    fun lookup {blocks, ...} key =
      let
        val {bIdx, eIdx, ...} = keyIndex key
      in
        case Array.sub (blocks, bIdx) of
          SOME block => Array.sub (block, eIdx)
        | NONE       => NONE
      end


    (**
     * Fold
     *)
    fun fold f ({blocks, ...}, acc) =
      let
        val addElem =
          fn
            (SOME e, acc) => f (e, acc)
          | (NONE,   acc) => acc

        exception Done of 'a
        val addBlock =
          fn
            (SOME block, acc) => Array.foldl addElem acc block
          | (NONE,       acc) => raise Done acc
      in
        Array.foldl addBlock acc blocks handle Done acc => acc
      end

    fun foldi f ({blocks, ...}, acc) =
      let
        fun addElem indexKey =
          fn
            (ei, SOME e, acc) => f (indexKey ei) (e, acc)
          | (_,  NONE,   acc) => acc

        exception Done of 'a
        val addBlock =
          fn
            (bi, SOME block, acc) => Array.foldli (addElem (indexKey bi)) acc block
          | (_,  NONE,       acc) => raise Done acc
      in
        Array.foldli addBlock acc blocks handle Done acc => acc
      end


    (**
     * App
     *)
    fun app f {blocks, ...} =
      let
        exception Done
        val appBlock =
          fn
            SOME block => Array.app (Option.app f) block
          | NONE       => raise Done
      in
        Array.app appBlock blocks handle Done => ()
      end

    fun appi f {blocks, ...} =
      let
        exception Done
        fun appElem indexKey =
          fn
            (ei, SOME e) => f (indexKey ei) e
          | (_,  NONE)   => ()
        val appBlock =
          fn
            (bi, SOME block) => Array.appi (appElem (indexKey bi)) block
          | (_,  NONE)       => raise Done
      in
        Array.appi appBlock blocks handle Done => ()
      end
  end
