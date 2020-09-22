signature GDK_EVENT_EXPOSE_RECORD =
  sig
    type expose
    type 'a event_union
    include
      RECORD
        where type t = expose event_union
  end
