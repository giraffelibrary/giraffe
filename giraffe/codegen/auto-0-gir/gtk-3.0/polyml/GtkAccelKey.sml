structure GtkAccelKey :>
  GTK_ACCEL_KEY
    where type record_t = GtkAccelKeyRecord.t =
  struct
    type record_t = GtkAccelKeyRecord.t
    type t = record_t
  end
