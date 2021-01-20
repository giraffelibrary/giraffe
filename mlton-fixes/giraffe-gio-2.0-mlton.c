#include "cvector.h"
#include "cvectorvector.h"

#if GLIB_CHECK_VERSION(2, 38, 0)
gboolean
mlton_g_action_name_is_valid (SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_name_is_valid (GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 38, 0)
gboolean
mlton_g_action_parse_detailed_name (SML_CVECTOR_VAL(const gchar, detailed_name),
                                    SML_CVECTOR_REF(gchar, action_name),
                                    GVariant** target_value,
                                    GError** error)
{
  return g_action_parse_detailed_name (GET_SML_CVECTOR_VAL(const gchar, detailed_name),
                                       GET_SML_CVECTOR_REF(gchar, action_name),
                                       target_value,
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 38, 0)
gchar*
mlton_g_action_print_detailed_name (SML_CVECTOR_VAL(const gchar, action_name),
                                    GVariant* target_value)
{
  return g_action_print_detailed_name (GET_SML_CVECTOR_VAL(const gchar, action_name),
                                       target_value);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_action_added (GActionGroup* action_group,
                                   SML_CVECTOR_VAL(const gchar, action_name))
{
  g_action_group_action_added (action_group,
                               GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_action_enabled_changed (GActionGroup* action_group,
                                             SML_CVECTOR_VAL(const gchar, action_name),
                                             gboolean enabled)
{
  g_action_group_action_enabled_changed (action_group,
                                         GET_SML_CVECTOR_VAL(const gchar, action_name),
                                         enabled);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_action_removed (GActionGroup* action_group,
                                     SML_CVECTOR_VAL(const gchar, action_name))
{
  g_action_group_action_removed (action_group,
                                 GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_action_state_changed (GActionGroup* action_group,
                                           SML_CVECTOR_VAL(const gchar, action_name),
                                           GVariant* state)
{
  g_action_group_action_state_changed (action_group,
                                       GET_SML_CVECTOR_VAL(const gchar, action_name),
                                       state);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_activate_action (GActionGroup* action_group,
                                      SML_CVECTOR_VAL(const gchar, action_name),
                                      GVariant* parameter)
{
  g_action_group_activate_action (action_group,
                                  GET_SML_CVECTOR_VAL(const gchar, action_name),
                                  parameter);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_action_group_change_action_state (GActionGroup* action_group,
                                          SML_CVECTOR_VAL(const gchar, action_name),
                                          GVariant* value)
{
  g_action_group_change_action_state (action_group,
                                      GET_SML_CVECTOR_VAL(const gchar, action_name),
                                      value);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
gboolean
mlton_g_action_group_get_action_enabled (GActionGroup* action_group,
                                         SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_get_action_enabled (action_group,
                                            GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
const GVariantType*
mlton_g_action_group_get_action_parameter_type (GActionGroup* action_group,
                                                SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_get_action_parameter_type (action_group,
                                                   GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GVariant*
mlton_g_action_group_get_action_state (GActionGroup* action_group,
                                       SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_get_action_state (action_group,
                                          GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GVariant*
mlton_g_action_group_get_action_state_hint (GActionGroup* action_group,
                                            SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_get_action_state_hint (action_group,
                                               GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
const GVariantType*
mlton_g_action_group_get_action_state_type (GActionGroup* action_group,
                                            SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_get_action_state_type (action_group,
                                               GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
gboolean
mlton_g_action_group_has_action (GActionGroup* action_group,
                                 SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_group_has_action (action_group,
                                    GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_action_group_query_action (GActionGroup* action_group,
                                   SML_CVECTOR_VAL(const gchar, action_name),
                                   gboolean* enabled,
                                   const GVariantType** parameter_type,
                                   const GVariantType** state_type,
                                   GVariant** state_hint,
                                   GVariant** state)
{
  return g_action_group_query_action (action_group,
                                      GET_SML_CVECTOR_VAL(const gchar, action_name),
                                      enabled,
                                      parameter_type,
                                      state_type,
                                      state_hint,
                                      state);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_action_map_add_action_entries (GActionMap* action_map,
                                       SML_CVECTOR_VAL(GActionEntry, entries),
                                       gint n_entries,
                                       gpointer user_data)
{
  g_action_map_add_action_entries (action_map,
                                   GET_SML_CVECTOR_VAL(GActionEntry, entries),
                                   n_entries,
                                   user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GAction*
mlton_g_action_map_lookup_action (GActionMap* action_map,
                                  SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_action_map_lookup_action (action_map,
                                     GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_action_map_remove_action (GActionMap* action_map,
                                  SML_CVECTOR_VAL(const gchar, action_name))
{
  g_action_map_remove_action (action_map,
                              GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

GAppInfo*
mlton_g_app_info_create_from_commandline (SML_CVECTOR_VAL(const char, commandline),
                                          SML_CVECTOR_VAL(const char, application_name),
                                          GAppInfoCreateFlags flags,
                                          GError** error)
{
  return g_app_info_create_from_commandline (GET_SML_CVECTOR_VAL(const char, commandline),
                                             GET_SML_CVECTOR_VAL(const char, application_name),
                                             flags,
                                             error);
}

GList*
mlton_g_app_info_get_all_for_type (SML_CVECTOR_VAL(const char, content_type))
{
  return g_app_info_get_all_for_type (GET_SML_CVECTOR_VAL(const char, content_type));
}

GAppInfo*
mlton_g_app_info_get_default_for_type (SML_CVECTOR_VAL(const char, content_type),
                                       gboolean must_support_uris)
{
  return g_app_info_get_default_for_type (GET_SML_CVECTOR_VAL(const char, content_type),
                                          must_support_uris);
}

GAppInfo*
mlton_g_app_info_get_default_for_uri_scheme (SML_CVECTOR_VAL(const char, uri_scheme))
{
  return g_app_info_get_default_for_uri_scheme (GET_SML_CVECTOR_VAL(const char, uri_scheme));
}

#if GLIB_CHECK_VERSION(2, 28, 0)
GList*
mlton_g_app_info_get_fallback_for_type (SML_CVECTOR_VAL(const gchar, content_type))
{
  return g_app_info_get_fallback_for_type (GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GList*
mlton_g_app_info_get_recommended_for_type (SML_CVECTOR_VAL(const gchar, content_type))
{
  return g_app_info_get_recommended_for_type (GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

gboolean
mlton_g_app_info_launch_default_for_uri (SML_CVECTOR_VAL(const char, uri),
                                         GAppLaunchContext* launch_context,
                                         GError** error)
{
  return g_app_info_launch_default_for_uri (GET_SML_CVECTOR_VAL(const char, uri),
                                            launch_context,
                                            error);
}

#if GLIB_CHECK_VERSION(2, 50, 0)
void
mlton_g_app_info_launch_default_for_uri_async (SML_CVECTOR_VAL(const char, uri),
                                               GAppLaunchContext* launch_context,
                                               GCancellable* cancellable,
                                               GAsyncReadyCallback callback,
                                               gpointer user_data)
{
  g_app_info_launch_default_for_uri_async (GET_SML_CVECTOR_VAL(const char, uri),
                                           launch_context,
                                           cancellable,
                                           callback,
                                           user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 20, 0)
void
mlton_g_app_info_reset_type_associations (SML_CVECTOR_VAL(const char, content_type))
{
  g_app_info_reset_type_associations (GET_SML_CVECTOR_VAL(const char, content_type));
}
#endif

gboolean
mlton_g_app_info_add_supports_type (GAppInfo* appinfo,
                                    SML_CVECTOR_VAL(const char, content_type),
                                    GError** error)
{
  return g_app_info_add_supports_type (appinfo,
                                       GET_SML_CVECTOR_VAL(const char, content_type),
                                       error);
}

gboolean
mlton_g_app_info_remove_supports_type (GAppInfo* appinfo,
                                       SML_CVECTOR_VAL(const char, content_type),
                                       GError** error)
{
  return g_app_info_remove_supports_type (appinfo,
                                          GET_SML_CVECTOR_VAL(const char, content_type),
                                          error);
}

gboolean
mlton_g_app_info_set_as_default_for_extension (GAppInfo* appinfo,
                                               SML_CVECTOR_VAL(char, extension),
                                               GError** error)
{
  return g_app_info_set_as_default_for_extension (appinfo,
                                                  GET_SML_CVECTOR_VAL(char, extension),
                                                  error);
}

gboolean
mlton_g_app_info_set_as_default_for_type (GAppInfo* appinfo,
                                          SML_CVECTOR_VAL(const char, content_type),
                                          GError** error)
{
  return g_app_info_set_as_default_for_type (appinfo,
                                             GET_SML_CVECTOR_VAL(const char, content_type),
                                             error);
}

gboolean
mlton_g_app_info_set_as_last_used_for_type (GAppInfo* appinfo,
                                            SML_CVECTOR_VAL(const char, content_type),
                                            GError** error)
{
  return g_app_info_set_as_last_used_for_type (appinfo,
                                               GET_SML_CVECTOR_VAL(const char, content_type),
                                               error);
}

void
mlton_g_app_launch_context_launch_failed (GAppLaunchContext* context,
                                          SML_CVECTOR_VAL(const char, startup_notify_id))
{
  g_app_launch_context_launch_failed (context,
                                      GET_SML_CVECTOR_VAL(const char, startup_notify_id));
}

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_app_launch_context_setenv (GAppLaunchContext* context,
                                   SML_CVECTOR_VAL(const char, variable),
                                   SML_CVECTOR_VAL(const char, value))
{
  g_app_launch_context_setenv (context,
                               GET_SML_CVECTOR_VAL(const char, variable),
                               GET_SML_CVECTOR_VAL(const char, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_app_launch_context_unsetenv (GAppLaunchContext* context,
                                     SML_CVECTOR_VAL(const char, variable))
{
  g_app_launch_context_unsetenv (context,
                                 GET_SML_CVECTOR_VAL(const char, variable));
}
#endif

GApplication*
mlton_g_application_new (SML_CVECTOR_VAL(const gchar, application_id),
                         GApplicationFlags flags)
{
  return g_application_new (GET_SML_CVECTOR_VAL(const gchar, application_id),
                            flags);
}

gboolean
mlton_g_application_id_is_valid (SML_CVECTOR_VAL(const gchar, application_id))
{
  return g_application_id_is_valid (GET_SML_CVECTOR_VAL(const gchar, application_id));
}

#if GLIB_CHECK_VERSION(2, 42, 0)
void
mlton_g_application_add_main_option (GApplication* application,
                                     SML_CVECTOR_VAL(const char, long_name),
                                     char short_name,
                                     GOptionFlags flags,
                                     GOptionArg arg,
                                     SML_CVECTOR_VAL(const char, description),
                                     SML_CVECTOR_VAL(const char, arg_description))
{
  g_application_add_main_option (application,
                                 GET_SML_CVECTOR_VAL(const char, long_name),
                                 short_name,
                                 flags,
                                 arg,
                                 GET_SML_CVECTOR_VAL(const char, description),
                                 GET_SML_CVECTOR_VAL(const char, arg_description));
}
#endif

#if GLIB_CHECK_VERSION(2, 44, 0)
void
mlton_g_application_bind_busy_property (GApplication* application,
                                        gpointer object,
                                        SML_CVECTOR_VAL(const gchar, property))
{
  g_application_bind_busy_property (application,
                                    object,
                                    GET_SML_CVECTOR_VAL(const gchar, property));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_application_open (GApplication* application,
                          SML_CVECTOR_VAL(GFile*, files),
                          gint n_files,
                          SML_CVECTOR_VAL(const gchar, hint))
{
  g_application_open (application,
                      GET_SML_CVECTOR_VAL(GFile*, files),
                      n_files,
                      GET_SML_CVECTOR_VAL(const gchar, hint));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
int
mlton_g_application_run (GApplication* application,
                         int argc,
                         SML_CVECTORVECTOR_VAL(char, argv))
{
  return g_application_run (application,
                            argc,
                            GET_SML_CVECTORVECTOR_VAL(char, argv));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_application_send_notification (GApplication* application,
                                       SML_CVECTOR_VAL(const gchar, id),
                                       GNotification* notification)
{
  g_application_send_notification (application,
                                   GET_SML_CVECTOR_VAL(const gchar, id),
                                   notification);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_application_set_application_id (GApplication* application,
                                        SML_CVECTOR_VAL(const gchar, application_id))
{
  g_application_set_application_id (application,
                                    GET_SML_CVECTOR_VAL(const gchar, application_id));
}
#endif

#if GLIB_CHECK_VERSION(2, 42, 0)
void
mlton_g_application_set_resource_base_path (GApplication* application,
                                            SML_CVECTOR_VAL(const gchar, resource_path))
{
  g_application_set_resource_base_path (application,
                                        GET_SML_CVECTOR_VAL(const gchar, resource_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 44, 0)
void
mlton_g_application_unbind_busy_property (GApplication* application,
                                          gpointer object,
                                          SML_CVECTOR_VAL(const gchar, property))
{
  g_application_unbind_busy_property (application,
                                      object,
                                      GET_SML_CVECTOR_VAL(const gchar, property));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_application_withdraw_notification (GApplication* application,
                                           SML_CVECTOR_VAL(const gchar, id))
{
  g_application_withdraw_notification (application,
                                       GET_SML_CVECTOR_VAL(const gchar, id));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
GFile*
mlton_g_application_command_line_create_file_for_arg (GApplicationCommandLine* cmdline,
                                                      SML_CVECTOR_VAL(const gchar, arg))
{
  return g_application_command_line_create_file_for_arg (cmdline,
                                                         GET_SML_CVECTOR_VAL(const gchar, arg));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
const gchar*
mlton_g_application_command_line_getenv (GApplicationCommandLine* cmdline,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  return g_application_command_line_getenv (cmdline,
                                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

gsize
mlton_g_buffered_input_stream_peek (GBufferedInputStream* stream,
                                    SML_CVECTOR_VAL(void, buffer),
                                    gsize offset,
                                    gsize count)
{
  return g_buffered_input_stream_peek (stream,
                                       GET_SML_CVECTOR_VAL(void, buffer),
                                       offset,
                                       count);
}

#if GLIB_CHECK_VERSION(2, 24, 0)
GCharsetConverter*
mlton_g_charset_converter_new (SML_CVECTOR_VAL(const gchar, to_charset),
                               SML_CVECTOR_VAL(const gchar, from_charset),
                               GError** error)
{
  return g_charset_converter_new (GET_SML_CVECTOR_VAL(const gchar, to_charset),
                                  GET_SML_CVECTOR_VAL(const gchar, from_charset),
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GConverterResult
mlton_g_converter_convert (GConverter* converter,
                           SML_CVECTOR_VAL(void, inbuf),
                           gsize inbuf_size,
                           SML_CVECTOR_VAL(void, outbuf),
                           gsize outbuf_size,
                           GConverterFlags flags,
                           gsize* bytes_read,
                           gsize* bytes_written,
                           GError** error)
{
  return g_converter_convert (converter,
                              GET_SML_CVECTOR_VAL(void, inbuf),
                              inbuf_size,
                              GET_SML_CVECTOR_VAL(void, outbuf),
                              outbuf_size,
                              flags,
                              bytes_read,
                              bytes_written,
                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GDBusActionGroup*
mlton_g_dbus_action_group_get (GDBusConnection* connection,
                               SML_CVECTOR_VAL(const gchar, bus_name),
                               SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_action_group_get (connection,
                                  GET_SML_CVECTOR_VAL(const gchar, bus_name),
                                  GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
const gchar*
mlton_g_dbus_annotation_info_lookup (SML_CVECTOR_VAL(GDBusAnnotationInfo*, annotations),
                                     SML_CVECTOR_VAL(const gchar, name))
{
  return g_dbus_annotation_info_lookup (GET_SML_CVECTOR_VAL(GDBusAnnotationInfo*, annotations),
                                        GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
gboolean
mlton_g_dbus_auth_observer_allow_mechanism (GDBusAuthObserver* observer,
                                            SML_CVECTOR_VAL(const gchar, mechanism))
{
  return g_dbus_auth_observer_allow_mechanism (observer,
                                               GET_SML_CVECTOR_VAL(const gchar, mechanism));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusConnection*
mlton_g_dbus_connection_new_for_address_sync (SML_CVECTOR_VAL(const gchar, address),
                                              GDBusConnectionFlags flags,
                                              GDBusAuthObserver* observer,
                                              GCancellable* cancellable,
                                              GError** error)
{
  return g_dbus_connection_new_for_address_sync (GET_SML_CVECTOR_VAL(const gchar, address),
                                                 flags,
                                                 observer,
                                                 cancellable,
                                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusConnection*
mlton_g_dbus_connection_new_sync (GIOStream* stream,
                                  SML_CVECTOR_VAL(const gchar, guid),
                                  GDBusConnectionFlags flags,
                                  GDBusAuthObserver* observer,
                                  GCancellable* cancellable,
                                  GError** error)
{
  return g_dbus_connection_new_sync (stream,
                                     GET_SML_CVECTOR_VAL(const gchar, guid),
                                     flags,
                                     observer,
                                     cancellable,
                                     error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_connection_new (GIOStream* stream,
                             SML_CVECTOR_VAL(const gchar, guid),
                             GDBusConnectionFlags flags,
                             GDBusAuthObserver* observer,
                             GCancellable* cancellable,
                             GAsyncReadyCallback callback,
                             gpointer user_data)
{
  g_dbus_connection_new (stream,
                         GET_SML_CVECTOR_VAL(const gchar, guid),
                         flags,
                         observer,
                         cancellable,
                         callback,
                         user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_connection_new_for_address (SML_CVECTOR_VAL(const gchar, address),
                                         GDBusConnectionFlags flags,
                                         GDBusAuthObserver* observer,
                                         GCancellable* cancellable,
                                         GAsyncReadyCallback callback,
                                         gpointer user_data)
{
  g_dbus_connection_new_for_address (GET_SML_CVECTOR_VAL(const gchar, address),
                                     flags,
                                     observer,
                                     cancellable,
                                     callback,
                                     user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_connection_call (GDBusConnection* connection,
                              SML_CVECTOR_VAL(const gchar, bus_name),
                              SML_CVECTOR_VAL(const gchar, object_path),
                              SML_CVECTOR_VAL(const gchar, interface_name),
                              SML_CVECTOR_VAL(const gchar, method_name),
                              GVariant* parameters,
                              const GVariantType* reply_type,
                              GDBusCallFlags flags,
                              gint timeout_msec,
                              GCancellable* cancellable,
                              GAsyncReadyCallback callback,
                              gpointer user_data)
{
  g_dbus_connection_call (connection,
                          GET_SML_CVECTOR_VAL(const gchar, bus_name),
                          GET_SML_CVECTOR_VAL(const gchar, object_path),
                          GET_SML_CVECTOR_VAL(const gchar, interface_name),
                          GET_SML_CVECTOR_VAL(const gchar, method_name),
                          parameters,
                          reply_type,
                          flags,
                          timeout_msec,
                          cancellable,
                          callback,
                          user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_dbus_connection_call_sync (GDBusConnection* connection,
                                   SML_CVECTOR_VAL(const gchar, bus_name),
                                   SML_CVECTOR_VAL(const gchar, object_path),
                                   SML_CVECTOR_VAL(const gchar, interface_name),
                                   SML_CVECTOR_VAL(const gchar, method_name),
                                   GVariant* parameters,
                                   const GVariantType* reply_type,
                                   GDBusCallFlags flags,
                                   gint timeout_msec,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_dbus_connection_call_sync (connection,
                                      GET_SML_CVECTOR_VAL(const gchar, bus_name),
                                      GET_SML_CVECTOR_VAL(const gchar, object_path),
                                      GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                      GET_SML_CVECTOR_VAL(const gchar, method_name),
                                      parameters,
                                      reply_type,
                                      flags,
                                      timeout_msec,
                                      cancellable,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_connection_call_with_unix_fd_list (GDBusConnection* connection,
                                                SML_CVECTOR_VAL(const gchar, bus_name),
                                                SML_CVECTOR_VAL(const gchar, object_path),
                                                SML_CVECTOR_VAL(const gchar, interface_name),
                                                SML_CVECTOR_VAL(const gchar, method_name),
                                                GVariant* parameters,
                                                const GVariantType* reply_type,
                                                GDBusCallFlags flags,
                                                gint timeout_msec,
                                                GUnixFDList* fd_list,
                                                GCancellable* cancellable,
                                                GAsyncReadyCallback callback,
                                                gpointer user_data)
{
  g_dbus_connection_call_with_unix_fd_list (connection,
                                            GET_SML_CVECTOR_VAL(const gchar, bus_name),
                                            GET_SML_CVECTOR_VAL(const gchar, object_path),
                                            GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                            GET_SML_CVECTOR_VAL(const gchar, method_name),
                                            parameters,
                                            reply_type,
                                            flags,
                                            timeout_msec,
                                            fd_list,
                                            cancellable,
                                            callback,
                                            user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GVariant*
mlton_g_dbus_connection_call_with_unix_fd_list_sync (GDBusConnection* connection,
                                                     SML_CVECTOR_VAL(const gchar, bus_name),
                                                     SML_CVECTOR_VAL(const gchar, object_path),
                                                     SML_CVECTOR_VAL(const gchar, interface_name),
                                                     SML_CVECTOR_VAL(const gchar, method_name),
                                                     GVariant* parameters,
                                                     const GVariantType* reply_type,
                                                     GDBusCallFlags flags,
                                                     gint timeout_msec,
                                                     GUnixFDList* fd_list,
                                                     GUnixFDList** out_fd_list,
                                                     GCancellable* cancellable,
                                                     GError** error)
{
  return g_dbus_connection_call_with_unix_fd_list_sync (connection,
                                                        GET_SML_CVECTOR_VAL(const gchar, bus_name),
                                                        GET_SML_CVECTOR_VAL(const gchar, object_path),
                                                        GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                                        GET_SML_CVECTOR_VAL(const gchar, method_name),
                                                        parameters,
                                                        reply_type,
                                                        flags,
                                                        timeout_msec,
                                                        fd_list,
                                                        out_fd_list,
                                                        cancellable,
                                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_connection_emit_signal (GDBusConnection* connection,
                                     SML_CVECTOR_VAL(const gchar, destination_bus_name),
                                     SML_CVECTOR_VAL(const gchar, object_path),
                                     SML_CVECTOR_VAL(const gchar, interface_name),
                                     SML_CVECTOR_VAL(const gchar, signal_name),
                                     GVariant* parameters,
                                     GError** error)
{
  return g_dbus_connection_emit_signal (connection,
                                        GET_SML_CVECTOR_VAL(const gchar, destination_bus_name),
                                        GET_SML_CVECTOR_VAL(const gchar, object_path),
                                        GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                        GET_SML_CVECTOR_VAL(const gchar, signal_name),
                                        parameters,
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
guint
mlton_g_dbus_connection_export_action_group (GDBusConnection* connection,
                                             SML_CVECTOR_VAL(const gchar, object_path),
                                             GActionGroup* action_group,
                                             GError** error)
{
  return g_dbus_connection_export_action_group (connection,
                                                GET_SML_CVECTOR_VAL(const gchar, object_path),
                                                action_group,
                                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
guint
mlton_g_dbus_connection_export_menu_model (GDBusConnection* connection,
                                           SML_CVECTOR_VAL(const gchar, object_path),
                                           GMenuModel* menu,
                                           GError** error)
{
  return g_dbus_connection_export_menu_model (connection,
                                              GET_SML_CVECTOR_VAL(const gchar, object_path),
                                              menu,
                                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 46, 0)
guint
mlton_g_dbus_connection_register_object_with_closures (GDBusConnection* connection,
                                                       SML_CVECTOR_VAL(const gchar, object_path),
                                                       GDBusInterfaceInfo* interface_info,
                                                       GClosure* method_call_closure,
                                                       GClosure* get_property_closure,
                                                       GClosure* set_property_closure,
                                                       GError** error)
{
  return g_dbus_connection_register_object_with_closures (connection,
                                                          GET_SML_CVECTOR_VAL(const gchar, object_path),
                                                          interface_info,
                                                          method_call_closure,
                                                          get_property_closure,
                                                          set_property_closure,
                                                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_dbus_connection_register_subtree (GDBusConnection* connection,
                                          SML_CVECTOR_VAL(const gchar, object_path),
                                          const GDBusSubtreeVTable* vtable,
                                          GDBusSubtreeFlags flags,
                                          gpointer user_data,
                                          GDestroyNotify user_data_free_func,
                                          GError** error)
{
  return g_dbus_connection_register_subtree (connection,
                                             GET_SML_CVECTOR_VAL(const gchar, object_path),
                                             vtable,
                                             flags,
                                             user_data,
                                             user_data_free_func,
                                             error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_dbus_connection_signal_subscribe (GDBusConnection* connection,
                                          SML_CVECTOR_VAL(const gchar, sender),
                                          SML_CVECTOR_VAL(const gchar, interface_name),
                                          SML_CVECTOR_VAL(const gchar, member),
                                          SML_CVECTOR_VAL(const gchar, object_path),
                                          SML_CVECTOR_VAL(const gchar, arg0),
                                          GDBusSignalFlags flags,
                                          GDBusSignalCallback callback,
                                          gpointer user_data,
                                          GDestroyNotify user_data_free_func)
{
  return g_dbus_connection_signal_subscribe (connection,
                                             GET_SML_CVECTOR_VAL(const gchar, sender),
                                             GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                             GET_SML_CVECTOR_VAL(const gchar, member),
                                             GET_SML_CVECTOR_VAL(const gchar, object_path),
                                             GET_SML_CVECTOR_VAL(const gchar, arg0),
                                             flags,
                                             callback,
                                             user_data,
                                             user_data_free_func);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GError*
mlton_g_dbus_error_new_for_dbus_error (SML_CVECTOR_VAL(const gchar, dbus_error_name),
                                       SML_CVECTOR_VAL(const gchar, dbus_error_message))
{
  return g_dbus_error_new_for_dbus_error (GET_SML_CVECTOR_VAL(const gchar, dbus_error_name),
                                          GET_SML_CVECTOR_VAL(const gchar, dbus_error_message));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_error_register_error_domain (SML_CVECTOR_VAL(const gchar, error_domain_quark_name),
                                          volatile gsize* quark_volatile,
                                          const GDBusErrorEntry* entries,
                                          guint num_entries)
{
  g_dbus_error_register_error_domain (GET_SML_CVECTOR_VAL(const gchar, error_domain_quark_name),
                                      quark_volatile,
                                      entries,
                                      num_entries);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusMethodInfo*
mlton_g_dbus_interface_info_lookup_method (GDBusInterfaceInfo* info,
                                           SML_CVECTOR_VAL(const gchar, name))
{
  return g_dbus_interface_info_lookup_method (info,
                                              GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusPropertyInfo*
mlton_g_dbus_interface_info_lookup_property (GDBusInterfaceInfo* info,
                                             SML_CVECTOR_VAL(const gchar, name))
{
  return g_dbus_interface_info_lookup_property (info,
                                                GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusSignalInfo*
mlton_g_dbus_interface_info_lookup_signal (GDBusInterfaceInfo* info,
                                           SML_CVECTOR_VAL(const gchar, name))
{
  return g_dbus_interface_info_lookup_signal (info,
                                              GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gboolean
mlton_g_dbus_interface_skeleton_export (GDBusInterfaceSkeleton* interface_,
                                        GDBusConnection* connection,
                                        SML_CVECTOR_VAL(const gchar, object_path),
                                        GError** error)
{
  return g_dbus_interface_skeleton_export (interface_,
                                           connection,
                                           GET_SML_CVECTOR_VAL(const gchar, object_path),
                                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GDBusMenuModel*
mlton_g_dbus_menu_model_get (GDBusConnection* connection,
                             SML_CVECTOR_VAL(const gchar, bus_name),
                             SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_menu_model_get (connection,
                                GET_SML_CVECTOR_VAL(const gchar, bus_name),
                                GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusMessage*
mlton_g_dbus_message_new_from_blob (SML_CVECTOR_VAL(guchar, blob),
                                    gsize blob_len,
                                    GDBusCapabilityFlags capabilities,
                                    GError** error)
{
  return g_dbus_message_new_from_blob (GET_SML_CVECTOR_VAL(guchar, blob),
                                       blob_len,
                                       capabilities,
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusMessage*
mlton_g_dbus_message_new_method_call (SML_CVECTOR_VAL(const gchar, name),
                                      SML_CVECTOR_VAL(const gchar, path),
                                      SML_CVECTOR_VAL(const gchar, interface_),
                                      SML_CVECTOR_VAL(const gchar, method))
{
  return g_dbus_message_new_method_call (GET_SML_CVECTOR_VAL(const gchar, name),
                                         GET_SML_CVECTOR_VAL(const gchar, path),
                                         GET_SML_CVECTOR_VAL(const gchar, interface_),
                                         GET_SML_CVECTOR_VAL(const gchar, method));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusMessage*
mlton_g_dbus_message_new_signal (SML_CVECTOR_VAL(const gchar, path),
                                 SML_CVECTOR_VAL(const gchar, interface_),
                                 SML_CVECTOR_VAL(const gchar, signal))
{
  return g_dbus_message_new_signal (GET_SML_CVECTOR_VAL(const gchar, path),
                                    GET_SML_CVECTOR_VAL(const gchar, interface_),
                                    GET_SML_CVECTOR_VAL(const gchar, signal));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gssize
mlton_g_dbus_message_bytes_needed (SML_CVECTOR_VAL(guchar, blob),
                                   gsize blob_len,
                                   GError** error)
{
  return g_dbus_message_bytes_needed (GET_SML_CVECTOR_VAL(guchar, blob),
                                      blob_len,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusMessage*
mlton_g_dbus_message_new_method_error_literal (GDBusMessage* method_call_message,
                                               SML_CVECTOR_VAL(const gchar, error_name),
                                               SML_CVECTOR_VAL(const gchar, error_message))
{
  return g_dbus_message_new_method_error_literal (method_call_message,
                                                  GET_SML_CVECTOR_VAL(const gchar, error_name),
                                                  GET_SML_CVECTOR_VAL(const gchar, error_message));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_destination (GDBusMessage* message,
                                      SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_destination (message,
                                  GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_error_name (GDBusMessage* message,
                                     SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_error_name (message,
                                 GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_interface (GDBusMessage* message,
                                    SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_interface (message,
                                GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_member (GDBusMessage* message,
                                 SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_member (message,
                             GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_path (GDBusMessage* message,
                               SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_path (message,
                           GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_sender (GDBusMessage* message,
                                 SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_sender (message,
                             GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_message_set_signature (GDBusMessage* message,
                                    SML_CVECTOR_VAL(const gchar, value))
{
  g_dbus_message_set_signature (message,
                                GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_method_invocation_return_dbus_error (GDBusMethodInvocation* invocation,
                                                  SML_CVECTOR_VAL(const gchar, error_name),
                                                  SML_CVECTOR_VAL(const gchar, error_message))
{
  g_dbus_method_invocation_return_dbus_error (invocation,
                                              GET_SML_CVECTOR_VAL(const gchar, error_name),
                                              GET_SML_CVECTOR_VAL(const gchar, error_message));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_method_invocation_return_error_literal (GDBusMethodInvocation* invocation,
                                                     GQuark domain,
                                                     gint code,
                                                     SML_CVECTOR_VAL(const gchar, message))
{
  g_dbus_method_invocation_return_error_literal (invocation,
                                                 domain,
                                                 code,
                                                 GET_SML_CVECTOR_VAL(const gchar, message));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusNodeInfo*
mlton_g_dbus_node_info_new_for_xml (SML_CVECTOR_VAL(const gchar, xml_data),
                                    GError** error)
{
  return g_dbus_node_info_new_for_xml (GET_SML_CVECTOR_VAL(const gchar, xml_data),
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusInterfaceInfo*
mlton_g_dbus_node_info_lookup_interface (GDBusNodeInfo* info,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  return g_dbus_node_info_lookup_interface (info,
                                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusInterface*
mlton_g_dbus_object_get_interface (GDBusObject* object,
                                   SML_CVECTOR_VAL(const gchar, interface_name))
{
  return g_dbus_object_get_interface (object,
                                      GET_SML_CVECTOR_VAL(const gchar, interface_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusInterface*
mlton_g_dbus_object_manager_get_interface (GDBusObjectManager* manager,
                                           SML_CVECTOR_VAL(const gchar, object_path),
                                           SML_CVECTOR_VAL(const gchar, interface_name))
{
  return g_dbus_object_manager_get_interface (manager,
                                              GET_SML_CVECTOR_VAL(const gchar, object_path),
                                              GET_SML_CVECTOR_VAL(const gchar, interface_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObject*
mlton_g_dbus_object_manager_get_object (GDBusObjectManager* manager,
                                        SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_object_manager_get_object (manager,
                                           GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObjectManager*
mlton_g_dbus_object_manager_client_new_for_bus_sync (GBusType bus_type,
                                                     GDBusObjectManagerClientFlags flags,
                                                     SML_CVECTOR_VAL(const gchar, name),
                                                     SML_CVECTOR_VAL(const gchar, object_path),
                                                     GDBusProxyTypeFunc get_proxy_type_func,
                                                     gpointer get_proxy_type_user_data,
                                                     GDestroyNotify get_proxy_type_destroy_notify,
                                                     GCancellable* cancellable,
                                                     GError** error)
{
  return g_dbus_object_manager_client_new_for_bus_sync (bus_type,
                                                        flags,
                                                        GET_SML_CVECTOR_VAL(const gchar, name),
                                                        GET_SML_CVECTOR_VAL(const gchar, object_path),
                                                        get_proxy_type_func,
                                                        get_proxy_type_user_data,
                                                        get_proxy_type_destroy_notify,
                                                        cancellable,
                                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObjectManager*
mlton_g_dbus_object_manager_client_new_sync (GDBusConnection* connection,
                                             GDBusObjectManagerClientFlags flags,
                                             SML_CVECTOR_VAL(const gchar, name),
                                             SML_CVECTOR_VAL(const gchar, object_path),
                                             GDBusProxyTypeFunc get_proxy_type_func,
                                             gpointer get_proxy_type_user_data,
                                             GDestroyNotify get_proxy_type_destroy_notify,
                                             GCancellable* cancellable,
                                             GError** error)
{
  return g_dbus_object_manager_client_new_sync (connection,
                                                flags,
                                                GET_SML_CVECTOR_VAL(const gchar, name),
                                                GET_SML_CVECTOR_VAL(const gchar, object_path),
                                                get_proxy_type_func,
                                                get_proxy_type_user_data,
                                                get_proxy_type_destroy_notify,
                                                cancellable,
                                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_object_manager_client_new (GDBusConnection* connection,
                                        GDBusObjectManagerClientFlags flags,
                                        SML_CVECTOR_VAL(const gchar, name),
                                        SML_CVECTOR_VAL(const gchar, object_path),
                                        GDBusProxyTypeFunc get_proxy_type_func,
                                        gpointer get_proxy_type_user_data,
                                        GDestroyNotify get_proxy_type_destroy_notify,
                                        GCancellable* cancellable,
                                        GAsyncReadyCallback callback,
                                        gpointer user_data)
{
  g_dbus_object_manager_client_new (connection,
                                    flags,
                                    GET_SML_CVECTOR_VAL(const gchar, name),
                                    GET_SML_CVECTOR_VAL(const gchar, object_path),
                                    get_proxy_type_func,
                                    get_proxy_type_user_data,
                                    get_proxy_type_destroy_notify,
                                    cancellable,
                                    callback,
                                    user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_object_manager_client_new_for_bus (GBusType bus_type,
                                                GDBusObjectManagerClientFlags flags,
                                                SML_CVECTOR_VAL(const gchar, name),
                                                SML_CVECTOR_VAL(const gchar, object_path),
                                                GDBusProxyTypeFunc get_proxy_type_func,
                                                gpointer get_proxy_type_user_data,
                                                GDestroyNotify get_proxy_type_destroy_notify,
                                                GCancellable* cancellable,
                                                GAsyncReadyCallback callback,
                                                gpointer user_data)
{
  g_dbus_object_manager_client_new_for_bus (bus_type,
                                            flags,
                                            GET_SML_CVECTOR_VAL(const gchar, name),
                                            GET_SML_CVECTOR_VAL(const gchar, object_path),
                                            get_proxy_type_func,
                                            get_proxy_type_user_data,
                                            get_proxy_type_destroy_notify,
                                            cancellable,
                                            callback,
                                            user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObjectManagerServer*
mlton_g_dbus_object_manager_server_new (SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_object_manager_server_new (GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gboolean
mlton_g_dbus_object_manager_server_unexport (GDBusObjectManagerServer* manager,
                                             SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_object_manager_server_unexport (manager,
                                                GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObjectProxy*
mlton_g_dbus_object_proxy_new (GDBusConnection* connection,
                               SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_object_proxy_new (connection,
                                  GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GDBusObjectSkeleton*
mlton_g_dbus_object_skeleton_new (SML_CVECTOR_VAL(const gchar, object_path))
{
  return g_dbus_object_skeleton_new (GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_object_skeleton_remove_interface_by_name (GDBusObjectSkeleton* object,
                                                       SML_CVECTOR_VAL(const gchar, interface_name))
{
  g_dbus_object_skeleton_remove_interface_by_name (object,
                                                   GET_SML_CVECTOR_VAL(const gchar, interface_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_object_skeleton_set_object_path (GDBusObjectSkeleton* object,
                                              SML_CVECTOR_VAL(const gchar, object_path))
{
  g_dbus_object_skeleton_set_object_path (object,
                                          GET_SML_CVECTOR_VAL(const gchar, object_path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusProxy*
mlton_g_dbus_proxy_new_for_bus_sync (GBusType bus_type,
                                     GDBusProxyFlags flags,
                                     GDBusInterfaceInfo* info,
                                     SML_CVECTOR_VAL(const gchar, name),
                                     SML_CVECTOR_VAL(const gchar, object_path),
                                     SML_CVECTOR_VAL(const gchar, interface_name),
                                     GCancellable* cancellable,
                                     GError** error)
{
  return g_dbus_proxy_new_for_bus_sync (bus_type,
                                        flags,
                                        info,
                                        GET_SML_CVECTOR_VAL(const gchar, name),
                                        GET_SML_CVECTOR_VAL(const gchar, object_path),
                                        GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                        cancellable,
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusProxy*
mlton_g_dbus_proxy_new_sync (GDBusConnection* connection,
                             GDBusProxyFlags flags,
                             GDBusInterfaceInfo* info,
                             SML_CVECTOR_VAL(const gchar, name),
                             SML_CVECTOR_VAL(const gchar, object_path),
                             SML_CVECTOR_VAL(const gchar, interface_name),
                             GCancellable* cancellable,
                             GError** error)
{
  return g_dbus_proxy_new_sync (connection,
                                flags,
                                info,
                                GET_SML_CVECTOR_VAL(const gchar, name),
                                GET_SML_CVECTOR_VAL(const gchar, object_path),
                                GET_SML_CVECTOR_VAL(const gchar, interface_name),
                                cancellable,
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_proxy_new (GDBusConnection* connection,
                        GDBusProxyFlags flags,
                        GDBusInterfaceInfo* info,
                        SML_CVECTOR_VAL(const gchar, name),
                        SML_CVECTOR_VAL(const gchar, object_path),
                        SML_CVECTOR_VAL(const gchar, interface_name),
                        GCancellable* cancellable,
                        GAsyncReadyCallback callback,
                        gpointer user_data)
{
  g_dbus_proxy_new (connection,
                    flags,
                    info,
                    GET_SML_CVECTOR_VAL(const gchar, name),
                    GET_SML_CVECTOR_VAL(const gchar, object_path),
                    GET_SML_CVECTOR_VAL(const gchar, interface_name),
                    cancellable,
                    callback,
                    user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_proxy_new_for_bus (GBusType bus_type,
                                GDBusProxyFlags flags,
                                GDBusInterfaceInfo* info,
                                SML_CVECTOR_VAL(const gchar, name),
                                SML_CVECTOR_VAL(const gchar, object_path),
                                SML_CVECTOR_VAL(const gchar, interface_name),
                                GCancellable* cancellable,
                                GAsyncReadyCallback callback,
                                gpointer user_data)
{
  g_dbus_proxy_new_for_bus (bus_type,
                            flags,
                            info,
                            GET_SML_CVECTOR_VAL(const gchar, name),
                            GET_SML_CVECTOR_VAL(const gchar, object_path),
                            GET_SML_CVECTOR_VAL(const gchar, interface_name),
                            cancellable,
                            callback,
                            user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_proxy_call (GDBusProxy* proxy,
                         SML_CVECTOR_VAL(const gchar, method_name),
                         GVariant* parameters,
                         GDBusCallFlags flags,
                         gint timeout_msec,
                         GCancellable* cancellable,
                         GAsyncReadyCallback callback,
                         gpointer user_data)
{
  g_dbus_proxy_call (proxy,
                     GET_SML_CVECTOR_VAL(const gchar, method_name),
                     parameters,
                     flags,
                     timeout_msec,
                     cancellable,
                     callback,
                     user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_dbus_proxy_call_sync (GDBusProxy* proxy,
                              SML_CVECTOR_VAL(const gchar, method_name),
                              GVariant* parameters,
                              GDBusCallFlags flags,
                              gint timeout_msec,
                              GCancellable* cancellable,
                              GError** error)
{
  return g_dbus_proxy_call_sync (proxy,
                                 GET_SML_CVECTOR_VAL(const gchar, method_name),
                                 parameters,
                                 flags,
                                 timeout_msec,
                                 cancellable,
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_dbus_proxy_call_with_unix_fd_list (GDBusProxy* proxy,
                                           SML_CVECTOR_VAL(const gchar, method_name),
                                           GVariant* parameters,
                                           GDBusCallFlags flags,
                                           gint timeout_msec,
                                           GUnixFDList* fd_list,
                                           GCancellable* cancellable,
                                           GAsyncReadyCallback callback,
                                           gpointer user_data)
{
  g_dbus_proxy_call_with_unix_fd_list (proxy,
                                       GET_SML_CVECTOR_VAL(const gchar, method_name),
                                       parameters,
                                       flags,
                                       timeout_msec,
                                       fd_list,
                                       cancellable,
                                       callback,
                                       user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GVariant*
mlton_g_dbus_proxy_call_with_unix_fd_list_sync (GDBusProxy* proxy,
                                                SML_CVECTOR_VAL(const gchar, method_name),
                                                GVariant* parameters,
                                                GDBusCallFlags flags,
                                                gint timeout_msec,
                                                GUnixFDList* fd_list,
                                                GUnixFDList** out_fd_list,
                                                GCancellable* cancellable,
                                                GError** error)
{
  return g_dbus_proxy_call_with_unix_fd_list_sync (proxy,
                                                   GET_SML_CVECTOR_VAL(const gchar, method_name),
                                                   parameters,
                                                   flags,
                                                   timeout_msec,
                                                   fd_list,
                                                   out_fd_list,
                                                   cancellable,
                                                   error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_dbus_proxy_get_cached_property (GDBusProxy* proxy,
                                        SML_CVECTOR_VAL(const gchar, property_name))
{
  return g_dbus_proxy_get_cached_property (proxy,
                                           GET_SML_CVECTOR_VAL(const gchar, property_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_proxy_set_cached_property (GDBusProxy* proxy,
                                        SML_CVECTOR_VAL(const gchar, property_name),
                                        GVariant* value)
{
  g_dbus_proxy_set_cached_property (proxy,
                                    GET_SML_CVECTOR_VAL(const gchar, property_name),
                                    value);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GDBusServer*
mlton_g_dbus_server_new_sync (SML_CVECTOR_VAL(const gchar, address),
                              GDBusServerFlags flags,
                              SML_CVECTOR_VAL(const gchar, guid),
                              GDBusAuthObserver* observer,
                              GCancellable* cancellable,
                              GError** error)
{
  return g_dbus_server_new_sync (GET_SML_CVECTOR_VAL(const gchar, address),
                                 flags,
                                 GET_SML_CVECTOR_VAL(const gchar, guid),
                                 observer,
                                 cancellable,
                                 error);
}
#endif

char*
mlton_g_data_input_stream_read_until (GDataInputStream* stream,
                                      SML_CVECTOR_VAL(const gchar, stop_chars),
                                      gsize* length,
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_data_input_stream_read_until (stream,
                                         GET_SML_CVECTOR_VAL(const gchar, stop_chars),
                                         length,
                                         cancellable,
                                         error);
}

#if GLIB_CHECK_VERSION(2, 20, 0)
void
mlton_g_data_input_stream_read_until_async (GDataInputStream* stream,
                                            SML_CVECTOR_VAL(const gchar, stop_chars),
                                            gint io_priority,
                                            GCancellable* cancellable,
                                            GAsyncReadyCallback callback,
                                            gpointer user_data)
{
  g_data_input_stream_read_until_async (stream,
                                        GET_SML_CVECTOR_VAL(const gchar, stop_chars),
                                        io_priority,
                                        cancellable,
                                        callback,
                                        user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
char*
mlton_g_data_input_stream_read_upto (GDataInputStream* stream,
                                     SML_CVECTOR_VAL(const gchar, stop_chars),
                                     gssize stop_chars_len,
                                     gsize* length,
                                     GCancellable* cancellable,
                                     GError** error)
{
  return g_data_input_stream_read_upto (stream,
                                        GET_SML_CVECTOR_VAL(const gchar, stop_chars),
                                        stop_chars_len,
                                        length,
                                        cancellable,
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_data_input_stream_read_upto_async (GDataInputStream* stream,
                                           SML_CVECTOR_VAL(const gchar, stop_chars),
                                           gssize stop_chars_len,
                                           gint io_priority,
                                           GCancellable* cancellable,
                                           GAsyncReadyCallback callback,
                                           gpointer user_data)
{
  g_data_input_stream_read_upto_async (stream,
                                       GET_SML_CVECTOR_VAL(const gchar, stop_chars),
                                       stop_chars_len,
                                       io_priority,
                                       cancellable,
                                       callback,
                                       user_data);
}
#endif

gboolean
mlton_g_data_output_stream_put_string (GDataOutputStream* stream,
                                       SML_CVECTOR_VAL(const char, str),
                                       GCancellable* cancellable,
                                       GError** error)
{
  return g_data_output_stream_put_string (stream,
                                          GET_SML_CVECTOR_VAL(const char, str),
                                          cancellable,
                                          error);
}

#if GLIB_CHECK_VERSION(2, 48, 0)
gint
mlton_g_datagram_based_receive_messages (GDatagramBased* datagram_based,
                                         SML_CVECTOR_VAL(GInputMessage, messages),
                                         guint num_messages,
                                         gint flags,
                                         gint64 timeout,
                                         GCancellable* cancellable,
                                         GError** error)
{
  return g_datagram_based_receive_messages (datagram_based,
                                            GET_SML_CVECTOR_VAL(GInputMessage, messages),
                                            num_messages,
                                            flags,
                                            timeout,
                                            cancellable,
                                            error);
}
#endif

#if GLIB_CHECK_VERSION(2, 48, 0)
gint
mlton_g_datagram_based_send_messages (GDatagramBased* datagram_based,
                                      SML_CVECTOR_VAL(GOutputMessage, messages),
                                      guint num_messages,
                                      gint flags,
                                      gint64 timeout,
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_datagram_based_send_messages (datagram_based,
                                         GET_SML_CVECTOR_VAL(GOutputMessage, messages),
                                         num_messages,
                                         flags,
                                         timeout,
                                         cancellable,
                                         error);
}
#endif

GDesktopAppInfo*
mlton_g_desktop_app_info_new (SML_CVECTOR_VAL(const char, desktop_id))
{
  return g_desktop_app_info_new (GET_SML_CVECTOR_VAL(const char, desktop_id));
}

GDesktopAppInfo*
mlton_g_desktop_app_info_new_from_filename (SML_CVECTOR_VAL(char, filename))
{
  return g_desktop_app_info_new_from_filename (GET_SML_CVECTOR_VAL(char, filename));
}

#if GLIB_CHECK_VERSION(2, 42, 0)
GList*
mlton_g_desktop_app_info_get_implementations (SML_CVECTOR_VAL(const gchar, interface))
{
  return g_desktop_app_info_get_implementations (GET_SML_CVECTOR_VAL(const gchar, interface));
}
#endif

gchar***
mlton_g_desktop_app_info_search (SML_CVECTOR_VAL(const gchar, search_string))
{
  return g_desktop_app_info_search (GET_SML_CVECTOR_VAL(const gchar, search_string));
}

void
mlton_g_desktop_app_info_set_desktop_env (SML_CVECTOR_VAL(const char, desktop_env))
{
  g_desktop_app_info_set_desktop_env (GET_SML_CVECTOR_VAL(const char, desktop_env));
}

#if GLIB_CHECK_VERSION(2, 38, 0)
gchar*
mlton_g_desktop_app_info_get_action_name (GDesktopAppInfo* info,
                                          SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_desktop_app_info_get_action_name (info,
                                             GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
gboolean
mlton_g_desktop_app_info_get_boolean (GDesktopAppInfo* info,
                                      SML_CVECTOR_VAL(const char, key))
{
  return g_desktop_app_info_get_boolean (info,
                                         GET_SML_CVECTOR_VAL(const char, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gboolean
mlton_g_desktop_app_info_get_show_in (GDesktopAppInfo* info,
                                      SML_CVECTOR_VAL(const gchar, desktop_env))
{
  return g_desktop_app_info_get_show_in (info,
                                         GET_SML_CVECTOR_VAL(const gchar, desktop_env));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
char*
mlton_g_desktop_app_info_get_string (GDesktopAppInfo* info,
                                     SML_CVECTOR_VAL(const char, key))
{
  return g_desktop_app_info_get_string (info,
                                        GET_SML_CVECTOR_VAL(const char, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
gboolean
mlton_g_desktop_app_info_has_key (GDesktopAppInfo* info,
                                  SML_CVECTOR_VAL(const char, key))
{
  return g_desktop_app_info_has_key (info,
                                     GET_SML_CVECTOR_VAL(const char, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 38, 0)
void
mlton_g_desktop_app_info_launch_action (GDesktopAppInfo* info,
                                        SML_CVECTOR_VAL(const gchar, action_name),
                                        GAppLaunchContext* launch_context)
{
  g_desktop_app_info_launch_action (info,
                                    GET_SML_CVECTOR_VAL(const gchar, action_name),
                                    launch_context);
}
#endif

GAppInfo*
mlton_g_desktop_app_info_lookup_get_default_for_uri_scheme (GDesktopAppInfoLookup* lookup,
                                                            SML_CVECTOR_VAL(const char, uri_scheme))
{
  return g_desktop_app_info_lookup_get_default_for_uri_scheme (lookup,
                                                               GET_SML_CVECTOR_VAL(const char, uri_scheme));
}

char*
mlton_g_drive_get_identifier (GDrive* drive,
                              SML_CVECTOR_VAL(const char, kind))
{
  return g_drive_get_identifier (drive,
                                 GET_SML_CVECTOR_VAL(const char, kind));
}

GFile*
mlton_g_file_new_for_commandline_arg (SML_CVECTOR_VAL(const char, arg))
{
  return g_file_new_for_commandline_arg (GET_SML_CVECTOR_VAL(const char, arg));
}

#if GLIB_CHECK_VERSION(2, 36, 0)
GFile*
mlton_g_file_new_for_commandline_arg_and_cwd (SML_CVECTOR_VAL(const gchar, arg),
                                              SML_CVECTOR_VAL(gchar, cwd))
{
  return g_file_new_for_commandline_arg_and_cwd (GET_SML_CVECTOR_VAL(const gchar, arg),
                                                 GET_SML_CVECTOR_VAL(gchar, cwd));
}
#endif

GFile*
mlton_g_file_new_for_path (SML_CVECTOR_VAL(char, path))
{
  return g_file_new_for_path (GET_SML_CVECTOR_VAL(char, path));
}

GFile*
mlton_g_file_new_for_uri (SML_CVECTOR_VAL(const char, uri))
{
  return g_file_new_for_uri (GET_SML_CVECTOR_VAL(const char, uri));
}

#if GLIB_CHECK_VERSION(2, 32, 0)
GFile*
mlton_g_file_new_tmp (SML_CVECTOR_VAL(char, tmpl),
                      GFileIOStream** iostream,
                      GError** error)
{
  return g_file_new_tmp (GET_SML_CVECTOR_VAL(char, tmpl),
                         iostream,
                         error);
}
#endif

GFile*
mlton_g_file_parse_name (SML_CVECTOR_VAL(const char, parse_name))
{
  return g_file_parse_name (GET_SML_CVECTOR_VAL(const char, parse_name));
}

GFileEnumerator*
mlton_g_file_enumerate_children (GFile* file,
                                 SML_CVECTOR_VAL(const char, attributes),
                                 GFileQueryInfoFlags flags,
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_file_enumerate_children (file,
                                    GET_SML_CVECTOR_VAL(const char, attributes),
                                    flags,
                                    cancellable,
                                    error);
}

void
mlton_g_file_enumerate_children_async (GFile* file,
                                       SML_CVECTOR_VAL(const char, attributes),
                                       GFileQueryInfoFlags flags,
                                       int io_priority,
                                       GCancellable* cancellable,
                                       GAsyncReadyCallback callback,
                                       gpointer user_data)
{
  g_file_enumerate_children_async (file,
                                   GET_SML_CVECTOR_VAL(const char, attributes),
                                   flags,
                                   io_priority,
                                   cancellable,
                                   callback,
                                   user_data);
}

GFile*
mlton_g_file_get_child (GFile* file,
                        SML_CVECTOR_VAL(char, name))
{
  return g_file_get_child (file,
                           GET_SML_CVECTOR_VAL(char, name));
}

GFile*
mlton_g_file_get_child_for_display_name (GFile* file,
                                         SML_CVECTOR_VAL(const char, display_name),
                                         GError** error)
{
  return g_file_get_child_for_display_name (file,
                                            GET_SML_CVECTOR_VAL(const char, display_name),
                                            error);
}

gboolean
mlton_g_file_has_uri_scheme (GFile* file,
                             SML_CVECTOR_VAL(const char, uri_scheme))
{
  return g_file_has_uri_scheme (file,
                                GET_SML_CVECTOR_VAL(const char, uri_scheme));
}

gboolean
mlton_g_file_load_contents (GFile* file,
                            GCancellable* cancellable,
                            SML_CVECTOR_REF(char, contents),
                            gsize* length,
                            SML_CVECTOR_REF(char, etag_out),
                            GError** error)
{
  return g_file_load_contents (file,
                               cancellable,
                               GET_SML_CVECTOR_REF(char, contents),
                               length,
                               GET_SML_CVECTOR_REF(char, etag_out),
                               error);
}

gboolean
mlton_g_file_load_contents_finish (GFile* file,
                                   GAsyncResult* res,
                                   SML_CVECTOR_REF(char, contents),
                                   gsize* length,
                                   SML_CVECTOR_REF(char, etag_out),
                                   GError** error)
{
  return g_file_load_contents_finish (file,
                                      res,
                                      GET_SML_CVECTOR_REF(char, contents),
                                      length,
                                      GET_SML_CVECTOR_REF(char, etag_out),
                                      error);
}

gboolean
mlton_g_file_load_partial_contents_finish (GFile* file,
                                           GAsyncResult* res,
                                           SML_CVECTOR_REF(char, contents),
                                           gsize* length,
                                           SML_CVECTOR_REF(char, etag_out),
                                           GError** error)
{
  return g_file_load_partial_contents_finish (file,
                                              res,
                                              GET_SML_CVECTOR_REF(char, contents),
                                              length,
                                              GET_SML_CVECTOR_REF(char, etag_out),
                                              error);
}

gboolean
mlton_g_file_make_symbolic_link (GFile* file,
                                 SML_CVECTOR_VAL(char, symlink_value),
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_file_make_symbolic_link (file,
                                    GET_SML_CVECTOR_VAL(char, symlink_value),
                                    cancellable,
                                    error);
}

GFileInfo*
mlton_g_file_query_filesystem_info (GFile* file,
                                    SML_CVECTOR_VAL(const char, attributes),
                                    GCancellable* cancellable,
                                    GError** error)
{
  return g_file_query_filesystem_info (file,
                                       GET_SML_CVECTOR_VAL(const char, attributes),
                                       cancellable,
                                       error);
}

void
mlton_g_file_query_filesystem_info_async (GFile* file,
                                          SML_CVECTOR_VAL(const char, attributes),
                                          int io_priority,
                                          GCancellable* cancellable,
                                          GAsyncReadyCallback callback,
                                          gpointer user_data)
{
  g_file_query_filesystem_info_async (file,
                                      GET_SML_CVECTOR_VAL(const char, attributes),
                                      io_priority,
                                      cancellable,
                                      callback,
                                      user_data);
}

GFileInfo*
mlton_g_file_query_info (GFile* file,
                         SML_CVECTOR_VAL(const char, attributes),
                         GFileQueryInfoFlags flags,
                         GCancellable* cancellable,
                         GError** error)
{
  return g_file_query_info (file,
                            GET_SML_CVECTOR_VAL(const char, attributes),
                            flags,
                            cancellable,
                            error);
}

void
mlton_g_file_query_info_async (GFile* file,
                               SML_CVECTOR_VAL(const char, attributes),
                               GFileQueryInfoFlags flags,
                               int io_priority,
                               GCancellable* cancellable,
                               GAsyncReadyCallback callback,
                               gpointer user_data)
{
  g_file_query_info_async (file,
                           GET_SML_CVECTOR_VAL(const char, attributes),
                           flags,
                           io_priority,
                           cancellable,
                           callback,
                           user_data);
}

GFileOutputStream*
mlton_g_file_replace (GFile* file,
                      SML_CVECTOR_VAL(const char, etag),
                      gboolean make_backup,
                      GFileCreateFlags flags,
                      GCancellable* cancellable,
                      GError** error)
{
  return g_file_replace (file,
                         GET_SML_CVECTOR_VAL(const char, etag),
                         make_backup,
                         flags,
                         cancellable,
                         error);
}

void
mlton_g_file_replace_async (GFile* file,
                            SML_CVECTOR_VAL(const char, etag),
                            gboolean make_backup,
                            GFileCreateFlags flags,
                            int io_priority,
                            GCancellable* cancellable,
                            GAsyncReadyCallback callback,
                            gpointer user_data)
{
  g_file_replace_async (file,
                        GET_SML_CVECTOR_VAL(const char, etag),
                        make_backup,
                        flags,
                        io_priority,
                        cancellable,
                        callback,
                        user_data);
}

gboolean
mlton_g_file_replace_contents (GFile* file,
                               SML_CVECTOR_VAL(char, contents),
                               gsize length,
                               SML_CVECTOR_VAL(const char, etag),
                               gboolean make_backup,
                               GFileCreateFlags flags,
                               SML_CVECTOR_REF(char, new_etag),
                               GCancellable* cancellable,
                               GError** error)
{
  return g_file_replace_contents (file,
                                  GET_SML_CVECTOR_VAL(char, contents),
                                  length,
                                  GET_SML_CVECTOR_VAL(const char, etag),
                                  make_backup,
                                  flags,
                                  GET_SML_CVECTOR_REF(char, new_etag),
                                  cancellable,
                                  error);
}

void
mlton_g_file_replace_contents_async (GFile* file,
                                     SML_CVECTOR_VAL(char, contents),
                                     gsize length,
                                     SML_CVECTOR_VAL(const char, etag),
                                     gboolean make_backup,
                                     GFileCreateFlags flags,
                                     GCancellable* cancellable,
                                     GAsyncReadyCallback callback,
                                     gpointer user_data)
{
  g_file_replace_contents_async (file,
                                 GET_SML_CVECTOR_VAL(char, contents),
                                 length,
                                 GET_SML_CVECTOR_VAL(const char, etag),
                                 make_backup,
                                 flags,
                                 cancellable,
                                 callback,
                                 user_data);
}

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_file_replace_contents_bytes_async (GFile* file,
                                           GBytes* contents,
                                           SML_CVECTOR_VAL(const char, etag),
                                           gboolean make_backup,
                                           GFileCreateFlags flags,
                                           GCancellable* cancellable,
                                           GAsyncReadyCallback callback,
                                           gpointer user_data)
{
  g_file_replace_contents_bytes_async (file,
                                       contents,
                                       GET_SML_CVECTOR_VAL(const char, etag),
                                       make_backup,
                                       flags,
                                       cancellable,
                                       callback,
                                       user_data);
}
#endif

gboolean
mlton_g_file_replace_contents_finish (GFile* file,
                                      GAsyncResult* res,
                                      SML_CVECTOR_REF(char, new_etag),
                                      GError** error)
{
  return g_file_replace_contents_finish (file,
                                         res,
                                         GET_SML_CVECTOR_REF(char, new_etag),
                                         error);
}

#if GLIB_CHECK_VERSION(2, 22, 0)
GFileIOStream*
mlton_g_file_replace_readwrite (GFile* file,
                                SML_CVECTOR_VAL(const char, etag),
                                gboolean make_backup,
                                GFileCreateFlags flags,
                                GCancellable* cancellable,
                                GError** error)
{
  return g_file_replace_readwrite (file,
                                   GET_SML_CVECTOR_VAL(const char, etag),
                                   make_backup,
                                   flags,
                                   cancellable,
                                   error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_file_replace_readwrite_async (GFile* file,
                                      SML_CVECTOR_VAL(const char, etag),
                                      gboolean make_backup,
                                      GFileCreateFlags flags,
                                      int io_priority,
                                      GCancellable* cancellable,
                                      GAsyncReadyCallback callback,
                                      gpointer user_data)
{
  g_file_replace_readwrite_async (file,
                                  GET_SML_CVECTOR_VAL(const char, etag),
                                  make_backup,
                                  flags,
                                  io_priority,
                                  cancellable,
                                  callback,
                                  user_data);
}
#endif

GFile*
mlton_g_file_resolve_relative_path (GFile* file,
                                    SML_CVECTOR_VAL(char, relative_path))
{
  return g_file_resolve_relative_path (file,
                                       GET_SML_CVECTOR_VAL(char, relative_path));
}

gboolean
mlton_g_file_set_attribute (GFile* file,
                            SML_CVECTOR_VAL(const char, attribute),
                            GFileAttributeType type,
                            gpointer value_p,
                            GFileQueryInfoFlags flags,
                            GCancellable* cancellable,
                            GError** error)
{
  return g_file_set_attribute (file,
                               GET_SML_CVECTOR_VAL(const char, attribute),
                               type,
                               value_p,
                               flags,
                               cancellable,
                               error);
}

gboolean
mlton_g_file_set_attribute_byte_string (GFile* file,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        SML_CVECTOR_VAL(const char, value),
                                        GFileQueryInfoFlags flags,
                                        GCancellable* cancellable,
                                        GError** error)
{
  return g_file_set_attribute_byte_string (file,
                                           GET_SML_CVECTOR_VAL(const char, attribute),
                                           GET_SML_CVECTOR_VAL(const char, value),
                                           flags,
                                           cancellable,
                                           error);
}

gboolean
mlton_g_file_set_attribute_int32 (GFile* file,
                                  SML_CVECTOR_VAL(const char, attribute),
                                  gint32 value,
                                  GFileQueryInfoFlags flags,
                                  GCancellable* cancellable,
                                  GError** error)
{
  return g_file_set_attribute_int32 (file,
                                     GET_SML_CVECTOR_VAL(const char, attribute),
                                     value,
                                     flags,
                                     cancellable,
                                     error);
}

gboolean
mlton_g_file_set_attribute_int64 (GFile* file,
                                  SML_CVECTOR_VAL(const char, attribute),
                                  gint64 value,
                                  GFileQueryInfoFlags flags,
                                  GCancellable* cancellable,
                                  GError** error)
{
  return g_file_set_attribute_int64 (file,
                                     GET_SML_CVECTOR_VAL(const char, attribute),
                                     value,
                                     flags,
                                     cancellable,
                                     error);
}

gboolean
mlton_g_file_set_attribute_string (GFile* file,
                                   SML_CVECTOR_VAL(const char, attribute),
                                   SML_CVECTOR_VAL(const char, value),
                                   GFileQueryInfoFlags flags,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_file_set_attribute_string (file,
                                      GET_SML_CVECTOR_VAL(const char, attribute),
                                      GET_SML_CVECTOR_VAL(const char, value),
                                      flags,
                                      cancellable,
                                      error);
}

gboolean
mlton_g_file_set_attribute_uint32 (GFile* file,
                                   SML_CVECTOR_VAL(const char, attribute),
                                   guint32 value,
                                   GFileQueryInfoFlags flags,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_file_set_attribute_uint32 (file,
                                      GET_SML_CVECTOR_VAL(const char, attribute),
                                      value,
                                      flags,
                                      cancellable,
                                      error);
}

gboolean
mlton_g_file_set_attribute_uint64 (GFile* file,
                                   SML_CVECTOR_VAL(const char, attribute),
                                   guint64 value,
                                   GFileQueryInfoFlags flags,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_file_set_attribute_uint64 (file,
                                      GET_SML_CVECTOR_VAL(const char, attribute),
                                      value,
                                      flags,
                                      cancellable,
                                      error);
}

GFile*
mlton_g_file_set_display_name (GFile* file,
                               SML_CVECTOR_VAL(const char, display_name),
                               GCancellable* cancellable,
                               GError** error)
{
  return g_file_set_display_name (file,
                                  GET_SML_CVECTOR_VAL(const char, display_name),
                                  cancellable,
                                  error);
}

void
mlton_g_file_set_display_name_async (GFile* file,
                                     SML_CVECTOR_VAL(const char, display_name),
                                     int io_priority,
                                     GCancellable* cancellable,
                                     GAsyncReadyCallback callback,
                                     gpointer user_data)
{
  g_file_set_display_name_async (file,
                                 GET_SML_CVECTOR_VAL(const char, display_name),
                                 io_priority,
                                 cancellable,
                                 callback,
                                 user_data);
}

void
mlton_g_file_attribute_info_list_add (GFileAttributeInfoList* list,
                                      SML_CVECTOR_VAL(const char, name),
                                      GFileAttributeType type,
                                      GFileAttributeInfoFlags flags)
{
  g_file_attribute_info_list_add (list,
                                  GET_SML_CVECTOR_VAL(const char, name),
                                  type,
                                  flags);
}

const GFileAttributeInfo*
mlton_g_file_attribute_info_list_lookup (GFileAttributeInfoList* list,
                                         SML_CVECTOR_VAL(const char, name))
{
  return g_file_attribute_info_list_lookup (list,
                                            GET_SML_CVECTOR_VAL(const char, name));
}

GFileAttributeMatcher*
mlton_g_file_attribute_matcher_new (SML_CVECTOR_VAL(const char, attributes))
{
  return g_file_attribute_matcher_new (GET_SML_CVECTOR_VAL(const char, attributes));
}

gboolean
mlton_g_file_attribute_matcher_enumerate_namespace (GFileAttributeMatcher* matcher,
                                                    SML_CVECTOR_VAL(const char, ns))
{
  return g_file_attribute_matcher_enumerate_namespace (matcher,
                                                       GET_SML_CVECTOR_VAL(const char, ns));
}

gboolean
mlton_g_file_attribute_matcher_matches (GFileAttributeMatcher* matcher,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_attribute_matcher_matches (matcher,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

gboolean
mlton_g_file_attribute_matcher_matches_only (GFileAttributeMatcher* matcher,
                                             SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_attribute_matcher_matches_only (matcher,
                                                GET_SML_CVECTOR_VAL(const char, attribute));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
GFileInfo*
mlton_g_file_io_stream_query_info (GFileIOStream* stream,
                                   SML_CVECTOR_VAL(const char, attributes),
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_file_io_stream_query_info (stream,
                                      GET_SML_CVECTOR_VAL(const char, attributes),
                                      cancellable,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_file_io_stream_query_info_async (GFileIOStream* stream,
                                         SML_CVECTOR_VAL(const char, attributes),
                                         int io_priority,
                                         GCancellable* cancellable,
                                         GAsyncReadyCallback callback,
                                         gpointer user_data)
{
  g_file_io_stream_query_info_async (stream,
                                     GET_SML_CVECTOR_VAL(const char, attributes),
                                     io_priority,
                                     cancellable,
                                     callback,
                                     user_data);
}
#endif

char*
mlton_g_file_info_get_attribute_as_string (GFileInfo* info,
                                           SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_as_string (info,
                                              GET_SML_CVECTOR_VAL(const char, attribute));
}

gboolean
mlton_g_file_info_get_attribute_boolean (GFileInfo* info,
                                         SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_boolean (info,
                                            GET_SML_CVECTOR_VAL(const char, attribute));
}

const char*
mlton_g_file_info_get_attribute_byte_string (GFileInfo* info,
                                             SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_byte_string (info,
                                                GET_SML_CVECTOR_VAL(const char, attribute));
}

gboolean
mlton_g_file_info_get_attribute_data (GFileInfo* info,
                                      SML_CVECTOR_VAL(const char, attribute),
                                      GFileAttributeType* type,
                                      gpointer* value_pp,
                                      GFileAttributeStatus* status)
{
  return g_file_info_get_attribute_data (info,
                                         GET_SML_CVECTOR_VAL(const char, attribute),
                                         type,
                                         value_pp,
                                         status);
}

gint32
mlton_g_file_info_get_attribute_int32 (GFileInfo* info,
                                       SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_int32 (info,
                                          GET_SML_CVECTOR_VAL(const char, attribute));
}

gint64
mlton_g_file_info_get_attribute_int64 (GFileInfo* info,
                                       SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_int64 (info,
                                          GET_SML_CVECTOR_VAL(const char, attribute));
}

GObject*
mlton_g_file_info_get_attribute_object (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_object (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

GFileAttributeStatus
mlton_g_file_info_get_attribute_status (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_status (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

const char*
mlton_g_file_info_get_attribute_string (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_string (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
char**
mlton_g_file_info_get_attribute_stringv (GFileInfo* info,
                                         SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_stringv (info,
                                            GET_SML_CVECTOR_VAL(const char, attribute));
}
#endif

GFileAttributeType
mlton_g_file_info_get_attribute_type (GFileInfo* info,
                                      SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_type (info,
                                         GET_SML_CVECTOR_VAL(const char, attribute));
}

guint32
mlton_g_file_info_get_attribute_uint32 (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_uint32 (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

guint64
mlton_g_file_info_get_attribute_uint64 (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_get_attribute_uint64 (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute));
}

gboolean
mlton_g_file_info_has_attribute (GFileInfo* info,
                                 SML_CVECTOR_VAL(const char, attribute))
{
  return g_file_info_has_attribute (info,
                                    GET_SML_CVECTOR_VAL(const char, attribute));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
gboolean
mlton_g_file_info_has_namespace (GFileInfo* info,
                                 SML_CVECTOR_VAL(const char, name_space))
{
  return g_file_info_has_namespace (info,
                                    GET_SML_CVECTOR_VAL(const char, name_space));
}
#endif

char**
mlton_g_file_info_list_attributes (GFileInfo* info,
                                   SML_CVECTOR_VAL(const char, name_space))
{
  return g_file_info_list_attributes (info,
                                      GET_SML_CVECTOR_VAL(const char, name_space));
}

void
mlton_g_file_info_remove_attribute (GFileInfo* info,
                                    SML_CVECTOR_VAL(const char, attribute))
{
  g_file_info_remove_attribute (info,
                                GET_SML_CVECTOR_VAL(const char, attribute));
}

void
mlton_g_file_info_set_attribute (GFileInfo* info,
                                 SML_CVECTOR_VAL(const char, attribute),
                                 GFileAttributeType type,
                                 gpointer value_p)
{
  g_file_info_set_attribute (info,
                             GET_SML_CVECTOR_VAL(const char, attribute),
                             type,
                             value_p);
}

void
mlton_g_file_info_set_attribute_boolean (GFileInfo* info,
                                         SML_CVECTOR_VAL(const char, attribute),
                                         gboolean attr_value)
{
  g_file_info_set_attribute_boolean (info,
                                     GET_SML_CVECTOR_VAL(const char, attribute),
                                     attr_value);
}

void
mlton_g_file_info_set_attribute_byte_string (GFileInfo* info,
                                             SML_CVECTOR_VAL(const char, attribute),
                                             SML_CVECTOR_VAL(const char, attr_value))
{
  g_file_info_set_attribute_byte_string (info,
                                         GET_SML_CVECTOR_VAL(const char, attribute),
                                         GET_SML_CVECTOR_VAL(const char, attr_value));
}

void
mlton_g_file_info_set_attribute_int32 (GFileInfo* info,
                                       SML_CVECTOR_VAL(const char, attribute),
                                       gint32 attr_value)
{
  g_file_info_set_attribute_int32 (info,
                                   GET_SML_CVECTOR_VAL(const char, attribute),
                                   attr_value);
}

void
mlton_g_file_info_set_attribute_int64 (GFileInfo* info,
                                       SML_CVECTOR_VAL(const char, attribute),
                                       gint64 attr_value)
{
  g_file_info_set_attribute_int64 (info,
                                   GET_SML_CVECTOR_VAL(const char, attribute),
                                   attr_value);
}

void
mlton_g_file_info_set_attribute_object (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        GObject* attr_value)
{
  g_file_info_set_attribute_object (info,
                                    GET_SML_CVECTOR_VAL(const char, attribute),
                                    attr_value);
}

#if GLIB_CHECK_VERSION(2, 22, 0)
gboolean
mlton_g_file_info_set_attribute_status (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        GFileAttributeStatus status)
{
  return g_file_info_set_attribute_status (info,
                                           GET_SML_CVECTOR_VAL(const char, attribute),
                                           status);
}
#endif

void
mlton_g_file_info_set_attribute_string (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        SML_CVECTOR_VAL(const char, attr_value))
{
  g_file_info_set_attribute_string (info,
                                    GET_SML_CVECTOR_VAL(const char, attribute),
                                    GET_SML_CVECTOR_VAL(const char, attr_value));
}

void
mlton_g_file_info_set_attribute_stringv (GFileInfo* info,
                                         SML_CVECTOR_VAL(const char, attribute),
                                         SML_CVECTORVECTOR_VAL(char, attr_value))
{
  g_file_info_set_attribute_stringv (info,
                                     GET_SML_CVECTOR_VAL(const char, attribute),
                                     GET_SML_CVECTORVECTOR_VAL(char, attr_value));
}

void
mlton_g_file_info_set_attribute_uint32 (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        guint32 attr_value)
{
  g_file_info_set_attribute_uint32 (info,
                                    GET_SML_CVECTOR_VAL(const char, attribute),
                                    attr_value);
}

void
mlton_g_file_info_set_attribute_uint64 (GFileInfo* info,
                                        SML_CVECTOR_VAL(const char, attribute),
                                        guint64 attr_value)
{
  g_file_info_set_attribute_uint64 (info,
                                    GET_SML_CVECTOR_VAL(const char, attribute),
                                    attr_value);
}

void
mlton_g_file_info_set_content_type (GFileInfo* info,
                                    SML_CVECTOR_VAL(const char, content_type))
{
  g_file_info_set_content_type (info,
                                GET_SML_CVECTOR_VAL(const char, content_type));
}

void
mlton_g_file_info_set_display_name (GFileInfo* info,
                                    SML_CVECTOR_VAL(const char, display_name))
{
  g_file_info_set_display_name (info,
                                GET_SML_CVECTOR_VAL(const char, display_name));
}

void
mlton_g_file_info_set_edit_name (GFileInfo* info,
                                 SML_CVECTOR_VAL(const char, edit_name))
{
  g_file_info_set_edit_name (info,
                             GET_SML_CVECTOR_VAL(const char, edit_name));
}

void
mlton_g_file_info_set_name (GFileInfo* info,
                            SML_CVECTOR_VAL(char, name))
{
  g_file_info_set_name (info,
                        GET_SML_CVECTOR_VAL(char, name));
}

void
mlton_g_file_info_set_symlink_target (GFileInfo* info,
                                      SML_CVECTOR_VAL(const char, symlink_target))
{
  g_file_info_set_symlink_target (info,
                                  GET_SML_CVECTOR_VAL(const char, symlink_target));
}

GFileInfo*
mlton_g_file_input_stream_query_info (GFileInputStream* stream,
                                      SML_CVECTOR_VAL(const char, attributes),
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_file_input_stream_query_info (stream,
                                         GET_SML_CVECTOR_VAL(const char, attributes),
                                         cancellable,
                                         error);
}

void
mlton_g_file_input_stream_query_info_async (GFileInputStream* stream,
                                            SML_CVECTOR_VAL(const char, attributes),
                                            int io_priority,
                                            GCancellable* cancellable,
                                            GAsyncReadyCallback callback,
                                            gpointer user_data)
{
  g_file_input_stream_query_info_async (stream,
                                        GET_SML_CVECTOR_VAL(const char, attributes),
                                        io_priority,
                                        cancellable,
                                        callback,
                                        user_data);
}

GFileInfo*
mlton_g_file_output_stream_query_info (GFileOutputStream* stream,
                                       SML_CVECTOR_VAL(const char, attributes),
                                       GCancellable* cancellable,
                                       GError** error)
{
  return g_file_output_stream_query_info (stream,
                                          GET_SML_CVECTOR_VAL(const char, attributes),
                                          cancellable,
                                          error);
}

void
mlton_g_file_output_stream_query_info_async (GFileOutputStream* stream,
                                             SML_CVECTOR_VAL(const char, attributes),
                                             int io_priority,
                                             GCancellable* cancellable,
                                             GAsyncReadyCallback callback,
                                             gpointer user_data)
{
  g_file_output_stream_query_info_async (stream,
                                         GET_SML_CVECTOR_VAL(const char, attributes),
                                         io_priority,
                                         cancellable,
                                         callback,
                                         user_data);
}

char*
mlton_g_filename_completer_get_completion_suffix (GFilenameCompleter* completer,
                                                  SML_CVECTOR_VAL(const char, initial_text))
{
  return g_filename_completer_get_completion_suffix (completer,
                                                     GET_SML_CVECTOR_VAL(const char, initial_text));
}

char**
mlton_g_filename_completer_get_completions (GFilenameCompleter* completer,
                                            SML_CVECTOR_VAL(const char, initial_text))
{
  return g_filename_completer_get_completions (completer,
                                               GET_SML_CVECTOR_VAL(const char, initial_text));
}

GIOExtension*
mlton_g_io_extension_point_get_extension_by_name (GIOExtensionPoint* extension_point,
                                                  SML_CVECTOR_VAL(const char, name))
{
  return g_io_extension_point_get_extension_by_name (extension_point,
                                                     GET_SML_CVECTOR_VAL(const char, name));
}

GIOExtension*
mlton_g_io_extension_point_implement (SML_CVECTOR_VAL(const char, extension_point_name),
                                      GType type,
                                      SML_CVECTOR_VAL(const char, extension_name),
                                      gint priority)
{
  return g_io_extension_point_implement (GET_SML_CVECTOR_VAL(const char, extension_point_name),
                                         type,
                                         GET_SML_CVECTOR_VAL(const char, extension_name),
                                         priority);
}

GIOExtensionPoint*
mlton_g_io_extension_point_lookup (SML_CVECTOR_VAL(const char, name))
{
  return g_io_extension_point_lookup (GET_SML_CVECTOR_VAL(const char, name));
}

GIOExtensionPoint*
mlton_g_io_extension_point_register (SML_CVECTOR_VAL(const char, name))
{
  return g_io_extension_point_register (GET_SML_CVECTOR_VAL(const char, name));
}

GIOModule*
mlton_g_io_module_new (SML_CVECTOR_VAL(gchar, filename))
{
  return g_io_module_new (GET_SML_CVECTOR_VAL(gchar, filename));
}

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_io_module_scope_block (GIOModuleScope* scope,
                               SML_CVECTOR_VAL(const gchar, basename))
{
  g_io_module_scope_block (scope,
                           GET_SML_CVECTOR_VAL(const gchar, basename));
}
#endif

#if GLIB_CHECK_VERSION(2, 20, 0)
GIcon*
mlton_g_icon_new_for_string (SML_CVECTOR_VAL(const gchar, str),
                             GError** error)
{
  return g_icon_new_for_string (GET_SML_CVECTOR_VAL(const gchar, str),
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GInetAddress*
mlton_g_inet_address_new_from_bytes (SML_CVECTOR_VAL(guint8, bytes),
                                     GSocketFamily family)
{
  return g_inet_address_new_from_bytes (GET_SML_CVECTOR_VAL(guint8, bytes),
                                        family);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GInetAddress*
mlton_g_inet_address_new_from_string (SML_CVECTOR_VAL(const gchar, string))
{
  return g_inet_address_new_from_string (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GInetAddressMask*
mlton_g_inet_address_mask_new_from_string (SML_CVECTOR_VAL(const gchar, mask_string),
                                           GError** error)
{
  return g_inet_address_mask_new_from_string (GET_SML_CVECTOR_VAL(const gchar, mask_string),
                                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GSocketAddress*
mlton_g_inet_socket_address_new_from_string (SML_CVECTOR_VAL(const char, address),
                                             guint port)
{
  return g_inet_socket_address_new_from_string (GET_SML_CVECTOR_VAL(const char, address),
                                                port);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gpointer
mlton_g_initable_newv (GType object_type,
                       guint n_parameters,
                       SML_CVECTOR_VAL(GParameter, parameters),
                       GCancellable* cancellable,
                       GError** error)
{
  return g_initable_newv (object_type,
                          n_parameters,
                          GET_SML_CVECTOR_VAL(GParameter, parameters),
                          cancellable,
                          error);
}
#endif

gssize
mlton_g_input_stream_read (GInputStream* stream,
                           SML_CVECTOR_VAL(void, buffer),
                           gsize count,
                           GCancellable* cancellable,
                           GError** error)
{
  return g_input_stream_read (stream,
                              GET_SML_CVECTOR_VAL(void, buffer),
                              count,
                              cancellable,
                              error);
}

gboolean
mlton_g_input_stream_read_all (GInputStream* stream,
                               SML_CVECTOR_VAL(void, buffer),
                               gsize count,
                               gsize* bytes_read,
                               GCancellable* cancellable,
                               GError** error)
{
  return g_input_stream_read_all (stream,
                                  GET_SML_CVECTOR_VAL(void, buffer),
                                  count,
                                  bytes_read,
                                  cancellable,
                                  error);
}

#if GLIB_CHECK_VERSION(2, 44, 0)
void
mlton_g_input_stream_read_all_async (GInputStream* stream,
                                     SML_CVECTOR_VAL(void, buffer),
                                     gsize count,
                                     int io_priority,
                                     GCancellable* cancellable,
                                     GAsyncReadyCallback callback,
                                     gpointer user_data)
{
  g_input_stream_read_all_async (stream,
                                 GET_SML_CVECTOR_VAL(void, buffer),
                                 count,
                                 io_priority,
                                 cancellable,
                                 callback,
                                 user_data);
}
#endif

void
mlton_g_input_stream_read_async (GInputStream* stream,
                                 SML_CVECTOR_VAL(void, buffer),
                                 gsize count,
                                 int io_priority,
                                 GCancellable* cancellable,
                                 GAsyncReadyCallback callback,
                                 gpointer user_data)
{
  g_input_stream_read_async (stream,
                             GET_SML_CVECTOR_VAL(void, buffer),
                             count,
                             io_priority,
                             cancellable,
                             callback,
                             user_data);
}

#if GLIB_CHECK_VERSION(2, 44, 0)
void
mlton_g_list_store_splice (GListStore* store,
                           guint position,
                           guint n_removals,
                           SML_CVECTOR_VAL(gpointer, additions),
                           guint n_additions)
{
  g_list_store_splice (store,
                       position,
                       n_removals,
                       GET_SML_CVECTOR_VAL(gpointer, additions),
                       n_additions);
}
#endif

GInputStream*
mlton_g_loadable_icon_load (GLoadableIcon* icon,
                            int size,
                            SML_CVECTOR_REF(char, type),
                            GCancellable* cancellable,
                            GError** error)
{
  return g_loadable_icon_load (icon,
                               size,
                               GET_SML_CVECTOR_REF(char, type),
                               cancellable,
                               error);
}

GInputStream*
mlton_g_loadable_icon_load_finish (GLoadableIcon* icon,
                                   GAsyncResult* res,
                                   SML_CVECTOR_REF(char, type),
                                   GError** error)
{
  return g_loadable_icon_load_finish (icon,
                                      res,
                                      GET_SML_CVECTOR_REF(char, type),
                                      error);
}

GInputStream*
mlton_g_memory_input_stream_new_from_data (SML_CVECTOR_VAL(void, data),
                                           gssize len,
                                           GDestroyNotify destroy)
{
  return g_memory_input_stream_new_from_data (GET_SML_CVECTOR_VAL(void, data),
                                              len,
                                              destroy);
}

void
mlton_g_memory_input_stream_add_data (GMemoryInputStream* stream,
                                      SML_CVECTOR_VAL(void, data),
                                      gssize len,
                                      GDestroyNotify destroy)
{
  g_memory_input_stream_add_data (stream,
                                  GET_SML_CVECTOR_VAL(void, data),
                                  len,
                                  destroy);
}

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_append (GMenu* menu,
                     SML_CVECTOR_VAL(const gchar, label),
                     SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_menu_append (menu,
                 GET_SML_CVECTOR_VAL(const gchar, label),
                 GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_append_section (GMenu* menu,
                             SML_CVECTOR_VAL(const gchar, label),
                             GMenuModel* section)
{
  g_menu_append_section (menu,
                         GET_SML_CVECTOR_VAL(const gchar, label),
                         section);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_append_submenu (GMenu* menu,
                             SML_CVECTOR_VAL(const gchar, label),
                             GMenuModel* submenu)
{
  g_menu_append_submenu (menu,
                         GET_SML_CVECTOR_VAL(const gchar, label),
                         submenu);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_insert (GMenu* menu,
                     gint position,
                     SML_CVECTOR_VAL(const gchar, label),
                     SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_menu_insert (menu,
                 position,
                 GET_SML_CVECTOR_VAL(const gchar, label),
                 GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_insert_section (GMenu* menu,
                             gint position,
                             SML_CVECTOR_VAL(const gchar, label),
                             GMenuModel* section)
{
  g_menu_insert_section (menu,
                         position,
                         GET_SML_CVECTOR_VAL(const gchar, label),
                         section);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_insert_submenu (GMenu* menu,
                             gint position,
                             SML_CVECTOR_VAL(const gchar, label),
                             GMenuModel* submenu)
{
  g_menu_insert_submenu (menu,
                         position,
                         GET_SML_CVECTOR_VAL(const gchar, label),
                         submenu);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_prepend (GMenu* menu,
                      SML_CVECTOR_VAL(const gchar, label),
                      SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_menu_prepend (menu,
                  GET_SML_CVECTOR_VAL(const gchar, label),
                  GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_prepend_section (GMenu* menu,
                              SML_CVECTOR_VAL(const gchar, label),
                              GMenuModel* section)
{
  g_menu_prepend_section (menu,
                          GET_SML_CVECTOR_VAL(const gchar, label),
                          section);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_prepend_submenu (GMenu* menu,
                              SML_CVECTOR_VAL(const gchar, label),
                              GMenuModel* submenu)
{
  g_menu_prepend_submenu (menu,
                          GET_SML_CVECTOR_VAL(const gchar, label),
                          submenu);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_menu_attribute_iter_get_next (GMenuAttributeIter* iter,
                                      SML_CVECTOR_REF(const gchar, out_name),
                                      GVariant** value)
{
  return g_menu_attribute_iter_get_next (iter,
                                         GET_SML_CVECTOR_REF(const gchar, out_name),
                                         value);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GMenuItem*
mlton_g_menu_item_new (SML_CVECTOR_VAL(const gchar, label),
                       SML_CVECTOR_VAL(const gchar, detailed_action))
{
  return g_menu_item_new (GET_SML_CVECTOR_VAL(const gchar, label),
                          GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GMenuItem*
mlton_g_menu_item_new_section (SML_CVECTOR_VAL(const gchar, label),
                               GMenuModel* section)
{
  return g_menu_item_new_section (GET_SML_CVECTOR_VAL(const gchar, label),
                                  section);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GMenuItem*
mlton_g_menu_item_new_submenu (SML_CVECTOR_VAL(const gchar, label),
                               GMenuModel* submenu)
{
  return g_menu_item_new_submenu (GET_SML_CVECTOR_VAL(const gchar, label),
                                  submenu);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
GVariant*
mlton_g_menu_item_get_attribute_value (GMenuItem* menu_item,
                                       SML_CVECTOR_VAL(const gchar, attribute),
                                       const GVariantType* expected_type)
{
  return g_menu_item_get_attribute_value (menu_item,
                                          GET_SML_CVECTOR_VAL(const gchar, attribute),
                                          expected_type);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
GMenuModel*
mlton_g_menu_item_get_link (GMenuItem* menu_item,
                            SML_CVECTOR_VAL(const gchar, link))
{
  return g_menu_item_get_link (menu_item,
                               GET_SML_CVECTOR_VAL(const gchar, link));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_item_set_action_and_target_value (GMenuItem* menu_item,
                                               SML_CVECTOR_VAL(const gchar, action),
                                               GVariant* target_value)
{
  g_menu_item_set_action_and_target_value (menu_item,
                                           GET_SML_CVECTOR_VAL(const gchar, action),
                                           target_value);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_item_set_attribute_value (GMenuItem* menu_item,
                                       SML_CVECTOR_VAL(const gchar, attribute),
                                       GVariant* value)
{
  g_menu_item_set_attribute_value (menu_item,
                                   GET_SML_CVECTOR_VAL(const gchar, attribute),
                                   value);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_item_set_detailed_action (GMenuItem* menu_item,
                                       SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_menu_item_set_detailed_action (menu_item,
                                   GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_item_set_label (GMenuItem* menu_item,
                             SML_CVECTOR_VAL(const gchar, label))
{
  g_menu_item_set_label (menu_item,
                         GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_menu_item_set_link (GMenuItem* menu_item,
                            SML_CVECTOR_VAL(const gchar, link),
                            GMenuModel* model)
{
  g_menu_item_set_link (menu_item,
                        GET_SML_CVECTOR_VAL(const gchar, link),
                        model);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_menu_link_iter_get_next (GMenuLinkIter* iter,
                                 SML_CVECTOR_REF(const gchar, out_link),
                                 GMenuModel** value)
{
  return g_menu_link_iter_get_next (iter,
                                    GET_SML_CVECTOR_REF(const gchar, out_link),
                                    value);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GVariant*
mlton_g_menu_model_get_item_attribute_value (GMenuModel* model,
                                             gint item_index,
                                             SML_CVECTOR_VAL(const gchar, attribute),
                                             const GVariantType* expected_type)
{
  return g_menu_model_get_item_attribute_value (model,
                                                item_index,
                                                GET_SML_CVECTOR_VAL(const gchar, attribute),
                                                expected_type);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GMenuModel*
mlton_g_menu_model_get_item_link (GMenuModel* model,
                                  gint item_index,
                                  SML_CVECTOR_VAL(const gchar, link))
{
  return g_menu_model_get_item_link (model,
                                     item_index,
                                     GET_SML_CVECTOR_VAL(const gchar, link));
}
#endif

void
mlton_g_mount_operation_set_domain (GMountOperation* op,
                                    SML_CVECTOR_VAL(const char, domain))
{
  g_mount_operation_set_domain (op,
                                GET_SML_CVECTOR_VAL(const char, domain));
}

void
mlton_g_mount_operation_set_password (GMountOperation* op,
                                      SML_CVECTOR_VAL(const char, password))
{
  g_mount_operation_set_password (op,
                                  GET_SML_CVECTOR_VAL(const char, password));
}

void
mlton_g_mount_operation_set_username (GMountOperation* op,
                                      SML_CVECTOR_VAL(const char, username))
{
  g_mount_operation_set_username (op,
                                  GET_SML_CVECTOR_VAL(const char, username));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
GSocketConnectable*
mlton_g_network_address_new (SML_CVECTOR_VAL(const gchar, hostname),
                             guint16 port)
{
  return g_network_address_new (GET_SML_CVECTOR_VAL(const gchar, hostname),
                                port);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GSocketConnectable*
mlton_g_network_address_parse (SML_CVECTOR_VAL(const gchar, host_and_port),
                               guint16 default_port,
                               GError** error)
{
  return g_network_address_parse (GET_SML_CVECTOR_VAL(const gchar, host_and_port),
                                  default_port,
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSocketConnectable*
mlton_g_network_address_parse_uri (SML_CVECTOR_VAL(const gchar, uri),
                                   guint16 default_port,
                                   GError** error)
{
  return g_network_address_parse_uri (GET_SML_CVECTOR_VAL(const gchar, uri),
                                      default_port,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GSocketConnectable*
mlton_g_network_service_new (SML_CVECTOR_VAL(const gchar, service),
                             SML_CVECTOR_VAL(const gchar, protocol),
                             SML_CVECTOR_VAL(const gchar, domain))
{
  return g_network_service_new (GET_SML_CVECTOR_VAL(const gchar, service),
                                GET_SML_CVECTOR_VAL(const gchar, protocol),
                                GET_SML_CVECTOR_VAL(const gchar, domain));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_network_service_set_scheme (GNetworkService* srv,
                                    SML_CVECTOR_VAL(const gchar, scheme))
{
  g_network_service_set_scheme (srv,
                                GET_SML_CVECTOR_VAL(const gchar, scheme));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GNotification*
mlton_g_notification_new (SML_CVECTOR_VAL(const gchar, title))
{
  return g_notification_new (GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_add_button (GNotification* notification,
                                 SML_CVECTOR_VAL(const gchar, label),
                                 SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_notification_add_button (notification,
                             GET_SML_CVECTOR_VAL(const gchar, label),
                             GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_add_button_with_target_value (GNotification* notification,
                                                   SML_CVECTOR_VAL(const gchar, label),
                                                   SML_CVECTOR_VAL(const gchar, action),
                                                   GVariant* target)
{
  g_notification_add_button_with_target_value (notification,
                                               GET_SML_CVECTOR_VAL(const gchar, label),
                                               GET_SML_CVECTOR_VAL(const gchar, action),
                                               target);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_set_body (GNotification* notification,
                               SML_CVECTOR_VAL(const gchar, body))
{
  g_notification_set_body (notification,
                           GET_SML_CVECTOR_VAL(const gchar, body));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_set_default_action (GNotification* notification,
                                         SML_CVECTOR_VAL(const gchar, detailed_action))
{
  g_notification_set_default_action (notification,
                                     GET_SML_CVECTOR_VAL(const gchar, detailed_action));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_set_default_action_and_target_value (GNotification* notification,
                                                          SML_CVECTOR_VAL(const gchar, action),
                                                          GVariant* target)
{
  g_notification_set_default_action_and_target_value (notification,
                                                      GET_SML_CVECTOR_VAL(const gchar, action),
                                                      target);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_notification_set_title (GNotification* notification,
                                SML_CVECTOR_VAL(const gchar, title))
{
  g_notification_set_title (notification,
                            GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

gssize
mlton_g_output_stream_write (GOutputStream* stream,
                             SML_CVECTOR_VAL(void, buffer),
                             gsize count,
                             GCancellable* cancellable,
                             GError** error)
{
  return g_output_stream_write (stream,
                                GET_SML_CVECTOR_VAL(void, buffer),
                                count,
                                cancellable,
                                error);
}

gboolean
mlton_g_output_stream_write_all (GOutputStream* stream,
                                 SML_CVECTOR_VAL(void, buffer),
                                 gsize count,
                                 gsize* bytes_written,
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_output_stream_write_all (stream,
                                    GET_SML_CVECTOR_VAL(void, buffer),
                                    count,
                                    bytes_written,
                                    cancellable,
                                    error);
}

#if GLIB_CHECK_VERSION(2, 44, 0)
void
mlton_g_output_stream_write_all_async (GOutputStream* stream,
                                       SML_CVECTOR_VAL(void, buffer),
                                       gsize count,
                                       int io_priority,
                                       GCancellable* cancellable,
                                       GAsyncReadyCallback callback,
                                       gpointer user_data)
{
  g_output_stream_write_all_async (stream,
                                   GET_SML_CVECTOR_VAL(void, buffer),
                                   count,
                                   io_priority,
                                   cancellable,
                                   callback,
                                   user_data);
}
#endif

void
mlton_g_output_stream_write_async (GOutputStream* stream,
                                   SML_CVECTOR_VAL(void, buffer),
                                   gsize count,
                                   int io_priority,
                                   GCancellable* cancellable,
                                   GAsyncReadyCallback callback,
                                   gpointer user_data)
{
  g_output_stream_write_async (stream,
                               GET_SML_CVECTOR_VAL(void, buffer),
                               count,
                               io_priority,
                               cancellable,
                               callback,
                               user_data);
}

gssize
mlton_g_pollable_input_stream_read_nonblocking (GPollableInputStream* stream,
                                                SML_CVECTOR_VAL(void, buffer),
                                                gsize count,
                                                GCancellable* cancellable,
                                                GError** error)
{
  return g_pollable_input_stream_read_nonblocking (stream,
                                                   GET_SML_CVECTOR_VAL(void, buffer),
                                                   count,
                                                   cancellable,
                                                   error);
}

gssize
mlton_g_pollable_output_stream_write_nonblocking (GPollableOutputStream* stream,
                                                  SML_CVECTOR_VAL(void, buffer),
                                                  gsize count,
                                                  GCancellable* cancellable,
                                                  GError** error)
{
  return g_pollable_output_stream_write_nonblocking (stream,
                                                     GET_SML_CVECTOR_VAL(void, buffer),
                                                     count,
                                                     cancellable,
                                                     error);
}

#if GLIB_CHECK_VERSION(2, 38, 0)
GPropertyAction*
mlton_g_property_action_new (SML_CVECTOR_VAL(const gchar, name),
                             gpointer object,
                             SML_CVECTOR_VAL(const gchar, property_name))
{
  return g_property_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                                object,
                                GET_SML_CVECTOR_VAL(const gchar, property_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GProxy*
mlton_g_proxy_get_default_for_protocol (SML_CVECTOR_VAL(const gchar, protocol))
{
  return g_proxy_get_default_for_protocol (GET_SML_CVECTOR_VAL(const gchar, protocol));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSocketAddress*
mlton_g_proxy_address_new (GInetAddress* inetaddr,
                           guint16 port,
                           SML_CVECTOR_VAL(const gchar, protocol),
                           SML_CVECTOR_VAL(const gchar, dest_hostname),
                           guint16 dest_port,
                           SML_CVECTOR_VAL(const gchar, username),
                           SML_CVECTOR_VAL(const gchar, password))
{
  return g_proxy_address_new (inetaddr,
                              port,
                              GET_SML_CVECTOR_VAL(const gchar, protocol),
                              GET_SML_CVECTOR_VAL(const gchar, dest_hostname),
                              dest_port,
                              GET_SML_CVECTOR_VAL(const gchar, username),
                              GET_SML_CVECTOR_VAL(const gchar, password));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gchar**
mlton_g_proxy_resolver_lookup (GProxyResolver* resolver,
                               SML_CVECTOR_VAL(const gchar, uri),
                               GCancellable* cancellable,
                               GError** error)
{
  return g_proxy_resolver_lookup (resolver,
                                  GET_SML_CVECTOR_VAL(const gchar, uri),
                                  cancellable,
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_proxy_resolver_lookup_async (GProxyResolver* resolver,
                                     SML_CVECTOR_VAL(const gchar, uri),
                                     GCancellable* cancellable,
                                     GAsyncReadyCallback callback,
                                     gpointer user_data)
{
  g_proxy_resolver_lookup_async (resolver,
                                 GET_SML_CVECTOR_VAL(const gchar, uri),
                                 cancellable,
                                 callback,
                                 user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_remote_action_group_activate_action_full (GRemoteActionGroup* remote,
                                                  SML_CVECTOR_VAL(const gchar, action_name),
                                                  GVariant* parameter,
                                                  GVariant* platform_data)
{
  g_remote_action_group_activate_action_full (remote,
                                              GET_SML_CVECTOR_VAL(const gchar, action_name),
                                              parameter,
                                              platform_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
void
mlton_g_remote_action_group_change_action_state_full (GRemoteActionGroup* remote,
                                                      SML_CVECTOR_VAL(const gchar, action_name),
                                                      GVariant* value,
                                                      GVariant* platform_data)
{
  g_remote_action_group_change_action_state_full (remote,
                                                  GET_SML_CVECTOR_VAL(const gchar, action_name),
                                                  value,
                                                  platform_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GList*
mlton_g_resolver_lookup_by_name (GResolver* resolver,
                                 SML_CVECTOR_VAL(const gchar, hostname),
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_resolver_lookup_by_name (resolver,
                                    GET_SML_CVECTOR_VAL(const gchar, hostname),
                                    cancellable,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_resolver_lookup_by_name_async (GResolver* resolver,
                                       SML_CVECTOR_VAL(const gchar, hostname),
                                       GCancellable* cancellable,
                                       GAsyncReadyCallback callback,
                                       gpointer user_data)
{
  g_resolver_lookup_by_name_async (resolver,
                                   GET_SML_CVECTOR_VAL(const gchar, hostname),
                                   cancellable,
                                   callback,
                                   user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
GList*
mlton_g_resolver_lookup_records (GResolver* resolver,
                                 SML_CVECTOR_VAL(const gchar, rrname),
                                 GResolverRecordType record_type,
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_resolver_lookup_records (resolver,
                                    GET_SML_CVECTOR_VAL(const gchar, rrname),
                                    record_type,
                                    cancellable,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
void
mlton_g_resolver_lookup_records_async (GResolver* resolver,
                                       SML_CVECTOR_VAL(const gchar, rrname),
                                       GResolverRecordType record_type,
                                       GCancellable* cancellable,
                                       GAsyncReadyCallback callback,
                                       gpointer user_data)
{
  g_resolver_lookup_records_async (resolver,
                                   GET_SML_CVECTOR_VAL(const gchar, rrname),
                                   record_type,
                                   cancellable,
                                   callback,
                                   user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GList*
mlton_g_resolver_lookup_service (GResolver* resolver,
                                 SML_CVECTOR_VAL(const gchar, service),
                                 SML_CVECTOR_VAL(const gchar, protocol),
                                 SML_CVECTOR_VAL(const gchar, domain),
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_resolver_lookup_service (resolver,
                                    GET_SML_CVECTOR_VAL(const gchar, service),
                                    GET_SML_CVECTOR_VAL(const gchar, protocol),
                                    GET_SML_CVECTOR_VAL(const gchar, domain),
                                    cancellable,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_resolver_lookup_service_async (GResolver* resolver,
                                       SML_CVECTOR_VAL(const gchar, service),
                                       SML_CVECTOR_VAL(const gchar, protocol),
                                       SML_CVECTOR_VAL(const gchar, domain),
                                       GCancellable* cancellable,
                                       GAsyncReadyCallback callback,
                                       gpointer user_data)
{
  g_resolver_lookup_service_async (resolver,
                                   GET_SML_CVECTOR_VAL(const gchar, service),
                                   GET_SML_CVECTOR_VAL(const gchar, protocol),
                                   GET_SML_CVECTOR_VAL(const gchar, domain),
                                   cancellable,
                                   callback,
                                   user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
char**
mlton_g_resource_enumerate_children (GResource* resource,
                                     SML_CVECTOR_VAL(const char, path),
                                     GResourceLookupFlags lookup_flags,
                                     GError** error)
{
  return g_resource_enumerate_children (resource,
                                        GET_SML_CVECTOR_VAL(const char, path),
                                        lookup_flags,
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_resource_get_info (GResource* resource,
                           SML_CVECTOR_VAL(const char, path),
                           GResourceLookupFlags lookup_flags,
                           gsize* size,
                           guint32* flags,
                           GError** error)
{
  return g_resource_get_info (resource,
                              GET_SML_CVECTOR_VAL(const char, path),
                              lookup_flags,
                              size,
                              flags,
                              error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GBytes*
mlton_g_resource_lookup_data (GResource* resource,
                              SML_CVECTOR_VAL(const char, path),
                              GResourceLookupFlags lookup_flags,
                              GError** error)
{
  return g_resource_lookup_data (resource,
                                 GET_SML_CVECTOR_VAL(const char, path),
                                 lookup_flags,
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GInputStream*
mlton_g_resource_open_stream (GResource* resource,
                              SML_CVECTOR_VAL(const char, path),
                              GResourceLookupFlags lookup_flags,
                              GError** error)
{
  return g_resource_open_stream (resource,
                                 GET_SML_CVECTOR_VAL(const char, path),
                                 lookup_flags,
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GResource*
mlton_g_resource_load (SML_CVECTOR_VAL(gchar, filename),
                       GError** error)
{
  return g_resource_load (GET_SML_CVECTOR_VAL(gchar, filename),
                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSettings*
mlton_g_settings_new (SML_CVECTOR_VAL(const gchar, schema_id))
{
  return g_settings_new (GET_SML_CVECTOR_VAL(const gchar, schema_id));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GSettings*
mlton_g_settings_new_full (GSettingsSchema* schema,
                           GSettingsBackend* backend,
                           SML_CVECTOR_VAL(const gchar, path))
{
  return g_settings_new_full (schema,
                              backend,
                              GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSettings*
mlton_g_settings_new_with_backend (SML_CVECTOR_VAL(const gchar, schema_id),
                                   GSettingsBackend* backend)
{
  return g_settings_new_with_backend (GET_SML_CVECTOR_VAL(const gchar, schema_id),
                                      backend);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSettings*
mlton_g_settings_new_with_backend_and_path (SML_CVECTOR_VAL(const gchar, schema_id),
                                            GSettingsBackend* backend,
                                            SML_CVECTOR_VAL(const gchar, path))
{
  return g_settings_new_with_backend_and_path (GET_SML_CVECTOR_VAL(const gchar, schema_id),
                                               backend,
                                               GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSettings*
mlton_g_settings_new_with_path (SML_CVECTOR_VAL(const gchar, schema_id),
                                SML_CVECTOR_VAL(const gchar, path))
{
  return g_settings_new_with_path (GET_SML_CVECTOR_VAL(const gchar, schema_id),
                                   GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_settings_unbind (gpointer object,
                         SML_CVECTOR_VAL(const gchar, property))
{
  g_settings_unbind (object,
                     GET_SML_CVECTOR_VAL(const gchar, property));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_settings_bind (GSettings* settings,
                       SML_CVECTOR_VAL(const gchar, key),
                       gpointer object,
                       SML_CVECTOR_VAL(const gchar, property),
                       GSettingsBindFlags flags)
{
  g_settings_bind (settings,
                   GET_SML_CVECTOR_VAL(const gchar, key),
                   object,
                   GET_SML_CVECTOR_VAL(const gchar, property),
                   flags);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_settings_bind_writable (GSettings* settings,
                                SML_CVECTOR_VAL(const gchar, key),
                                gpointer object,
                                SML_CVECTOR_VAL(const gchar, property),
                                gboolean inverted)
{
  g_settings_bind_writable (settings,
                            GET_SML_CVECTOR_VAL(const gchar, key),
                            object,
                            GET_SML_CVECTOR_VAL(const gchar, property),
                            inverted);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GAction*
mlton_g_settings_create_action (GSettings* settings,
                                SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_create_action (settings,
                                   GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_get_boolean (GSettings* settings,
                              SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_boolean (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSettings*
mlton_g_settings_get_child (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, name))
{
  return g_settings_get_child (settings,
                               GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GVariant*
mlton_g_settings_get_default_value (GSettings* settings,
                                    SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_default_value (settings,
                                       GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gdouble
mlton_g_settings_get_double (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_double (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gint
mlton_g_settings_get_enum (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_enum (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_settings_get_flags (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_flags (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gint
mlton_g_settings_get_int (GSettings* settings,
                          SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_int (settings,
                             GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
gint64
mlton_g_settings_get_int64 (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_int64 (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

gpointer
mlton_g_settings_get_mapped (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key),
                             GSettingsGetMapping mapping,
                             gpointer user_data)
{
  return g_settings_get_mapped (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                mapping,
                                user_data);
}

#if GLIB_CHECK_VERSION(2, 28, 0)
GVariant*
mlton_g_settings_get_range (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_range (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gchar*
mlton_g_settings_get_string (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_string (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gchar**
mlton_g_settings_get_strv (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_strv (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
guint
mlton_g_settings_get_uint (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_uint (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
guint64
mlton_g_settings_get_uint64 (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_uint64 (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GVariant*
mlton_g_settings_get_user_value (GSettings* settings,
                                 SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_user_value (settings,
                                    GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GVariant*
mlton_g_settings_get_value (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key))
{
  return g_settings_get_value (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_is_writable (GSettings* settings,
                              SML_CVECTOR_VAL(const gchar, name))
{
  return g_settings_is_writable (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
gboolean
mlton_g_settings_range_check (GSettings* settings,
                              SML_CVECTOR_VAL(const gchar, key),
                              GVariant* value)
{
  return g_settings_range_check (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 value);
}
#endif

void
mlton_g_settings_reset (GSettings* settings,
                        SML_CVECTOR_VAL(const gchar, key))
{
  g_settings_reset (settings,
                    GET_SML_CVECTOR_VAL(const gchar, key));
}

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_boolean (GSettings* settings,
                              SML_CVECTOR_VAL(const gchar, key),
                              gboolean value)
{
  return g_settings_set_boolean (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 value);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_double (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key),
                             gdouble value)
{
  return g_settings_set_double (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                value);
}
#endif

gboolean
mlton_g_settings_set_enum (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key),
                           gint value)
{
  return g_settings_set_enum (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key),
                              value);
}

gboolean
mlton_g_settings_set_flags (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key),
                            guint value)
{
  return g_settings_set_flags (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               value);
}

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_int (GSettings* settings,
                          SML_CVECTOR_VAL(const gchar, key),
                          gint value)
{
  return g_settings_set_int (settings,
                             GET_SML_CVECTOR_VAL(const gchar, key),
                             value);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
gboolean
mlton_g_settings_set_int64 (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key),
                            gint64 value)
{
  return g_settings_set_int64 (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               value);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_string (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key),
                             SML_CVECTOR_VAL(const gchar, value))
{
  return g_settings_set_string (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_strv (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key),
                           SML_CVECTORVECTOR_VAL(const gchar, value))
{
  return g_settings_set_strv (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key),
                              GET_SML_CVECTORVECTOR_VAL(const gchar, value));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
gboolean
mlton_g_settings_set_uint (GSettings* settings,
                           SML_CVECTOR_VAL(const gchar, key),
                           guint value)
{
  return g_settings_set_uint (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key),
                              value);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
gboolean
mlton_g_settings_set_uint64 (GSettings* settings,
                             SML_CVECTOR_VAL(const gchar, key),
                             guint64 value)
{
  return g_settings_set_uint64 (settings,
                                GET_SML_CVECTOR_VAL(const gchar, key),
                                value);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_settings_set_value (GSettings* settings,
                            SML_CVECTOR_VAL(const gchar, key),
                            GVariant* value)
{
  return g_settings_set_value (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               value);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GSettingsSchemaKey*
mlton_g_settings_schema_get_key (GSettingsSchema* schema,
                                 SML_CVECTOR_VAL(const gchar, name))
{
  return g_settings_schema_get_key (schema,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
gboolean
mlton_g_settings_schema_has_key (GSettingsSchema* schema,
                                 SML_CVECTOR_VAL(const gchar, name))
{
  return g_settings_schema_has_key (schema,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GSettingsSchemaSource*
mlton_g_settings_schema_source_new_from_directory (SML_CVECTOR_VAL(gchar, directory),
                                                   GSettingsSchemaSource* parent,
                                                   gboolean trusted,
                                                   GError** error)
{
  return g_settings_schema_source_new_from_directory (GET_SML_CVECTOR_VAL(gchar, directory),
                                                      parent,
                                                      trusted,
                                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_settings_schema_source_list_schemas (GSettingsSchemaSource* source,
                                             gboolean recursive,
                                             SML_CVECTORVECTOR_REF(gchar, non_relocatable),
                                             SML_CVECTORVECTOR_REF(gchar, relocatable))
{
  g_settings_schema_source_list_schemas (source,
                                         recursive,
                                         GET_SML_CVECTORVECTOR_REF(gchar, non_relocatable),
                                         GET_SML_CVECTORVECTOR_REF(gchar, relocatable));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GSettingsSchema*
mlton_g_settings_schema_source_lookup (GSettingsSchemaSource* source,
                                       SML_CVECTOR_VAL(const gchar, schema_id),
                                       gboolean recursive)
{
  return g_settings_schema_source_lookup (source,
                                          GET_SML_CVECTOR_VAL(const gchar, schema_id),
                                          recursive);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GSimpleAction*
mlton_g_simple_action_new (SML_CVECTOR_VAL(const gchar, name),
                           const GVariantType* parameter_type)
{
  return g_simple_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                              parameter_type);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GSimpleAction*
mlton_g_simple_action_new_stateful (SML_CVECTOR_VAL(const gchar, name),
                                    const GVariantType* parameter_type,
                                    GVariant* state)
{
  return g_simple_action_new_stateful (GET_SML_CVECTOR_VAL(const gchar, name),
                                       parameter_type,
                                       state);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_simple_action_group_add_entries (GSimpleActionGroup* simple,
                                         SML_CVECTOR_VAL(GActionEntry, entries),
                                         gint n_entries,
                                         gpointer user_data)
{
  g_simple_action_group_add_entries (simple,
                                     GET_SML_CVECTOR_VAL(GActionEntry, entries),
                                     n_entries,
                                     user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GAction*
mlton_g_simple_action_group_lookup (GSimpleActionGroup* simple,
                                    SML_CVECTOR_VAL(const gchar, action_name))
{
  return g_simple_action_group_lookup (simple,
                                       GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
void
mlton_g_simple_action_group_remove (GSimpleActionGroup* simple,
                                    SML_CVECTOR_VAL(const gchar, action_name))
{
  g_simple_action_group_remove (simple,
                                GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
GProxyResolver*
mlton_g_simple_proxy_resolver_new (SML_CVECTOR_VAL(const gchar, default_proxy),
                                   SML_CVECTOR_VAL(gchar*, ignore_hosts))
{
  return g_simple_proxy_resolver_new (GET_SML_CVECTOR_VAL(const gchar, default_proxy),
                                      GET_SML_CVECTOR_VAL(gchar*, ignore_hosts));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
void
mlton_g_simple_proxy_resolver_set_default_proxy (GSimpleProxyResolver* resolver,
                                                 SML_CVECTOR_VAL(const gchar, default_proxy))
{
  g_simple_proxy_resolver_set_default_proxy (resolver,
                                             GET_SML_CVECTOR_VAL(const gchar, default_proxy));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
void
mlton_g_simple_proxy_resolver_set_ignore_hosts (GSimpleProxyResolver* resolver,
                                                SML_CVECTOR_VAL(gchar*, ignore_hosts))
{
  g_simple_proxy_resolver_set_ignore_hosts (resolver,
                                            GET_SML_CVECTOR_VAL(gchar*, ignore_hosts));
}
#endif

#if GLIB_CHECK_VERSION(2, 36, 0)
void
mlton_g_simple_proxy_resolver_set_uri_proxy (GSimpleProxyResolver* resolver,
                                             SML_CVECTOR_VAL(const gchar, uri_scheme),
                                             SML_CVECTOR_VAL(const gchar, proxy))
{
  g_simple_proxy_resolver_set_uri_proxy (resolver,
                                         GET_SML_CVECTOR_VAL(const gchar, uri_scheme),
                                         GET_SML_CVECTOR_VAL(const gchar, proxy));
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_socket_join_multicast_group (GSocket* socket,
                                     GInetAddress* group,
                                     gboolean source_specific,
                                     SML_CVECTOR_VAL(const gchar, iface),
                                     GError** error)
{
  return g_socket_join_multicast_group (socket,
                                        group,
                                        source_specific,
                                        GET_SML_CVECTOR_VAL(const gchar, iface),
                                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_socket_leave_multicast_group (GSocket* socket,
                                      GInetAddress* group,
                                      gboolean source_specific,
                                      SML_CVECTOR_VAL(const gchar, iface),
                                      GError** error)
{
  return g_socket_leave_multicast_group (socket,
                                         group,
                                         source_specific,
                                         GET_SML_CVECTOR_VAL(const gchar, iface),
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_receive (GSocket* socket,
                        SML_CVECTOR_VAL(gchar, buffer),
                        gsize size,
                        GCancellable* cancellable,
                        GError** error)
{
  return g_socket_receive (socket,
                           GET_SML_CVECTOR_VAL(gchar, buffer),
                           size,
                           cancellable,
                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_receive_from (GSocket* socket,
                             GSocketAddress** address,
                             SML_CVECTOR_VAL(gchar, buffer),
                             gsize size,
                             GCancellable* cancellable,
                             GError** error)
{
  return g_socket_receive_from (socket,
                                address,
                                GET_SML_CVECTOR_VAL(gchar, buffer),
                                size,
                                cancellable,
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_receive_message (GSocket* socket,
                                GSocketAddress** address,
                                SML_CVECTOR_VAL(GInputVector, vectors),
                                gint num_vectors,
                                SML_CVECTOR_REF(GSocketControlMessage*, messages),
                                gint* num_messages,
                                gint* flags,
                                GCancellable* cancellable,
                                GError** error)
{
  return g_socket_receive_message (socket,
                                   address,
                                   GET_SML_CVECTOR_VAL(GInputVector, vectors),
                                   num_vectors,
                                   GET_SML_CVECTOR_REF(GSocketControlMessage*, messages),
                                   num_messages,
                                   flags,
                                   cancellable,
                                   error);
}
#endif

#if GLIB_CHECK_VERSION(2, 48, 0)
gint
mlton_g_socket_receive_messages (GSocket* socket,
                                 SML_CVECTOR_VAL(GInputMessage, messages),
                                 guint num_messages,
                                 gint flags,
                                 GCancellable* cancellable,
                                 GError** error)
{
  return g_socket_receive_messages (socket,
                                    GET_SML_CVECTOR_VAL(GInputMessage, messages),
                                    num_messages,
                                    flags,
                                    cancellable,
                                    error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gssize
mlton_g_socket_receive_with_blocking (GSocket* socket,
                                      SML_CVECTOR_VAL(gchar, buffer),
                                      gsize size,
                                      gboolean blocking,
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_socket_receive_with_blocking (socket,
                                         GET_SML_CVECTOR_VAL(gchar, buffer),
                                         size,
                                         blocking,
                                         cancellable,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_send (GSocket* socket,
                     SML_CVECTOR_VAL(gchar, buffer),
                     gsize size,
                     GCancellable* cancellable,
                     GError** error)
{
  return g_socket_send (socket,
                        GET_SML_CVECTOR_VAL(gchar, buffer),
                        size,
                        cancellable,
                        error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_send_message (GSocket* socket,
                             GSocketAddress* address,
                             SML_CVECTOR_VAL(GOutputVector, vectors),
                             gint num_vectors,
                             SML_CVECTOR_VAL(GSocketControlMessage*, messages),
                             gint num_messages,
                             gint flags,
                             GCancellable* cancellable,
                             GError** error)
{
  return g_socket_send_message (socket,
                                address,
                                GET_SML_CVECTOR_VAL(GOutputVector, vectors),
                                num_vectors,
                                GET_SML_CVECTOR_VAL(GSocketControlMessage*, messages),
                                num_messages,
                                flags,
                                cancellable,
                                error);
}
#endif

#if GLIB_CHECK_VERSION(2, 44, 0)
gint
mlton_g_socket_send_messages (GSocket* socket,
                              SML_CVECTOR_VAL(GOutputMessage, messages),
                              guint num_messages,
                              gint flags,
                              GCancellable* cancellable,
                              GError** error)
{
  return g_socket_send_messages (socket,
                                 GET_SML_CVECTOR_VAL(GOutputMessage, messages),
                                 num_messages,
                                 flags,
                                 cancellable,
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
gssize
mlton_g_socket_send_to (GSocket* socket,
                        GSocketAddress* address,
                        SML_CVECTOR_VAL(gchar, buffer),
                        gsize size,
                        GCancellable* cancellable,
                        GError** error)
{
  return g_socket_send_to (socket,
                           address,
                           GET_SML_CVECTOR_VAL(gchar, buffer),
                           size,
                           cancellable,
                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gssize
mlton_g_socket_send_with_blocking (GSocket* socket,
                                   SML_CVECTOR_VAL(gchar, buffer),
                                   gsize size,
                                   gboolean blocking,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_socket_send_with_blocking (socket,
                                      GET_SML_CVECTOR_VAL(gchar, buffer),
                                      size,
                                      blocking,
                                      cancellable,
                                      error);
}
#endif

void
mlton_g_socket_client_add_application_proxy (GSocketClient* client,
                                             SML_CVECTOR_VAL(const gchar, protocol))
{
  g_socket_client_add_application_proxy (client,
                                         GET_SML_CVECTOR_VAL(const gchar, protocol));
}

#if GLIB_CHECK_VERSION(2, 22, 0)
GSocketConnection*
mlton_g_socket_client_connect_to_host (GSocketClient* client,
                                       SML_CVECTOR_VAL(const gchar, host_and_port),
                                       guint16 default_port,
                                       GCancellable* cancellable,
                                       GError** error)
{
  return g_socket_client_connect_to_host (client,
                                          GET_SML_CVECTOR_VAL(const gchar, host_and_port),
                                          default_port,
                                          cancellable,
                                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_socket_client_connect_to_host_async (GSocketClient* client,
                                             SML_CVECTOR_VAL(const gchar, host_and_port),
                                             guint16 default_port,
                                             GCancellable* cancellable,
                                             GAsyncReadyCallback callback,
                                             gpointer user_data)
{
  g_socket_client_connect_to_host_async (client,
                                         GET_SML_CVECTOR_VAL(const gchar, host_and_port),
                                         default_port,
                                         cancellable,
                                         callback,
                                         user_data);
}
#endif

GSocketConnection*
mlton_g_socket_client_connect_to_service (GSocketClient* client,
                                          SML_CVECTOR_VAL(const gchar, domain),
                                          SML_CVECTOR_VAL(const gchar, service),
                                          GCancellable* cancellable,
                                          GError** error)
{
  return g_socket_client_connect_to_service (client,
                                             GET_SML_CVECTOR_VAL(const gchar, domain),
                                             GET_SML_CVECTOR_VAL(const gchar, service),
                                             cancellable,
                                             error);
}

#if GLIB_CHECK_VERSION(2, 22, 0)
void
mlton_g_socket_client_connect_to_service_async (GSocketClient* client,
                                                SML_CVECTOR_VAL(const gchar, domain),
                                                SML_CVECTOR_VAL(const gchar, service),
                                                GCancellable* cancellable,
                                                GAsyncReadyCallback callback,
                                                gpointer user_data)
{
  g_socket_client_connect_to_service_async (client,
                                            GET_SML_CVECTOR_VAL(const gchar, domain),
                                            GET_SML_CVECTOR_VAL(const gchar, service),
                                            cancellable,
                                            callback,
                                            user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GSocketConnection*
mlton_g_socket_client_connect_to_uri (GSocketClient* client,
                                      SML_CVECTOR_VAL(const gchar, uri),
                                      guint16 default_port,
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_socket_client_connect_to_uri (client,
                                         GET_SML_CVECTOR_VAL(const gchar, uri),
                                         default_port,
                                         cancellable,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_socket_client_connect_to_uri_async (GSocketClient* client,
                                            SML_CVECTOR_VAL(const gchar, uri),
                                            guint16 default_port,
                                            GCancellable* cancellable,
                                            GAsyncReadyCallback callback,
                                            gpointer user_data)
{
  g_socket_client_connect_to_uri_async (client,
                                        GET_SML_CVECTOR_VAL(const gchar, uri),
                                        default_port,
                                        cancellable,
                                        callback,
                                        user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GSrvTarget*
mlton_g_srv_target_new (SML_CVECTOR_VAL(const gchar, hostname),
                        guint16 port,
                        guint16 priority,
                        guint16 weight)
{
  return g_srv_target_new (GET_SML_CVECTOR_VAL(const gchar, hostname),
                           port,
                           priority,
                           weight);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GSubprocess*
mlton_g_subprocess_newv (SML_CVECTORVECTOR_VAL(const gchar, argv),
                         GSubprocessFlags flags,
                         GError** error)
{
  return g_subprocess_newv (GET_SML_CVECTORVECTOR_VAL(const gchar, argv),
                            flags,
                            error);
}
#endif

gboolean
mlton_g_subprocess_communicate_utf8 (GSubprocess* subprocess,
                                     SML_CVECTOR_VAL(const char, stdin_buf),
                                     GCancellable* cancellable,
                                     SML_CVECTOR_REF(char, stdout_buf),
                                     SML_CVECTOR_REF(char, stderr_buf),
                                     GError** error)
{
  return g_subprocess_communicate_utf8 (subprocess,
                                        GET_SML_CVECTOR_VAL(const char, stdin_buf),
                                        cancellable,
                                        GET_SML_CVECTOR_REF(char, stdout_buf),
                                        GET_SML_CVECTOR_REF(char, stderr_buf),
                                        error);
}

void
mlton_g_subprocess_communicate_utf8_async (GSubprocess* subprocess,
                                           SML_CVECTOR_VAL(const char, stdin_buf),
                                           GCancellable* cancellable,
                                           GAsyncReadyCallback callback,
                                           gpointer user_data)
{
  g_subprocess_communicate_utf8_async (subprocess,
                                       GET_SML_CVECTOR_VAL(const char, stdin_buf),
                                       cancellable,
                                       callback,
                                       user_data);
}

gboolean
mlton_g_subprocess_communicate_utf8_finish (GSubprocess* subprocess,
                                            GAsyncResult* result,
                                            SML_CVECTOR_REF(char, stdout_buf),
                                            SML_CVECTOR_REF(char, stderr_buf),
                                            GError** error)
{
  return g_subprocess_communicate_utf8_finish (subprocess,
                                               result,
                                               GET_SML_CVECTOR_REF(char, stdout_buf),
                                               GET_SML_CVECTOR_REF(char, stderr_buf),
                                               error);
}

#if GLIB_CHECK_VERSION(2, 40, 0)
const gchar*
mlton_g_subprocess_launcher_getenv (GSubprocessLauncher* self,
                                    SML_CVECTOR_VAL(const gchar, variable))
{
  return g_subprocess_launcher_getenv (self,
                                       GET_SML_CVECTOR_VAL(const gchar, variable));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_set_cwd (GSubprocessLauncher* self,
                                     SML_CVECTOR_VAL(gchar, cwd))
{
  g_subprocess_launcher_set_cwd (self,
                                 GET_SML_CVECTOR_VAL(gchar, cwd));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_set_environ (GSubprocessLauncher* self,
                                         SML_CVECTORVECTOR_VAL(gchar, env))
{
  g_subprocess_launcher_set_environ (self,
                                     GET_SML_CVECTORVECTOR_VAL(gchar, env));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_set_stderr_file_path (GSubprocessLauncher* self,
                                                  SML_CVECTOR_VAL(gchar, path))
{
  g_subprocess_launcher_set_stderr_file_path (self,
                                              GET_SML_CVECTOR_VAL(gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_set_stdin_file_path (GSubprocessLauncher* self,
                                                 SML_CVECTOR_VAL(const gchar, path))
{
  g_subprocess_launcher_set_stdin_file_path (self,
                                             GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_set_stdout_file_path (GSubprocessLauncher* self,
                                                  SML_CVECTOR_VAL(gchar, path))
{
  g_subprocess_launcher_set_stdout_file_path (self,
                                              GET_SML_CVECTOR_VAL(gchar, path));
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_setenv (GSubprocessLauncher* self,
                                    SML_CVECTOR_VAL(const gchar, variable),
                                    SML_CVECTOR_VAL(const gchar, value),
                                    gboolean overwrite)
{
  g_subprocess_launcher_setenv (self,
                                GET_SML_CVECTOR_VAL(const gchar, variable),
                                GET_SML_CVECTOR_VAL(const gchar, value),
                                overwrite);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
GSubprocess*
mlton_g_subprocess_launcher_spawnv (GSubprocessLauncher* self,
                                    SML_CVECTORVECTOR_VAL(const gchar, argv),
                                    GError** error)
{
  return g_subprocess_launcher_spawnv (self,
                                       GET_SML_CVECTORVECTOR_VAL(const gchar, argv),
                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 40, 0)
void
mlton_g_subprocess_launcher_unsetenv (GSubprocessLauncher* self,
                                      SML_CVECTOR_VAL(const gchar, variable))
{
  g_subprocess_launcher_unsetenv (self,
                                  GET_SML_CVECTOR_VAL(const gchar, variable));
}
#endif

void
mlton_g_test_dbus_add_service_dir (GTestDBus* self,
                                   SML_CVECTOR_VAL(const gchar, path))
{
  g_test_dbus_add_service_dir (self,
                               GET_SML_CVECTOR_VAL(const gchar, path));
}

GIcon*
mlton_g_themed_icon_new (SML_CVECTOR_VAL(const char, iconname))
{
  return g_themed_icon_new (GET_SML_CVECTOR_VAL(const char, iconname));
}

GIcon*
mlton_g_themed_icon_new_from_names (SML_CVECTORVECTOR_VAL(char, iconnames),
                                    int len)
{
  return g_themed_icon_new_from_names (GET_SML_CVECTORVECTOR_VAL(char, iconnames),
                                       len);
}

GIcon*
mlton_g_themed_icon_new_with_default_fallbacks (SML_CVECTOR_VAL(const char, iconname))
{
  return g_themed_icon_new_with_default_fallbacks (GET_SML_CVECTOR_VAL(const char, iconname));
}

void
mlton_g_themed_icon_append_name (GThemedIcon* icon,
                                 SML_CVECTOR_VAL(const char, iconname))
{
  g_themed_icon_append_name (icon,
                             GET_SML_CVECTOR_VAL(const char, iconname));
}

#if GLIB_CHECK_VERSION(2, 18, 0)
void
mlton_g_themed_icon_prepend_name (GThemedIcon* icon,
                                  SML_CVECTOR_VAL(const char, iconname))
{
  g_themed_icon_prepend_name (icon,
                              GET_SML_CVECTOR_VAL(const char, iconname));
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GTlsCertificate*
mlton_g_tls_certificate_new_from_file (SML_CVECTOR_VAL(gchar, file),
                                       GError** error)
{
  return g_tls_certificate_new_from_file (GET_SML_CVECTOR_VAL(gchar, file),
                                          error);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GTlsCertificate*
mlton_g_tls_certificate_new_from_files (SML_CVECTOR_VAL(gchar, cert_file),
                                        SML_CVECTOR_VAL(gchar, key_file),
                                        GError** error)
{
  return g_tls_certificate_new_from_files (GET_SML_CVECTOR_VAL(gchar, cert_file),
                                           GET_SML_CVECTOR_VAL(gchar, key_file),
                                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GTlsCertificate*
mlton_g_tls_certificate_new_from_pem (SML_CVECTOR_VAL(const gchar, data),
                                      gssize length,
                                      GError** error)
{
  return g_tls_certificate_new_from_pem (GET_SML_CVECTOR_VAL(const gchar, data),
                                         length,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 28, 0)
GList*
mlton_g_tls_certificate_list_new_from_file (SML_CVECTOR_VAL(gchar, file),
                                            GError** error)
{
  return g_tls_certificate_list_new_from_file (GET_SML_CVECTOR_VAL(gchar, file),
                                               error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GTlsCertificate*
mlton_g_tls_database_lookup_certificate_for_handle (GTlsDatabase* self,
                                                    SML_CVECTOR_VAL(const gchar, handle),
                                                    GTlsInteraction* interaction,
                                                    GTlsDatabaseLookupFlags flags,
                                                    GCancellable* cancellable,
                                                    GError** error)
{
  return g_tls_database_lookup_certificate_for_handle (self,
                                                       GET_SML_CVECTOR_VAL(const gchar, handle),
                                                       interaction,
                                                       flags,
                                                       cancellable,
                                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_tls_database_lookup_certificate_for_handle_async (GTlsDatabase* self,
                                                          SML_CVECTOR_VAL(const gchar, handle),
                                                          GTlsInteraction* interaction,
                                                          GTlsDatabaseLookupFlags flags,
                                                          GCancellable* cancellable,
                                                          GAsyncReadyCallback callback,
                                                          gpointer user_data)
{
  g_tls_database_lookup_certificate_for_handle_async (self,
                                                      GET_SML_CVECTOR_VAL(const gchar, handle),
                                                      interaction,
                                                      flags,
                                                      cancellable,
                                                      callback,
                                                      user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GList*
mlton_g_tls_database_lookup_certificates_issued_by (GTlsDatabase* self,
                                                    SML_CVECTOR_VAL(GByteArray, issuer_raw_dn),
                                                    GTlsInteraction* interaction,
                                                    GTlsDatabaseLookupFlags flags,
                                                    GCancellable* cancellable,
                                                    GError** error)
{
  return g_tls_database_lookup_certificates_issued_by (self,
                                                       GET_SML_CVECTOR_VAL(GByteArray, issuer_raw_dn),
                                                       interaction,
                                                       flags,
                                                       cancellable,
                                                       error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_tls_database_lookup_certificates_issued_by_async (GTlsDatabase* self,
                                                          SML_CVECTOR_VAL(GByteArray, issuer_raw_dn),
                                                          GTlsInteraction* interaction,
                                                          GTlsDatabaseLookupFlags flags,
                                                          GCancellable* cancellable,
                                                          GAsyncReadyCallback callback,
                                                          gpointer user_data)
{
  g_tls_database_lookup_certificates_issued_by_async (self,
                                                      GET_SML_CVECTOR_VAL(GByteArray, issuer_raw_dn),
                                                      interaction,
                                                      flags,
                                                      cancellable,
                                                      callback,
                                                      user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GTlsCertificateFlags
mlton_g_tls_database_verify_chain (GTlsDatabase* self,
                                   GTlsCertificate* chain,
                                   SML_CVECTOR_VAL(const gchar, purpose),
                                   GSocketConnectable* identity,
                                   GTlsInteraction* interaction,
                                   GTlsDatabaseVerifyFlags flags,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_tls_database_verify_chain (self,
                                      chain,
                                      GET_SML_CVECTOR_VAL(const gchar, purpose),
                                      identity,
                                      interaction,
                                      flags,
                                      cancellable,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_tls_database_verify_chain_async (GTlsDatabase* self,
                                         GTlsCertificate* chain,
                                         SML_CVECTOR_VAL(const gchar, purpose),
                                         GSocketConnectable* identity,
                                         GTlsInteraction* interaction,
                                         GTlsDatabaseVerifyFlags flags,
                                         GCancellable* cancellable,
                                         GAsyncReadyCallback callback,
                                         gpointer user_data)
{
  g_tls_database_verify_chain_async (self,
                                     chain,
                                     GET_SML_CVECTOR_VAL(const gchar, purpose),
                                     identity,
                                     interaction,
                                     flags,
                                     cancellable,
                                     callback,
                                     user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
GTlsDatabase*
mlton_g_tls_file_database_new (SML_CVECTOR_VAL(gchar, anchors),
                               GError** error)
{
  return g_tls_file_database_new (GET_SML_CVECTOR_VAL(gchar, anchors),
                                  error);
}
#endif

GTlsPassword*
mlton_g_tls_password_new (GTlsPasswordFlags flags,
                          SML_CVECTOR_VAL(const gchar, description))
{
  return g_tls_password_new (flags,
                             GET_SML_CVECTOR_VAL(const gchar, description));
}

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_tls_password_set_description (GTlsPassword* password,
                                      SML_CVECTOR_VAL(const gchar, description))
{
  g_tls_password_set_description (password,
                                  GET_SML_CVECTOR_VAL(const gchar, description));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_tls_password_set_warning (GTlsPassword* password,
                                  SML_CVECTOR_VAL(const gchar, warning))
{
  g_tls_password_set_warning (password,
                              GET_SML_CVECTOR_VAL(const gchar, warning));
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
GUnixFDList*
mlton_g_unix_fd_list_new_from_array (SML_CVECTOR_VAL(gint, fds),
                                     gint n_fds)
{
  return g_unix_fd_list_new_from_array (GET_SML_CVECTOR_VAL(gint, fds),
                                        n_fds);
}
#endif

#if GLIB_CHECK_VERSION(2, 22, 0)
GSocketAddress*
mlton_g_unix_socket_address_new (SML_CVECTOR_VAL(const gchar, path))
{
  return g_unix_socket_address_new (GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

GSocketAddress*
mlton_g_unix_socket_address_new_abstract (SML_CVECTOR_VAL(gchar, path),
                                          gint path_len)
{
  return g_unix_socket_address_new_abstract (GET_SML_CVECTOR_VAL(gchar, path),
                                             path_len);
}

#if GLIB_CHECK_VERSION(2, 26, 0)
GSocketAddress*
mlton_g_unix_socket_address_new_with_type (SML_CVECTOR_VAL(gchar, path),
                                           gint path_len,
                                           GUnixSocketAddressType type)
{
  return g_unix_socket_address_new_with_type (GET_SML_CVECTOR_VAL(gchar, path),
                                              path_len,
                                              type);
}
#endif

GFile*
mlton_g_vfs_get_file_for_path (GVfs* vfs,
                               SML_CVECTOR_VAL(const char, path))
{
  return g_vfs_get_file_for_path (vfs,
                                  GET_SML_CVECTOR_VAL(const char, path));
}

GFile*
mlton_g_vfs_get_file_for_uri (GVfs* vfs,
                              SML_CVECTOR_VAL(const char, uri))
{
  return g_vfs_get_file_for_uri (vfs,
                                 GET_SML_CVECTOR_VAL(const char, uri));
}

GFile*
mlton_g_vfs_parse_name (GVfs* vfs,
                        SML_CVECTOR_VAL(const char, parse_name))
{
  return g_vfs_parse_name (vfs,
                           GET_SML_CVECTOR_VAL(const char, parse_name));
}

#if GLIB_CHECK_VERSION(2, 50, 0)
gboolean
mlton_g_vfs_register_uri_scheme (GVfs* vfs,
                                 SML_CVECTOR_VAL(const char, scheme),
                                 GVfsFileLookupFunc uri_func,
                                 gpointer uri_data,
                                 GDestroyNotify uri_destroy,
                                 GVfsFileLookupFunc parse_name_func,
                                 gpointer parse_name_data,
                                 GDestroyNotify parse_name_destroy)
{
  return g_vfs_register_uri_scheme (vfs,
                                    GET_SML_CVECTOR_VAL(const char, scheme),
                                    uri_func,
                                    uri_data,
                                    uri_destroy,
                                    parse_name_func,
                                    parse_name_data,
                                    parse_name_destroy);
}
#endif

#if GLIB_CHECK_VERSION(2, 50, 0)
gboolean
mlton_g_vfs_unregister_uri_scheme (GVfs* vfs,
                                   SML_CVECTOR_VAL(const char, scheme))
{
  return g_vfs_unregister_uri_scheme (vfs,
                                      GET_SML_CVECTOR_VAL(const char, scheme));
}
#endif

char*
mlton_g_volume_get_identifier (GVolume* volume,
                               SML_CVECTOR_VAL(const char, kind))
{
  return g_volume_get_identifier (volume,
                                  GET_SML_CVECTOR_VAL(const char, kind));
}

GMount*
mlton_g_volume_monitor_get_mount_for_uuid (GVolumeMonitor* volume_monitor,
                                           SML_CVECTOR_VAL(const char, uuid))
{
  return g_volume_monitor_get_mount_for_uuid (volume_monitor,
                                              GET_SML_CVECTOR_VAL(const char, uuid));
}

GVolume*
mlton_g_volume_monitor_get_volume_for_uuid (GVolumeMonitor* volume_monitor,
                                            SML_CVECTOR_VAL(const char, uuid))
{
  return g_volume_monitor_get_volume_for_uuid (volume_monitor,
                                               GET_SML_CVECTOR_VAL(const char, uuid));
}

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_bus_own_name_on_connection_with_closures (GDBusConnection* connection,
                                                  SML_CVECTOR_VAL(const gchar, name),
                                                  GBusNameOwnerFlags flags,
                                                  GClosure* name_acquired_closure,
                                                  GClosure* name_lost_closure)
{
  return g_bus_own_name_on_connection_with_closures (connection,
                                                     GET_SML_CVECTOR_VAL(const gchar, name),
                                                     flags,
                                                     name_acquired_closure,
                                                     name_lost_closure);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_bus_own_name_with_closures (GBusType bus_type,
                                    SML_CVECTOR_VAL(const gchar, name),
                                    GBusNameOwnerFlags flags,
                                    GClosure* bus_acquired_closure,
                                    GClosure* name_acquired_closure,
                                    GClosure* name_lost_closure)
{
  return g_bus_own_name_with_closures (bus_type,
                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                       flags,
                                       bus_acquired_closure,
                                       name_acquired_closure,
                                       name_lost_closure);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_bus_watch_name_on_connection_with_closures (GDBusConnection* connection,
                                                    SML_CVECTOR_VAL(const gchar, name),
                                                    GBusNameWatcherFlags flags,
                                                    GClosure* name_appeared_closure,
                                                    GClosure* name_vanished_closure)
{
  return g_bus_watch_name_on_connection_with_closures (connection,
                                                       GET_SML_CVECTOR_VAL(const gchar, name),
                                                       flags,
                                                       name_appeared_closure,
                                                       name_vanished_closure);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
guint
mlton_g_bus_watch_name_with_closures (GBusType bus_type,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      GBusNameWatcherFlags flags,
                                      GClosure* name_appeared_closure,
                                      GClosure* name_vanished_closure)
{
  return g_bus_watch_name_with_closures (bus_type,
                                         GET_SML_CVECTOR_VAL(const gchar, name),
                                         flags,
                                         name_appeared_closure,
                                         name_vanished_closure);
}
#endif

gboolean
mlton_g_content_type_can_be_executable (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_can_be_executable (GET_SML_CVECTOR_VAL(const gchar, type));
}

gboolean
mlton_g_content_type_equals (SML_CVECTOR_VAL(const gchar, type1),
                             SML_CVECTOR_VAL(const gchar, type2))
{
  return g_content_type_equals (GET_SML_CVECTOR_VAL(const gchar, type1),
                                GET_SML_CVECTOR_VAL(const gchar, type2));
}

#if GLIB_CHECK_VERSION(2, 18, 0)
gchar*
mlton_g_content_type_from_mime_type (SML_CVECTOR_VAL(const gchar, mime_type))
{
  return g_content_type_from_mime_type (GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

gchar*
mlton_g_content_type_get_description (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_get_description (GET_SML_CVECTOR_VAL(const gchar, type));
}

#if GLIB_CHECK_VERSION(2, 34, 0)
gchar*
mlton_g_content_type_get_generic_icon_name (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_get_generic_icon_name (GET_SML_CVECTOR_VAL(const gchar, type));
}
#endif

GIcon*
mlton_g_content_type_get_icon (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_get_icon (GET_SML_CVECTOR_VAL(const gchar, type));
}

gchar*
mlton_g_content_type_get_mime_type (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_get_mime_type (GET_SML_CVECTOR_VAL(const gchar, type));
}

#if GLIB_CHECK_VERSION(2, 34, 0)
GIcon*
mlton_g_content_type_get_symbolic_icon (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_get_symbolic_icon (GET_SML_CVECTOR_VAL(const gchar, type));
}
#endif

gchar*
mlton_g_content_type_guess (SML_CVECTOR_VAL(const gchar, filename),
                            SML_CVECTOR_VAL(guchar, data),
                            gsize data_size,
                            gboolean* result_uncertain)
{
  return g_content_type_guess (GET_SML_CVECTOR_VAL(const gchar, filename),
                               GET_SML_CVECTOR_VAL(guchar, data),
                               data_size,
                               result_uncertain);
}

gboolean
mlton_g_content_type_is_a (SML_CVECTOR_VAL(const gchar, type),
                           SML_CVECTOR_VAL(const gchar, supertype))
{
  return g_content_type_is_a (GET_SML_CVECTOR_VAL(const gchar, type),
                              GET_SML_CVECTOR_VAL(const gchar, supertype));
}

gboolean
mlton_g_content_type_is_unknown (SML_CVECTOR_VAL(const gchar, type))
{
  return g_content_type_is_unknown (GET_SML_CVECTOR_VAL(const gchar, type));
}

#if GLIB_CHECK_VERSION(2, 36, 0)
gchar*
mlton_g_dbus_address_escape_value (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_address_escape_value (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
void
mlton_g_dbus_address_get_stream (SML_CVECTOR_VAL(const gchar, address),
                                 GCancellable* cancellable,
                                 GAsyncReadyCallback callback,
                                 gpointer user_data)
{
  g_dbus_address_get_stream (GET_SML_CVECTOR_VAL(const gchar, address),
                             cancellable,
                             callback,
                             user_data);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GIOStream*
mlton_g_dbus_address_get_stream_finish (GAsyncResult* res,
                                        SML_CVECTOR_REF(gchar, out_guid),
                                        GError** error)
{
  return g_dbus_address_get_stream_finish (res,
                                           GET_SML_CVECTOR_REF(gchar, out_guid),
                                           error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
GIOStream*
mlton_g_dbus_address_get_stream_sync (SML_CVECTOR_VAL(const gchar, address),
                                      SML_CVECTOR_REF(gchar, out_guid),
                                      GCancellable* cancellable,
                                      GError** error)
{
  return g_dbus_address_get_stream_sync (GET_SML_CVECTOR_VAL(const gchar, address),
                                         GET_SML_CVECTOR_REF(gchar, out_guid),
                                         cancellable,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_address (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_address (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_guid (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_guid (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_interface_name (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_interface_name (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_member_name (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_member_name (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_name (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_name (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_supported_address (SML_CVECTOR_VAL(const gchar, string),
                                   GError** error)
{
  return g_dbus_is_supported_address (GET_SML_CVECTOR_VAL(const gchar, string),
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 26, 0)
gboolean
mlton_g_dbus_is_unique_name (SML_CVECTOR_VAL(const gchar, string))
{
  return g_dbus_is_unique_name (GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

GList*
mlton_g_io_modules_load_all_in_directory (SML_CVECTOR_VAL(gchar, dirname))
{
  return g_io_modules_load_all_in_directory (GET_SML_CVECTOR_VAL(gchar, dirname));
}

#if GLIB_CHECK_VERSION(2, 30, 0)
GList*
mlton_g_io_modules_load_all_in_directory_with_scope (SML_CVECTOR_VAL(gchar, dirname),
                                                     GIOModuleScope* scope)
{
  return g_io_modules_load_all_in_directory_with_scope (GET_SML_CVECTOR_VAL(gchar, dirname),
                                                        scope);
}
#endif

#if GLIB_CHECK_VERSION(2, 24, 0)
void
mlton_g_io_modules_scan_all_in_directory (SML_CVECTOR_VAL(char, dirname))
{
  g_io_modules_scan_all_in_directory (GET_SML_CVECTOR_VAL(char, dirname));
}
#endif

#if GLIB_CHECK_VERSION(2, 30, 0)
void
mlton_g_io_modules_scan_all_in_directory_with_scope (SML_CVECTOR_VAL(gchar, dirname),
                                                     GIOModuleScope* scope)
{
  g_io_modules_scan_all_in_directory_with_scope (GET_SML_CVECTOR_VAL(gchar, dirname),
                                                 scope);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
gssize
mlton_g_pollable_stream_read (GInputStream* stream,
                              SML_CVECTOR_VAL(void, buffer),
                              gsize count,
                              gboolean blocking,
                              GCancellable* cancellable,
                              GError** error)
{
  return g_pollable_stream_read (stream,
                                 GET_SML_CVECTOR_VAL(void, buffer),
                                 count,
                                 blocking,
                                 cancellable,
                                 error);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
gssize
mlton_g_pollable_stream_write (GOutputStream* stream,
                               SML_CVECTOR_VAL(void, buffer),
                               gsize count,
                               gboolean blocking,
                               GCancellable* cancellable,
                               GError** error)
{
  return g_pollable_stream_write (stream,
                                  GET_SML_CVECTOR_VAL(void, buffer),
                                  count,
                                  blocking,
                                  cancellable,
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 34, 0)
gboolean
mlton_g_pollable_stream_write_all (GOutputStream* stream,
                                   SML_CVECTOR_VAL(void, buffer),
                                   gsize count,
                                   gboolean blocking,
                                   gsize* bytes_written,
                                   GCancellable* cancellable,
                                   GError** error)
{
  return g_pollable_stream_write_all (stream,
                                      GET_SML_CVECTOR_VAL(void, buffer),
                                      count,
                                      blocking,
                                      bytes_written,
                                      cancellable,
                                      error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
char**
mlton_g_resources_enumerate_children (SML_CVECTOR_VAL(const char, path),
                                      GResourceLookupFlags lookup_flags,
                                      GError** error)
{
  return g_resources_enumerate_children (GET_SML_CVECTOR_VAL(const char, path),
                                         lookup_flags,
                                         error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
gboolean
mlton_g_resources_get_info (SML_CVECTOR_VAL(const char, path),
                            GResourceLookupFlags lookup_flags,
                            gsize* size,
                            guint32* flags,
                            GError** error)
{
  return g_resources_get_info (GET_SML_CVECTOR_VAL(const char, path),
                               lookup_flags,
                               size,
                               flags,
                               error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GBytes*
mlton_g_resources_lookup_data (SML_CVECTOR_VAL(const char, path),
                               GResourceLookupFlags lookup_flags,
                               GError** error)
{
  return g_resources_lookup_data (GET_SML_CVECTOR_VAL(const char, path),
                                  lookup_flags,
                                  error);
}
#endif

#if GLIB_CHECK_VERSION(2, 32, 0)
GInputStream*
mlton_g_resources_open_stream (SML_CVECTOR_VAL(const char, path),
                               GResourceLookupFlags lookup_flags,
                               GError** error)
{
  return g_resources_open_stream (GET_SML_CVECTOR_VAL(const char, path),
                                  lookup_flags,
                                  error);
}
#endif

gboolean
mlton_g_unix_is_mount_path_system_internal (SML_CVECTOR_VAL(char, mount_path))
{
  return g_unix_is_mount_path_system_internal (GET_SML_CVECTOR_VAL(char, mount_path));
}
