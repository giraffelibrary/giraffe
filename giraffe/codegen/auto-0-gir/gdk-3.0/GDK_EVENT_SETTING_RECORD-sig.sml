signature GDK_EVENT_SETTING_RECORD =
  sig
    type setting
    type 'a event_union
    include
      RECORD
        where type t = setting event_union
  end
