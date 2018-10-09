signature GDK_RECTANGLE =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val equal :
      t
       -> t
       -> bool
    val intersect :
      t
       -> t
       -> t option
    val union :
      t
       -> t
       -> t
  end
