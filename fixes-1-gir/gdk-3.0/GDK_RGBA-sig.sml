signature GDK_RGBA =
  sig
    type t
    val red :
      {
        get : t -> real,
        set :
          real
           -> t
           -> unit
      }
    val green :
      {
        get : t -> real,
        set :
          real
           -> t
           -> unit
      }
    val blue :
      {
        get : t -> real,
        set :
          real
           -> t
           -> unit
      }
    val alpha :
      {
        get : t -> real,
        set :
          real
           -> t
           -> unit
      }
    val getType : unit -> GObject.Type.t
    val new :
      {
        red : real,
        green : real,
        blue : real,
        alpha : real
      }
       -> t
    val copy : t -> t
    val equal :
      t
       -> t
       -> bool
    val hash : t -> LargeInt.int
    val parse :
      t
       -> string
       -> bool
    val toString : t -> string
  end
