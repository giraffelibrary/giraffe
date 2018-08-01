#include "cvector.h"
#include "cvectorvector.h"

#if GDK_CHECK_VERSION(2, 14, 0)
void
mlton_gdk_app_launch_context_set_icon_name (GdkAppLaunchContext* context,
                                            SML_CVECTOR_VAL(const char, icon_name))
{
  gdk_app_launch_context_set_icon_name (context,
                                        GET_SML_CVECTOR_VAL(const char, icon_name));
}
#endif

GdkAtom
mlton_gdk_atom_intern (SML_CVECTOR_VAL(const gchar, atom_name),
                       gboolean only_if_exists)
{
  return gdk_atom_intern (GET_SML_CVECTOR_VAL(const gchar, atom_name),
                          only_if_exists);
}

#if GDK_CHECK_VERSION(2, 10, 0)
GdkAtom
mlton_gdk_atom_intern_static_string (SML_CVECTOR_VAL(const gchar, atom_name))
{
  return gdk_atom_intern_static_string (GET_SML_CVECTOR_VAL(const gchar, atom_name));
}
#endif

gboolean
mlton_gdk_color_parse (SML_CVECTOR_VAL(const gchar, spec),
                       GdkColor* color)
{
  return gdk_color_parse (GET_SML_CVECTOR_VAL(const gchar, spec),
                          color);
}

