structure GdkWindowAttr :>
  GDK_WINDOW_ATTR
    where type record_t = GdkWindowAttrRecord.t =
  struct
    type record_t = GdkWindowAttrRecord.t
    type t = record_t
  end
