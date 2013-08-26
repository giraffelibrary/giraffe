signature MAP =
  sig
    (* Types *)

    type 'a t

    type key
    type 'a maplet = key * 'a


    (* Constructors *)

    val empty : 'a t
    val singleton : 'a maplet -> 'a t


    (* Operations *)

    (**
     * Function: insert
     * Arguments:
     *   (g : 'a -> 'b)
     *   (f : 'a * 'b -> 'b)
     *   (
     *     (k, d) : 'a maplet,
     *     m      : 'b t
     *   )
     * Returns:
     *   (d' : 'b)
     *   (m' : 'b t)
     *
     * Description:
     *   ...
     *
     *
     *
     *
     * Usage notes:
     *   insert g f      : ('a t, 'b, 'b maplet) foldmap
     *   #2 o insert g f : ('a t, 'b maplet) fold
     *
     **)
    val insert : ('a -> 'b) -> ('a * 'b -> 'b) -> 'a maplet * 'b t -> 'b * 'b t

    (**
     * Function: delete
     * Arguments:
     *   (
     *     k : key,
     *     m : 'a t
     *   )
     * Returns:
     *   (
     *     d : 'a,
     *     m' : 'a t
     *   )
     *
     * Description:
     *   ...
     *
     *
     *
     *
     * Usage notes:
     *   delete      : ('a t, key, 'a) foldmap
     *   #2 o delete : ('a t, key) fold
     **)
    val delete : key * 'a t -> 'a * 'a t

    (**
     * Function: update
     * Arguments:
     *   k : key,
     *   f : 'a -> 'a
     *   m : 'a t
     * Returns:
     *   m' : 'a t
     *
     * Description:
     *   ...
     *
     *
     *
     *
     * Usage notes:
     **)
    val update : key -> ('a -> 'a) -> 'a t -> 'a t

    (**
     * Function: lookup
     * Arguments:
     *   m : 'a t
     *   k : key
     * Returns:
     *   d : 'a option
     *
     * Description:
     *   ...
     *
     *
     *
     *
     * Usage notes:
     **)
    val lookup : 'a t -> key -> 'a option

    (**
     * Function: size
     * Arguments:
     *   m : 'a t
     * Returns:
     *   n : int
     *
     * Description:
     *   ...
     *
     *
     *
     *
     * Usage notes:
     **)
    val size : 'a t -> int

    (**
     * Function: map
     * Arguments:
     *   f : 'a -> 'b
     *   m : 'a t
     * Returns:
     *   m' : 'b t
     * 
     * Description:
     *   ...
     *
     *)
    val map : ('a -> 'b) -> 'a t -> 'b t

    (**
     * Function: mapi
     * Arguments:
     *   f : key * 'a -> 'b
     *   m : 'a t
     * Returns:
     *   m' : 'b t
     * 
     * Description:
     *   ...
     *
     *)
    val mapi : (key * 'a -> 'b) -> 'a t -> 'b t

    (**
     * Function: app
     * Arguments:
     *   f : 'a -> unit
     *   m : 'a t
     * Returns:
     *   () : unit
     * 
     * Description:
     *   ...
     *
     *)
    val app : ('a -> unit) -> 'a t -> unit

    (**
     * Function: appi
     * Arguments:
     *   f : key * 'a -> unit
     *   m : 'a t
     * Returns:
     *   () : unit
     * 
     * Description:
     *   ...
     *
     *)
    val appi : (key * 'a -> unit) -> 'a t -> unit

    (**
     * Function: toList
     * Arguments:
     *   xs : (key * 'a) list
     * Returns:
     *   m : 'a t
     * Raises:
     *   Domain
     *     if a key occurs more than once in `xs`
     *
     * Description:
     *   ...
     *
     * Usage notes:
     **)
    val fromList : (key * 'a) list -> 'a t

    (**
     * Function: toList
     * Arguments:
     *   m : 'a t
     * Returns:
     *   xs : (key * 'a) list
     *
     * Description:
     *   The order of elements in the returned list can be chosen
     *   by the implementation.
     *
     * Usage notes:
     **)
    val toList : 'a t -> (key * 'a) list
  end
