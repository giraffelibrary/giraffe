(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CallbackTable :> CALLBACK_TABLE =
  struct

    (**
     * Unlike many storage structures, the callback table can choose the key
     * associated with each entry: the function `insert` returns the key that
     * is used when an entry is added.  Obviously, each entry must have a
     * unique key so that the key can be used to identify the entry.  The
     * type `id`, which represents keys, is implemented as a 32 bit word.
     * This provides more than enough unique keys and enabled efficient
     * bitwise tranformations on the keys.
     *)
    type id = C_UInt.word

    val fmtId = C_UInt.fmt StringCvt.DEC

    (* The callback table is effectively a dynamic array whose size grows as
     * required.  No attempt is made to shrink the structure where possible.
     * The dynamic array is allocated in blocks whose sizes increase
     * exponentially.  Once a block is allocated, it is never removed.  The
     * blocks are indexed from zero and the size of a block is given by the
     * function `blockLength`.
     *
     * The keys are simply an index into the concatenation of the blocks and
     * are allocated sequentially starting from 1. For type `id` defined as
     * `C_UInt.word` and excluding key 0, at most 32 blocks are required.
     *)
    val numBlocks = 32

    (* When an entry is removed its key is recycled by maintaining a list of
     * recovered keys.  When a fresh key is required, recovered keys are used
     * in preference to new keys.  Consequently
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
      val << = C_UInt.<<
      val >> = C_UInt.>>
      val andb = C_UInt.andb
      val toInt = C_UInt.toInt
      infix << >>

      (**
       * `log2` computes log to base 2 for C_UInt.word values by
       *
       *   pow (0w2, log2 w) <= w < pow (0w2, (log2 w) + 1)
       *
       * where `pow (x, y)` raises `x` to the power `y`.  This returns the
       * same integral values as `IntInf.log2`.  When `w` is zero, there is
       * no value for `log2 w` that satisfies the specification above so
       * `log2 0w0` raises `Domain`, like `IntInf.log2 0`.
       *)
      fun log2 (w : C_UInt.word) : Word.word =
        let
          fun aux (n, w) =
            if w = 0w0
            then n
            else aux (n + 0w1, w >> 0w1)
        in
          case w of
            0w0 => raise Domain
          | _   => aux (0w0, w >> 0w1)
        end
    in
      fun blockLength (idx : Word.word) = 0w1 << idx

      fun keyIndex (id : id) =
        let
          val bIdx = log2 id
          val bLen = blockLength bIdx
          val eIdx = andb (bLen - 0w1, id)
        in
          {bIdx = Word.toInt bIdx, eIdx = toInt eIdx, bLen = toInt bLen}
        end

      val firstId : id = 0w1
    end

    (* Note that key 0 is excluded to make the above functions as simple as
     * possible.  If we wanted to include key 0, we could instead define:
     *
     *   val numBlocks = 33
     *
     *   fun blockLength idx =
     *     case idx of
     *       0w0 => 0w1
     *     | _   => C_UInt.<< (0w1, idx - 0w1)
     *
     *   fun keyIndex id =
     *     let
     *       val bIdx = case id of 0w0 => 0w0 | _ => log2 id + 0w1
     *       val bLen = blockLength bIdx
     *       val eIdx = C_UInt.andb (bLen - 0w1, id)
     *     in
     *       {bIdx = Word.toInt bIdx, eIdx = toInt eIdx, bLen = toInt bLen}
     *     end
     *)


    (**
     * A callback table containing elements of type `'a` is represented by
     * the type `'a t`.
     *)
    type 'a block = 'a option array
    type 'a t = {
      nextId : id ref,
      recIds : id list ref,
      blocks : 'a block option array
    }

    (* The state components are as follows:
     *
     *   `nextId`
     *     The next new key.
     *
     *   `recIds`
     *     A stack of recovered keys.
     *
     *   `blocks`
     *     The array of blocks.
     *
     * `Array.length blocks = numBlocks`.  When `Array.sub (blocks, i)` is
     * `SOME block`, then `Array.length block = blockLength i`.
     *
     * As a recovered key is used in preference to a new key, every element
     * of `!recIds` is less than `!nextId`.  The function `getFreshId` is
     * is used to allocate a fresh key.
     *)


    (**
     * New
     *)
    fun new () : 'a t = {
      nextId = ref firstId,
      recIds = ref [],
      blocks = Array.array (numBlocks, NONE)
    }


    (**
     * Insertion
     *)
    fun getFreshId (nextId, recIds) =
      case !recIds of
        id :: ids => id before recIds := ids
      | []        => !nextId before nextId := !nextId + 0w1

    fun insert {nextId, recIds, blocks} x =
      let
        val id = getFreshId (nextId, recIds)
        val {bIdx, bLen, eIdx} = keyIndex id
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
        id
      end


    (**
     * Deletion
     *)
    fun delete {nextId, recIds, blocks} id =
      let
        val {bIdx, eIdx, ...} = keyIndex id
      in
        case Array.sub (blocks, bIdx) of
          SOME block =>
            let
              val e = Array.sub (block, eIdx)
            in
              case e of
                SOME _ => (
                  recIds := id :: !recIds;
                  Array.update (block, eIdx, NONE)
                )
              | NONE   => ();
              e
            end
        | NONE       => NONE
      end


    (**
     * Look up
     *)
    fun lookup {nextId, recIds, blocks} id =
      let
        val {bIdx, eIdx, ...} = keyIndex id
      in
        case Array.sub (blocks, bIdx) of
          SOME block => Array.sub (block, eIdx)
        | NONE       => NONE
      end

  end
