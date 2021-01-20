(**
 * GIRepository override
 *)

GIRepository.Override.callableInfoMayReturnNull := [
  (* https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1418 *)
  (("Gio", SOME "InetAddress", "new_from_string"), true),
  (("Gio", SOME "InetSocketAddress", "new_from_string"), true),

  (("Gtk", SOME "FileChooser", "get_filename"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder"), true),
  (("Gtk", SOME "FileChooser", "get_uri"), true),
  (("Gtk", SOME "FileChooser", "get_current_folder_uri"), true),
  (("Gtk", SOME "FileChooser", "get_preview_widget"), true),
  (("Gtk", SOME "FileChooser", "get_preview_filename"), true),
  (("Gtk", SOME "FileChooser", "get_preview_uri"), true),
  (("Gtk", SOME "FileChooser", "get_extra_widget"), true),
  (("Gtk", SOME "FileChooser", "get_filter"), true),
  (("Gtk", SOME "FileChooser", "get_preview_file"), true),
  (("Gtk", SOME "Paned", "get_child1"), true),
  (("Gtk", SOME "Paned", "get_child2"), true),
  (("Gtk", SOME "Container", "get_focus_child"), true)
];

GIRepository.Override.argInfoMayBeNull := [
  (("GLib", SOME "Source", "attach", "context"), true),
  (("Gtk", SOME "Container", "set-focus-child", "object"), true)
];

let
  open GIRepository.Direction
in
  GIRepository.Override.argInfoDirection := [
    (* bug 783392 *)
    (("Gio", SOME "DBusInterfaceInfo", "generate_xml", "string_builder"), IN),
    (("Gio", SOME "DBusNodeInfo", "generate_xml", "string_builder"), IN),

    (* https://gitlab.gnome.org/GNOME/glib/-/issues/1258 *)
    (("Gio", SOME "InputStream", "read", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_async", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_all", "buffer"), OUT),
    (("Gio", SOME "InputStream", "read_all_async", "buffer"), OUT),

    (* https://gitlab.gnome.org/GNOME/glib/-/issues/2176 *)
    (("Gio", SOME "Socket", "receive", "buffer"), OUT),
    (("Gio", SOME "Socket", "receive_from", "buffer"), OUT),
    (("Gio", SOME "Socket", "receive_with_blocking", "buffer"), OUT),

    (* bug 770421 *)
    (("Gtk", SOME "TextIter", "get_attributes", "values"), IN)
  ]
end;

GIRepository.Override.argInfoCallerAllocates := [
  (* https://gitlab.gnome.org/GNOME/glib/-/issues/1258 *)
  (("Gio", SOME "InputStream", "read", "buffer"), true),
  (("Gio", SOME "InputStream", "read_async", "buffer"), true),
  (("Gio", SOME "InputStream", "read_all", "buffer"), true),
  (("Gio", SOME "InputStream", "read_all_async", "buffer"), true),

  (* https://gitlab.gnome.org/GNOME/glib/-/issues/2176 *)
  (("Gio", SOME "Socket", "receive", "buffer"), true),
  (("Gio", SOME "Socket", "receive_from", "buffer"), true),
  (("Gio", SOME "Socket", "receive_with_blocking", "buffer"), true)
];

let
  open GIRepository.Transfer
in
  GIRepository.Override.callableInfoCallerOwns := [
    (("Vte", SOME "Terminal", "new"), NOTHING)
  ]
end;
