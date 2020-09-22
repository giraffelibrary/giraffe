signature GDK_EVENT_D_N_D_RECORD =
  sig
    type dnd
    type 'a event_union
    include
      RECORD
        where type t = dnd event_union
  end
