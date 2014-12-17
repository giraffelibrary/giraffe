structure GtkRecentFilterInfo :>
  GTK_RECENT_FILTER_INFO
    where type record_t = GtkRecentFilterInfoRecord.t =
  struct
    type record_t = GtkRecentFilterInfoRecord.t
    type t = record_t
  end
