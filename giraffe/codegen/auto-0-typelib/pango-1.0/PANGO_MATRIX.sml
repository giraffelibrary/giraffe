signature PANGO_MATRIX =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val concat :
      record_t
       -> record_t
       -> unit
    val copy : record_t -> record_t
    val getFontScaleFactor : record_t -> real
    val rotate :
      record_t
       -> real
       -> unit
    val scale :
      record_t
       -> real
       -> real
       -> unit
    val transformDistance :
      record_t
       -> real
       -> real
       -> real * real
    val transformPoint :
      record_t
       -> real
       -> real
       -> real * real
    val translate :
      record_t
       -> real
       -> real
       -> unit
  end
