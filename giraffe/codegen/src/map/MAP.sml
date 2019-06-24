signature MAP =
  sig
    (* Types *)

    type key
    type 'a maplet = key * 'a

    type 'a t


    (* Constructors *)

    val empty : 'a t

    val singleton : 'a maplet -> 'a t
    val singletonMap : ('a -> 'b) -> 'a maplet -> 'b t
    val singletonMapi : ('a maplet -> 'b) -> 'a maplet -> 'b t
    val singletonFoldMap : ('a -> 'b * 'c) -> 'a maplet -> 'b * 'c t
    val singletonFoldMapi : ('a maplet -> 'b * 'c) -> 'a maplet -> 'b * 'c t


    (* Properties *)

    val isEmpty : 'a t -> bool
    val size : 'a t -> int


    (* Operations *)

    val insert : ('a * 'a -> 'a) -> 'a maplet * 'a t -> 'a t
    val inserti : ('a maplet * 'a -> 'a) -> 'a maplet * 'a t -> 'a t
    val insertMap : ('a -> 'b) -> ('a * 'b -> 'b) -> 'a maplet * 'b t -> 'b t
    val insertMapi :
      ('a maplet -> 'b) -> ('a maplet * 'b -> 'b) -> 'a maplet * 'b t -> 'b t
    val insertFoldMap :
      ('a -> 'b * 'c) -> ('a * 'c -> 'b * 'c) -> 'a maplet * 'c t -> 'b * 'c t
    val insertFoldMapi :
      ('a maplet -> 'b * 'c)
       -> ('a maplet * 'c -> 'b * 'c) -> 'a maplet * 'c t -> 'b * 'c t

    val update : ('a -> 'a) -> key * 'a t -> 'a t

    val delete : key * 'a t -> 'a t

    val remove : ('a -> 'a option) -> key * 'a t -> 'a t
    val removei : ('a maplet -> 'a option) -> key * 'a t -> 'a t
    val removeMap : ('a * 'b -> 'b option) -> 'a maplet * 'b t -> 'b t
    val removeMapi : (('a * 'b) maplet -> 'b option) -> 'a maplet * 'b t -> 'b t
    val removeFoldMap :
      ('a -> 'b) -> ('a * 'c -> 'b * 'c option) -> 'a maplet * 'c t -> 'b * 'c t
    val removeFoldMapi :
      ('a maplet -> 'b)
       -> (('a * 'c) maplet -> 'b * 'c option) -> 'a maplet * 'c t -> 'b * 'c t

    val lookup : 'a t -> key -> 'a option

    val app : ('a -> unit) -> 'a t -> unit
    val appi : ('a maplet -> unit) -> 'a t -> unit

    val map : ('a -> 'b) -> 'a t -> 'b t
    val mapi : ('a maplet -> 'b) -> 'a t -> 'b t

    val mapPartial : ('a -> 'b option) -> 'a t -> 'b t
    val mapPartiali : ('a maplet -> 'b option) -> 'a t -> 'b t

    val filter : ('a -> bool) -> 'a t -> 'a t
    val filteri : ('a maplet -> bool) -> 'a t -> 'a t

    val fold : ('a * 'b -> 'b) -> 'a t * 'b -> 'b
    val foldi : ('a maplet * 'b -> 'b) -> 'a t * 'b -> 'b
    val foldR : ('a * 'b -> 'b) -> 'a t * 'b -> 'b
    val foldRi : ('a maplet * 'b -> 'b) -> 'a t * 'b -> 'b
    val foldL : ('b * 'a -> 'b) -> 'b * 'a t -> 'b
    val foldLi : ('b * 'a maplet -> 'b) -> 'b * 'a t -> 'b
  end
