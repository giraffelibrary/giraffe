signature PANGO_MATRIX =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val concat :
      t
       -> t
       -> unit
    val copy : t -> t
    val getFontScaleFactor : t -> real
    val rotate :
      t
       -> real
       -> unit
    val scale :
      t
       -> real
       -> real
       -> unit
    val transformDistance :
      t
       -> real
       -> real
       -> real * real
    val transformPoint :
      t
       -> real
       -> real
       -> real * real
    val translate :
      t
       -> real
       -> real
       -> unit
  end
