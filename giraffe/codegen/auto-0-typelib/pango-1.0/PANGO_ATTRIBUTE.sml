signature PANGO_ATTRIBUTE =
  sig
    type record_t
    type t = record_t
    val equal :
      record_t
       -> record_t
       -> bool
  end