#if GDK_CHECK_VERSION(2, 8, 0)
GdkCursor*
mlton_gdk_cursor_new_from_name (GdkDisplay* display,
                                SML_CVECTOR_VAL(const gchar, name))
{
  return gdk_cursor_new_from_name (display,
                                   GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GDK_CHECK_VERSION(2, 2, 0)
GdkDisplay*
mlton_gdk_display_open (SML_CVECTOR_VAL(const gchar, display_name))
{
  return gdk_display_open (GET_SML_CVECTOR_VAL(const gchar, display_name));
}
#endif

#if GDK_CHECK_VERSION(3, 0, 0)
void
mlton_gdk_display_notify_startup_complete (GdkDisplay* display,
                                           SML_CVECTOR_VAL(const gchar, startup_id))
{
  gdk_display_notify_startup_complete (display,
                                       GET_SML_CVECTOR_VAL(const gchar, startup_id));
}
#endif

#if GDK_CHECK_VERSION(2, 6, 0)
void
mlton_gdk_display_store_clipboard (GdkDisplay* display,
                                   GdkWindow* clipboard_window,
                                   guint32 time_,
                                   SML_CVECTOR_VAL(GdkAtom, targets),
                                   gint n_targets)
{
  gdk_display_store_clipboard (display,
                               clipboard_window,
                               time_,
                               GET_SML_CVECTOR_VAL(GdkAtom, targets),
                               n_targets);
}
#endif

#if GDK_CHECK_VERSION(3, 0, 0)
GdkDisplay*
mlton_gdk_display_manager_open_display (GdkDisplayManager* manager,
                                        SML_CVECTOR_VAL(const gchar, name))
{
  return gdk_display_manager_open_display (manager,
                                           GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

gboolean
mlton_gdk_keymap_get_entries_for_keycode (GdkKeymap* keymap,
                                          guint hardware_keycode,
                                          SML_CVECTOR_REF(GdkKeymapKey, keys),
                                          SML_CVECTOR_REF(guint, keyvals),
                                          gint* n_entries)
{
  return gdk_keymap_get_entries_for_keycode (keymap,
                                             hardware_keycode,
                                             GET_SML_CVECTOR_REF(GdkKeymapKey, keys),
                                             GET_SML_CVECTOR_REF(guint, keyvals),
                                             n_entries);
}

gboolean
mlton_gdk_keymap_get_entries_for_keyval (GdkKeymap* keymap,
                                         guint keyval,
                                         SML_CVECTOR_REF(GdkKeymapKey, keys),
                                         gint* n_keys)
{
  return gdk_keymap_get_entries_for_keyval (keymap,
                                            keyval,
                                            GET_SML_CVECTOR_REF(GdkKeymapKey, keys),
                                            n_keys);
}

#if GDK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gdk_rgba_parse (GdkRGBA* rgba,
                      SML_CVECTOR_VAL(const gchar, spec))
{
  return gdk_rgba_parse (rgba,
                         GET_SML_CVECTOR_VAL(const gchar, spec));
}
#endif

#if GDK_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gdk_screen_get_setting (GdkScreen* screen,
                              SML_CVECTOR_VAL(const gchar, name),
                              GValue* value)
{
  return gdk_screen_get_setting (screen,
                                 GET_SML_CVECTOR_VAL(const gchar, name),
                                 value);
}
#endif

void
mlton_gdk_window_set_icon_name (GdkWindow* window,
                                SML_CVECTOR_VAL(const gchar, name))
{
  gdk_window_set_icon_name (window,
                            GET_SML_CVECTOR_VAL(const gchar, name));
}

void
mlton_gdk_window_set_role (GdkWindow* window,
                           SML_CVECTOR_VAL(const gchar, role))
{
  gdk_window_set_role (window,
                       GET_SML_CVECTOR_VAL(const gchar, role));
}

#if GDK_CHECK_VERSION(2, 12, 0)
void
mlton_gdk_window_set_startup_id (GdkWindow* window,
                                 SML_CVECTOR_VAL(const gchar, startup_id))
{
  gdk_window_set_startup_id (window,
                             GET_SML_CVECTOR_VAL(const gchar, startup_id));
}
#endif

void
mlton_gdk_window_set_title (GdkWindow* window,
                            SML_CVECTOR_VAL(const gchar, title))
{
  gdk_window_set_title (window,
                        GET_SML_CVECTOR_VAL(const gchar, title));
}

void
mlton_gdk_init (gint* argc,
                SML_CVECTORVECTOR_REF(gchar, argv))
{
  gdk_init (argc,
            GET_SML_CVECTORVECTOR_REF(gchar, argv));
}

gboolean
mlton_gdk_init_check (gint* argc,
                      SML_CVECTORVECTOR_REF(gchar, argv))
{
  return gdk_init_check (argc,
                         GET_SML_CVECTORVECTOR_REF(gchar, argv));
}

guint
mlton_gdk_keyval_from_name (SML_CVECTOR_VAL(const gchar, keyval_name))
{
  return gdk_keyval_from_name (GET_SML_CVECTOR_VAL(const gchar, keyval_name));
}

#if GDK_CHECK_VERSION(2, 12, 0)
void
mlton_gdk_notify_startup_complete_with_id (SML_CVECTOR_VAL(const gchar, startup_id))
{
  gdk_notify_startup_complete_with_id (GET_SML_CVECTOR_VAL(const gchar, startup_id));
}
#endif

#if GDK_CHECK_VERSION(2, 2, 0)
void
mlton_gdk_parse_args (gint* argc,
                      SML_CVECTORVECTOR_REF(gchar, argv))
{
  gdk_parse_args (argc,
                  GET_SML_CVECTORVECTOR_REF(gchar, argv));
}
#endif

gboolean
mlton_gdk_property_get (GdkWindow* window,
                        GdkAtom property,
                        GdkAtom type,
                        gulong offset,
                        gulong length,
                        gint pdelete,
                        GdkAtom* actual_property_type,
                        gint* actual_format,
                        gint* actual_length,
                        SML_CVECTOR_REF(guchar, data))
{
  return gdk_property_get (window,
                           property,
                           type,
                           offset,
                           length,
                           pdelete,
                           actual_property_type,
                           actual_format,
                           actual_length,
                           GET_SML_CVECTOR_REF(guchar, data));
}

void
mlton_gdk_query_depths (SML_CVECTOR_REF(gint, depths),
                        gint* count)
{
  gdk_query_depths (GET_SML_CVECTOR_REF(gint, depths),
                    count);
}

void
mlton_gdk_query_visual_types (SML_CVECTOR_REF(GdkVisualType, visual_types),
                              gint* count)
{
  gdk_query_visual_types (GET_SML_CVECTOR_REF(GdkVisualType, visual_types),
                          count);
}

#if GDK_CHECK_VERSION(3, 10, 0)
void
mlton_gdk_set_allowed_backends (SML_CVECTOR_VAL(const gchar, backends))
{
  gdk_set_allowed_backends (GET_SML_CVECTOR_VAL(const gchar, backends));
}
#endif

void
mlton_gdk_set_program_class (SML_CVECTOR_VAL(const gchar, program_class))
{
  gdk_set_program_class (GET_SML_CVECTOR_VAL(const gchar, program_class));
}

gboolean
mlton_gdk_setting_get (SML_CVECTOR_VAL(const gchar, name),
                       GValue* value)
{
  return gdk_setting_get (GET_SML_CVECTOR_VAL(const gchar, name),
                          value);
}

#if GDK_CHECK_VERSION(2, 2, 0)
gint
mlton_gdk_text_property_to_utf8_list_for_display (GdkDisplay* display,
                                                  GdkAtom encoding,
                                                  gint format,
                                                  SML_CVECTOR_VAL(guchar, text),
                                                  gint length,
                                                  SML_CVECTORVECTOR_REF(gchar, list))
{
  return gdk_text_property_to_utf8_list_for_display (display,
                                                     encoding,
                                                     format,
                                                     GET_SML_CVECTOR_VAL(guchar, text),
                                                     length,
                                                     GET_SML_CVECTORVECTOR_REF(gchar, list));
}
#endif

gchar*
mlton_gdk_utf8_to_string_target (SML_CVECTOR_VAL(const gchar, str))
{
  return gdk_utf8_to_string_target (GET_SML_CVECTOR_VAL(const gchar, str));
}
