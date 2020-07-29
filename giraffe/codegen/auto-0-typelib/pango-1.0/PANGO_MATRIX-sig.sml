signature PANGO_MATRIX =
  sig
    type t
    type rectangle_t
    val getType : unit -> GObject.Type.t
    val concat :
      t
       -> t
       -> unit
    val copy : t -> t option
    val getFontScaleFactor : t -> real
    val getFontScaleFactors : t -> real * real
    val rotate :
      t
       -> real
       -> unit
    val scale :
      t
       -> real * real
       -> unit
    val transformDistance :
      t
       -> real * real
       -> real * real
    val transformPixelRectangle :
      t
       -> rectangle_t
       -> rectangle_t
    val transformPoint :
      t
       -> real * real
       -> real * real
    val transformRectangle :
      t
       -> rectangle_t
       -> rectangle_t
    val translate :
      t
       -> real * real
       -> unit
  end
