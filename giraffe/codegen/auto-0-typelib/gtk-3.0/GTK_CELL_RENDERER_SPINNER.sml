signature GTK_CELL_RENDERER_SPINNER =
  sig
    type 'a class
    type icon_size_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val activeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val pulseProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val sizeProp :
      {
        get : 'a class -> icon_size_t,
        set :
          icon_size_t
           -> 'a class
           -> unit,
        new : icon_size_t -> 'a class Property.t
      }
  end
