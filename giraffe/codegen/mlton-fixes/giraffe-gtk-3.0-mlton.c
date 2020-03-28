#include "cvector.h"
#include "cvectorvector.h"

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_about_dialog_add_credit_section (GtkAboutDialog* about,
                                           SML_CVECTOR_VAL(const gchar, section_name),
                                           SML_CVECTORVECTOR_VAL(const gchar, people))
{
  gtk_about_dialog_add_credit_section (about,
                                       GET_SML_CVECTOR_VAL(const gchar, section_name),
                                       GET_SML_CVECTORVECTOR_VAL(const gchar, people));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_artists (GtkAboutDialog* about,
                                    SML_CVECTORVECTOR_VAL(const gchar, artists))
{
  gtk_about_dialog_set_artists (about,
                                GET_SML_CVECTORVECTOR_VAL(const gchar, artists));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_authors (GtkAboutDialog* about,
                                    SML_CVECTORVECTOR_VAL(const gchar, authors))
{
  gtk_about_dialog_set_authors (about,
                                GET_SML_CVECTORVECTOR_VAL(const gchar, authors));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_comments (GtkAboutDialog* about,
                                     SML_CVECTOR_VAL(const gchar, comments))
{
  gtk_about_dialog_set_comments (about,
                                 GET_SML_CVECTOR_VAL(const gchar, comments));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_copyright (GtkAboutDialog* about,
                                      SML_CVECTOR_VAL(const gchar, copyright))
{
  gtk_about_dialog_set_copyright (about,
                                  GET_SML_CVECTOR_VAL(const gchar, copyright));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_documenters (GtkAboutDialog* about,
                                        SML_CVECTORVECTOR_VAL(const gchar, documenters))
{
  gtk_about_dialog_set_documenters (about,
                                    GET_SML_CVECTORVECTOR_VAL(const gchar, documenters));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_license (GtkAboutDialog* about,
                                    SML_CVECTOR_VAL(const gchar, license))
{
  gtk_about_dialog_set_license (about,
                                GET_SML_CVECTOR_VAL(const gchar, license));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_logo_icon_name (GtkAboutDialog* about,
                                           SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_about_dialog_set_logo_icon_name (about,
                                       GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_about_dialog_set_program_name (GtkAboutDialog* about,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  gtk_about_dialog_set_program_name (about,
                                     GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_translator_credits (GtkAboutDialog* about,
                                               SML_CVECTOR_VAL(const gchar, translator_credits))
{
  gtk_about_dialog_set_translator_credits (about,
                                           GET_SML_CVECTOR_VAL(const gchar, translator_credits));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_version (GtkAboutDialog* about,
                                    SML_CVECTOR_VAL(const gchar, version))
{
  gtk_about_dialog_set_version (about,
                                GET_SML_CVECTOR_VAL(const gchar, version));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_website (GtkAboutDialog* about,
                                    SML_CVECTOR_VAL(const gchar, website))
{
  gtk_about_dialog_set_website (about,
                                GET_SML_CVECTOR_VAL(const gchar, website));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_about_dialog_set_website_label (GtkAboutDialog* about,
                                          SML_CVECTOR_VAL(const gchar, website_label))
{
  gtk_about_dialog_set_website_label (about,
                                      GET_SML_CVECTOR_VAL(const gchar, website_label));
}
#endif

void
mlton_gtk_accel_group_connect_by_path (GtkAccelGroup* accel_group,
                                       SML_CVECTOR_VAL(const gchar, accel_path),
                                       GClosure* closure)
{
  gtk_accel_group_connect_by_path (accel_group,
                                   GET_SML_CVECTOR_VAL(const gchar, accel_path),
                                   closure);
}

GtkWidget*
mlton_gtk_accel_label_new (SML_CVECTOR_VAL(const gchar, string))
{
  return gtk_accel_label_new (GET_SML_CVECTOR_VAL(const gchar, string));
}

void
mlton_gtk_accel_map_add_entry (SML_CVECTOR_VAL(const gchar, accel_path),
                               guint accel_key,
                               GdkModifierType accel_mods)
{
  gtk_accel_map_add_entry (GET_SML_CVECTOR_VAL(const gchar, accel_path),
                           accel_key,
                           accel_mods);
}

void
mlton_gtk_accel_map_add_filter (SML_CVECTOR_VAL(const gchar, filter_pattern))
{
  gtk_accel_map_add_filter (GET_SML_CVECTOR_VAL(const gchar, filter_pattern));
}

gboolean
mlton_gtk_accel_map_change_entry (SML_CVECTOR_VAL(const gchar, accel_path),
                                  guint accel_key,
                                  GdkModifierType accel_mods,
                                  gboolean replace)
{
  return gtk_accel_map_change_entry (GET_SML_CVECTOR_VAL(const gchar, accel_path),
                                     accel_key,
                                     accel_mods,
                                     replace);
}

void
mlton_gtk_accel_map_load (SML_CVECTOR_VAL(gchar, file_name))
{
  gtk_accel_map_load (GET_SML_CVECTOR_VAL(gchar, file_name));
}

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_accel_map_lock_path (SML_CVECTOR_VAL(const gchar, accel_path))
{
  gtk_accel_map_lock_path (GET_SML_CVECTOR_VAL(const gchar, accel_path));
}
#endif

gboolean
mlton_gtk_accel_map_lookup_entry (SML_CVECTOR_VAL(const gchar, accel_path),
                                  GtkAccelKey* key)
{
  return gtk_accel_map_lookup_entry (GET_SML_CVECTOR_VAL(const gchar, accel_path),
                                     key);
}

void
mlton_gtk_accel_map_save (SML_CVECTOR_VAL(gchar, file_name))
{
  gtk_accel_map_save (GET_SML_CVECTOR_VAL(gchar, file_name));
}

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_accel_map_unlock_path (SML_CVECTOR_VAL(const gchar, accel_path))
{
  gtk_accel_map_unlock_path (GET_SML_CVECTOR_VAL(const gchar, accel_path));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkAction*
mlton_gtk_action_new (SML_CVECTOR_VAL(const gchar, name),
                      SML_CVECTOR_VAL(const gchar, label),
                      SML_CVECTOR_VAL(const gchar, tooltip),
                      SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                         GET_SML_CVECTOR_VAL(const gchar, label),
                         GET_SML_CVECTOR_VAL(const gchar, tooltip),
                         GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_action_set_accel_path (GtkAction* action,
                                 SML_CVECTOR_VAL(const gchar, accel_path))
{
  gtk_action_set_accel_path (action,
                             GET_SML_CVECTOR_VAL(const gchar, accel_path));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_action_set_icon_name (GtkAction* action,
                                SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_action_set_icon_name (action,
                            GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_action_set_label (GtkAction* action,
                            SML_CVECTOR_VAL(const gchar, label))
{
  gtk_action_set_label (action,
                        GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_action_set_short_label (GtkAction* action,
                                  SML_CVECTOR_VAL(const gchar, short_label))
{
  gtk_action_set_short_label (action,
                              GET_SML_CVECTOR_VAL(const gchar, short_label));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_action_set_stock_id (GtkAction* action,
                               SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_action_set_stock_id (action,
                           GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_action_set_tooltip (GtkAction* action,
                              SML_CVECTOR_VAL(const gchar, tooltip))
{
  gtk_action_set_tooltip (action,
                          GET_SML_CVECTOR_VAL(const gchar, tooltip));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkActionGroup*
mlton_gtk_action_group_new (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_action_group_new (GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_action_group_add_action_with_accel (GtkActionGroup* action_group,
                                              GtkAction* action,
                                              SML_CVECTOR_VAL(const gchar, accelerator))
{
  gtk_action_group_add_action_with_accel (action_group,
                                          action,
                                          GET_SML_CVECTOR_VAL(const gchar, accelerator));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkAction*
mlton_gtk_action_group_get_action (GtkActionGroup* action_group,
                                   SML_CVECTOR_VAL(const gchar, action_name))
{
  return gtk_action_group_get_action (action_group,
                                      GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_action_group_set_translation_domain (GtkActionGroup* action_group,
                                               SML_CVECTOR_VAL(const gchar, domain))
{
  gtk_action_group_set_translation_domain (action_group,
                                           GET_SML_CVECTOR_VAL(const gchar, domain));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
const gchar*
mlton_gtk_action_group_translate_string (GtkActionGroup* action_group,
                                         SML_CVECTOR_VAL(const gchar, string))
{
  return gtk_action_group_translate_string (action_group,
                                            GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_actionable_set_action_name (GtkActionable* actionable,
                                      SML_CVECTOR_VAL(const gchar, action_name))
{
  gtk_actionable_set_action_name (actionable,
                                  GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_actionable_set_detailed_action_name (GtkActionable* actionable,
                                               SML_CVECTOR_VAL(const gchar, detailed_action_name))
{
  gtk_actionable_set_detailed_action_name (actionable,
                                           GET_SML_CVECTOR_VAL(const gchar, detailed_action_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
GtkWidget*
mlton_gtk_app_chooser_button_new (SML_CVECTOR_VAL(const gchar, content_type))
{
  return gtk_app_chooser_button_new (GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_app_chooser_button_append_custom_item (GtkAppChooserButton* self,
                                                 SML_CVECTOR_VAL(const gchar, name),
                                                 SML_CVECTOR_VAL(const gchar, label),
                                                 GIcon* icon)
{
  gtk_app_chooser_button_append_custom_item (self,
                                             GET_SML_CVECTOR_VAL(const gchar, name),
                                             GET_SML_CVECTOR_VAL(const gchar, label),
                                             icon);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_app_chooser_button_set_active_custom_item (GtkAppChooserButton* self,
                                                     SML_CVECTOR_VAL(const gchar, name))
{
  gtk_app_chooser_button_set_active_custom_item (self,
                                                 GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

void
mlton_gtk_app_chooser_button_set_heading (GtkAppChooserButton* self,
                                          SML_CVECTOR_VAL(const gchar, heading))
{
  gtk_app_chooser_button_set_heading (self,
                                      GET_SML_CVECTOR_VAL(const gchar, heading));
}

#if GTK_CHECK_VERSION(3, 0, 0)
GtkWidget*
mlton_gtk_app_chooser_dialog_new_for_content_type (GtkWindow* parent,
                                                   GtkDialogFlags flags,
                                                   SML_CVECTOR_VAL(const gchar, content_type))
{
  return gtk_app_chooser_dialog_new_for_content_type (parent,
                                                      flags,
                                                      GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

void
mlton_gtk_app_chooser_dialog_set_heading (GtkAppChooserDialog* self,
                                          SML_CVECTOR_VAL(const gchar, heading))
{
  gtk_app_chooser_dialog_set_heading (self,
                                      GET_SML_CVECTOR_VAL(const gchar, heading));
}

#if GTK_CHECK_VERSION(3, 0, 0)
GtkWidget*
mlton_gtk_app_chooser_widget_new (SML_CVECTOR_VAL(const gchar, content_type))
{
  return gtk_app_chooser_widget_new (GET_SML_CVECTOR_VAL(const gchar, content_type));
}
#endif

void
mlton_gtk_app_chooser_widget_set_default_text (GtkAppChooserWidget* self,
                                               SML_CVECTOR_VAL(const gchar, text))
{
  gtk_app_chooser_widget_set_default_text (self,
                                           GET_SML_CVECTOR_VAL(const gchar, text));
}

#if GTK_CHECK_VERSION(3, 0, 0)
GtkApplication*
mlton_gtk_application_new (SML_CVECTOR_VAL(const gchar, application_id),
                           GApplicationFlags flags)
{
  return gtk_application_new (GET_SML_CVECTOR_VAL(const gchar, application_id),
                              flags);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_application_add_accelerator (GtkApplication* application,
                                       SML_CVECTOR_VAL(const gchar, accelerator),
                                       SML_CVECTOR_VAL(const gchar, action_name),
                                       GVariant* parameter)
{
  gtk_application_add_accelerator (application,
                                   GET_SML_CVECTOR_VAL(const gchar, accelerator),
                                   GET_SML_CVECTOR_VAL(const gchar, action_name),
                                   parameter);
}
#endif

#if GTK_CHECK_VERSION(3, 12, 0)
gchar**
mlton_gtk_application_get_accels_for_action (GtkApplication* application,
                                             SML_CVECTOR_VAL(const gchar, detailed_action_name))
{
  return gtk_application_get_accels_for_action (application,
                                                GET_SML_CVECTOR_VAL(const gchar, detailed_action_name));
}
#endif

#if GTK_CHECK_VERSION(3, 14, 0)
gchar**
mlton_gtk_application_get_actions_for_accel (GtkApplication* application,
                                             SML_CVECTOR_VAL(const gchar, accel))
{
  return gtk_application_get_actions_for_accel (application,
                                                GET_SML_CVECTOR_VAL(const gchar, accel));
}
#endif

#if GTK_CHECK_VERSION(3, 14, 0)
GMenu*
mlton_gtk_application_get_menu_by_id (GtkApplication* application,
                                      SML_CVECTOR_VAL(const gchar, id))
{
  return gtk_application_get_menu_by_id (application,
                                         GET_SML_CVECTOR_VAL(const gchar, id));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
guint
mlton_gtk_application_inhibit (GtkApplication* application,
                               GtkWindow* window,
                               GtkApplicationInhibitFlags flags,
                               SML_CVECTOR_VAL(const gchar, reason))
{
  return gtk_application_inhibit (application,
                                  window,
                                  flags,
                                  GET_SML_CVECTOR_VAL(const gchar, reason));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_application_remove_accelerator (GtkApplication* application,
                                          SML_CVECTOR_VAL(const gchar, action_name),
                                          GVariant* parameter)
{
  gtk_application_remove_accelerator (application,
                                      GET_SML_CVECTOR_VAL(const gchar, action_name),
                                      parameter);
}
#endif

#if GTK_CHECK_VERSION(3, 12, 0)
void
mlton_gtk_application_set_accels_for_action (GtkApplication* application,
                                             SML_CVECTOR_VAL(const gchar, detailed_action_name),
                                             SML_CVECTORVECTOR_VAL(const gchar, accels))
{
  gtk_application_set_accels_for_action (application,
                                         GET_SML_CVECTOR_VAL(const gchar, detailed_action_name),
                                         GET_SML_CVECTORVECTOR_VAL(const gchar, accels));
}
#endif

GtkWidget*
mlton_gtk_aspect_frame_new (SML_CVECTOR_VAL(const gchar, label),
                            gfloat xalign,
                            gfloat yalign,
                            gfloat ratio,
                            gboolean obey_child)
{
  return gtk_aspect_frame_new (GET_SML_CVECTOR_VAL(const gchar, label),
                               xalign,
                               yalign,
                               ratio,
                               obey_child);
}

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_assistant_set_page_title (GtkAssistant* assistant,
                                    GtkWidget* page,
                                    SML_CVECTOR_VAL(const gchar, title))
{
  gtk_assistant_set_page_title (assistant,
                                page,
                                GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
GTokenType
mlton_gtk_binding_entry_add_signal_from_string (GtkBindingSet* binding_set,
                                                SML_CVECTOR_VAL(const gchar, signal_desc))
{
  return gtk_binding_entry_add_signal_from_string (binding_set,
                                                   GET_SML_CVECTOR_VAL(const gchar, signal_desc));
}
#endif

void
mlton_gtk_binding_entry_add_signall (GtkBindingSet* binding_set,
                                     guint keyval,
                                     GdkModifierType modifiers,
                                     SML_CVECTOR_VAL(const gchar, signal_name),
                                     GSList* binding_args)
{
  gtk_binding_entry_add_signall (binding_set,
                                 keyval,
                                 modifiers,
                                 GET_SML_CVECTOR_VAL(const gchar, signal_name),
                                 binding_args);
}

void
mlton_gtk_binding_set_add_path (GtkBindingSet* binding_set,
                                GtkPathType path_type,
                                SML_CVECTOR_VAL(const gchar, path_pattern),
                                GtkPathPriorityType priority)
{
  gtk_binding_set_add_path (binding_set,
                            path_type,
                            GET_SML_CVECTOR_VAL(const gchar, path_pattern),
                            priority);
}

GtkBindingSet*
mlton_gtk_binding_set_find (SML_CVECTOR_VAL(const gchar, set_name))
{
  return gtk_binding_set_find (GET_SML_CVECTOR_VAL(const gchar, set_name));
}

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_buildable_add_child (GtkBuildable* buildable,
                               GtkBuilder* builder,
                               GObject* child,
                               SML_CVECTOR_VAL(const gchar, type))
{
  gtk_buildable_add_child (buildable,
                           builder,
                           child,
                           GET_SML_CVECTOR_VAL(const gchar, type));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GObject*
mlton_gtk_buildable_construct_child (GtkBuildable* buildable,
                                     GtkBuilder* builder,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_buildable_construct_child (buildable,
                                        builder,
                                        GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_buildable_custom_finished (GtkBuildable* buildable,
                                     GtkBuilder* builder,
                                     GObject* child,
                                     SML_CVECTOR_VAL(const gchar, tagname),
                                     gpointer data)
{
  gtk_buildable_custom_finished (buildable,
                                 builder,
                                 child,
                                 GET_SML_CVECTOR_VAL(const gchar, tagname),
                                 data);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_buildable_custom_tag_end (GtkBuildable* buildable,
                                    GtkBuilder* builder,
                                    GObject* child,
                                    SML_CVECTOR_VAL(const gchar, tagname),
                                    gpointer* data)
{
  gtk_buildable_custom_tag_end (buildable,
                                builder,
                                child,
                                GET_SML_CVECTOR_VAL(const gchar, tagname),
                                data);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
gboolean
mlton_gtk_buildable_custom_tag_start (GtkBuildable* buildable,
                                      GtkBuilder* builder,
                                      GObject* child,
                                      SML_CVECTOR_VAL(const gchar, tagname),
                                      GMarkupParser* parser,
                                      gpointer* data)
{
  return gtk_buildable_custom_tag_start (buildable,
                                         builder,
                                         child,
                                         GET_SML_CVECTOR_VAL(const gchar, tagname),
                                         parser,
                                         data);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GObject*
mlton_gtk_buildable_get_internal_child (GtkBuildable* buildable,
                                        GtkBuilder* builder,
                                        SML_CVECTOR_VAL(const gchar, childname))
{
  return gtk_buildable_get_internal_child (buildable,
                                           builder,
                                           GET_SML_CVECTOR_VAL(const gchar, childname));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_buildable_set_buildable_property (GtkBuildable* buildable,
                                            GtkBuilder* builder,
                                            SML_CVECTOR_VAL(const gchar, name),
                                            const GValue* value)
{
  gtk_buildable_set_buildable_property (buildable,
                                        builder,
                                        GET_SML_CVECTOR_VAL(const gchar, name),
                                        value);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_buildable_set_name (GtkBuildable* buildable,
                              SML_CVECTOR_VAL(const gchar, name))
{
  gtk_buildable_set_name (buildable,
                          GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GtkBuilder*
mlton_gtk_builder_new_from_file (SML_CVECTOR_VAL(const gchar, filename))
{
  return gtk_builder_new_from_file (GET_SML_CVECTOR_VAL(const gchar, filename));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GtkBuilder*
mlton_gtk_builder_new_from_resource (SML_CVECTOR_VAL(const gchar, resource_path))
{
  return gtk_builder_new_from_resource (GET_SML_CVECTOR_VAL(const gchar, resource_path));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GtkBuilder*
mlton_gtk_builder_new_from_string (SML_CVECTOR_VAL(const gchar, string),
                                   gssize length)
{
  return gtk_builder_new_from_string (GET_SML_CVECTOR_VAL(const gchar, string),
                                      length);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_builder_add_callback_symbol (GtkBuilder* builder,
                                       SML_CVECTOR_VAL(const gchar, callback_name),
                                       GCallback callback_symbol)
{
  gtk_builder_add_callback_symbol (builder,
                                   GET_SML_CVECTOR_VAL(const gchar, callback_name),
                                   callback_symbol);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
guint
mlton_gtk_builder_add_from_file (GtkBuilder* builder,
                                 SML_CVECTOR_VAL(const gchar, filename),
                                 GError** error)
{
  return gtk_builder_add_from_file (builder,
                                    GET_SML_CVECTOR_VAL(const gchar, filename),
                                    error);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
guint
mlton_gtk_builder_add_from_resource (GtkBuilder* builder,
                                     SML_CVECTOR_VAL(const gchar, resource_path),
                                     GError** error)
{
  return gtk_builder_add_from_resource (builder,
                                        GET_SML_CVECTOR_VAL(const gchar, resource_path),
                                        error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
guint
mlton_gtk_builder_add_from_string (GtkBuilder* builder,
                                   SML_CVECTOR_VAL(const gchar, buffer),
                                   gsize length,
                                   GError** error)
{
  return gtk_builder_add_from_string (builder,
                                      GET_SML_CVECTOR_VAL(const gchar, buffer),
                                      length,
                                      error);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
guint
mlton_gtk_builder_add_objects_from_file (GtkBuilder* builder,
                                         SML_CVECTOR_VAL(const gchar, filename),
                                         SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                         GError** error)
{
  return gtk_builder_add_objects_from_file (builder,
                                            GET_SML_CVECTOR_VAL(const gchar, filename),
                                            GET_SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                            error);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
guint
mlton_gtk_builder_add_objects_from_resource (GtkBuilder* builder,
                                             SML_CVECTOR_VAL(const gchar, resource_path),
                                             SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                             GError** error)
{
  return gtk_builder_add_objects_from_resource (builder,
                                                GET_SML_CVECTOR_VAL(const gchar, resource_path),
                                                GET_SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                                error);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
guint
mlton_gtk_builder_add_objects_from_string (GtkBuilder* builder,
                                           SML_CVECTOR_VAL(const gchar, buffer),
                                           gsize length,
                                           SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                           GError** error)
{
  return gtk_builder_add_objects_from_string (builder,
                                              GET_SML_CVECTOR_VAL(const gchar, buffer),
                                              length,
                                              GET_SML_CVECTORVECTOR_VAL(gchar, object_ids),
                                              error);
}
#endif

#if GTK_CHECK_VERSION(3, 8, 0)
void
mlton_gtk_builder_expose_object (GtkBuilder* builder,
                                 SML_CVECTOR_VAL(const gchar, name),
                                 GObject* object)
{
  gtk_builder_expose_object (builder,
                             GET_SML_CVECTOR_VAL(const gchar, name),
                             object);
}
#endif

guint
mlton_gtk_builder_extend_with_template (GtkBuilder* builder,
                                        GtkWidget* widget,
                                        GType template_type,
                                        SML_CVECTOR_VAL(const gchar, buffer),
                                        gsize length,
                                        GError** error)
{
  return gtk_builder_extend_with_template (builder,
                                           widget,
                                           template_type,
                                           GET_SML_CVECTOR_VAL(const gchar, buffer),
                                           length,
                                           error);
}

#if GTK_CHECK_VERSION(2, 12, 0)
GObject*
mlton_gtk_builder_get_object (GtkBuilder* builder,
                              SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_builder_get_object (builder,
                                 GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GType
mlton_gtk_builder_get_type_from_name (GtkBuilder* builder,
                                      SML_CVECTOR_VAL(const char, type_name))
{
  return gtk_builder_get_type_from_name (builder,
                                         GET_SML_CVECTOR_VAL(const char, type_name));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_builder_set_translation_domain (GtkBuilder* builder,
                                          SML_CVECTOR_VAL(const gchar, domain))
{
  gtk_builder_set_translation_domain (builder,
                                      GET_SML_CVECTOR_VAL(const gchar, domain));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
gboolean
mlton_gtk_builder_value_from_string (GtkBuilder* builder,
                                     GParamSpec* pspec,
                                     SML_CVECTOR_VAL(const gchar, string),
                                     GValue* value,
                                     GError** error)
{
  return gtk_builder_value_from_string (builder,
                                        pspec,
                                        GET_SML_CVECTOR_VAL(const gchar, string),
                                        value,
                                        error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
gboolean
mlton_gtk_builder_value_from_string_type (GtkBuilder* builder,
                                          GType type,
                                          SML_CVECTOR_VAL(const gchar, string),
                                          GValue* value,
                                          GError** error)
{
  return gtk_builder_value_from_string_type (builder,
                                             type,
                                             GET_SML_CVECTOR_VAL(const gchar, string),
                                             value,
                                             error);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GtkWidget*
mlton_gtk_button_new_from_icon_name (SML_CVECTOR_VAL(const gchar, icon_name),
                                     GtkIconSize size)
{
  return gtk_button_new_from_icon_name (GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                        size);
}
#endif

GtkWidget*
mlton_gtk_button_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_button_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

GtkWidget*
mlton_gtk_button_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_button_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_button_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_button_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

void
mlton_gtk_button_set_label (GtkButton* button,
                            SML_CVECTOR_VAL(const gchar, label))
{
  gtk_button_set_label (button,
                        GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_cell_area_attribute_connect (GtkCellArea* area,
                                       GtkCellRenderer* renderer,
                                       SML_CVECTOR_VAL(const gchar, attribute),
                                       gint column)
{
  gtk_cell_area_attribute_connect (area,
                                   renderer,
                                   GET_SML_CVECTOR_VAL(const gchar, attribute),
                                   column);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_cell_area_attribute_disconnect (GtkCellArea* area,
                                          GtkCellRenderer* renderer,
                                          SML_CVECTOR_VAL(const gchar, attribute))
{
  gtk_cell_area_attribute_disconnect (area,
                                      renderer,
                                      GET_SML_CVECTOR_VAL(const gchar, attribute));
}
#endif

#if GTK_CHECK_VERSION(3, 14, 0)
gint
mlton_gtk_cell_area_attribute_get_column (GtkCellArea* area,
                                          GtkCellRenderer* renderer,
                                          SML_CVECTOR_VAL(const gchar, attribute))
{
  return gtk_cell_area_attribute_get_column (area,
                                             renderer,
                                             GET_SML_CVECTOR_VAL(const gchar, attribute));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_cell_area_cell_get_property (GtkCellArea* area,
                                       GtkCellRenderer* renderer,
                                       SML_CVECTOR_VAL(const gchar, property_name),
                                       GValue* value)
{
  gtk_cell_area_cell_get_property (area,
                                   renderer,
                                   GET_SML_CVECTOR_VAL(const gchar, property_name),
                                   value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_cell_area_cell_set_property (GtkCellArea* area,
                                       GtkCellRenderer* renderer,
                                       SML_CVECTOR_VAL(const gchar, property_name),
                                       const GValue* value)
{
  gtk_cell_area_cell_set_property (area,
                                   renderer,
                                   GET_SML_CVECTOR_VAL(const gchar, property_name),
                                   value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
GParamSpec*
mlton_gtk_cell_area_class_find_cell_property (GtkCellAreaClass* aclass,
                                              SML_CVECTOR_VAL(const gchar, property_name))
{
  return gtk_cell_area_class_find_cell_property (aclass,
                                                 GET_SML_CVECTOR_VAL(const gchar, property_name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_cell_layout_add_attribute (GtkCellLayout* cell_layout,
                                     GtkCellRenderer* cell,
                                     SML_CVECTOR_VAL(const gchar, attribute),
                                     gint column)
{
  gtk_cell_layout_add_attribute (cell_layout,
                                 cell,
                                 GET_SML_CVECTOR_VAL(const gchar, attribute),
                                 column);
}
#endif

gboolean
mlton_gtk_cell_renderer_activate (GtkCellRenderer* cell,
                                  GdkEvent* event,
                                  GtkWidget* widget,
                                  SML_CVECTOR_VAL(const gchar, path),
                                  const GdkRectangle* background_area,
                                  const GdkRectangle* cell_area,
                                  GtkCellRendererState flags)
{
  return gtk_cell_renderer_activate (cell,
                                     event,
                                     widget,
                                     GET_SML_CVECTOR_VAL(const gchar, path),
                                     background_area,
                                     cell_area,
                                     flags);
}

GtkCellEditable*
mlton_gtk_cell_renderer_start_editing (GtkCellRenderer* cell,
                                       GdkEvent* event,
                                       GtkWidget* widget,
                                       SML_CVECTOR_VAL(const gchar, path),
                                       const GdkRectangle* background_area,
                                       const GdkRectangle* cell_area,
                                       GtkCellRendererState flags)
{
  return gtk_cell_renderer_start_editing (cell,
                                          event,
                                          widget,
                                          GET_SML_CVECTOR_VAL(const gchar, path),
                                          background_area,
                                          cell_area,
                                          flags);
}

#if GTK_CHECK_VERSION(2, 6, 0)
GtkWidget*
mlton_gtk_cell_view_new_with_markup (SML_CVECTOR_VAL(const gchar, markup))
{
  return gtk_cell_view_new_with_markup (GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
GtkWidget*
mlton_gtk_cell_view_new_with_text (SML_CVECTOR_VAL(const gchar, text))
{
  return gtk_cell_view_new_with_text (GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

GtkWidget*
mlton_gtk_check_button_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_check_button_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_check_button_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_check_button_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_check_menu_item_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_check_menu_item_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_check_menu_item_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_check_menu_item_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_clipboard_set_can_store (GtkClipboard* clipboard,
                                   SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                   gint n_targets)
{
  gtk_clipboard_set_can_store (clipboard,
                               GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                               n_targets);
}
#endif

void
mlton_gtk_clipboard_set_text (GtkClipboard* clipboard,
                              SML_CVECTOR_VAL(const gchar, text),
                              gint len)
{
  gtk_clipboard_set_text (clipboard,
                          GET_SML_CVECTOR_VAL(const gchar, text),
                          len);
}

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_clipboard_wait_for_targets (GtkClipboard* clipboard,
                                      SML_CVECTOR_REF(GdkAtom, targets),
                                      gint* n_targets)
{
  return gtk_clipboard_wait_for_targets (clipboard,
                                         GET_SML_CVECTOR_REF(GdkAtom, targets),
                                         n_targets);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_color_button_set_title (GtkColorButton* button,
                                  SML_CVECTOR_VAL(const gchar, title))
{
  gtk_color_button_set_title (button,
                              GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_color_chooser_add_palette (GtkColorChooser* chooser,
                                     GtkOrientation orientation,
                                     gint colors_per_line,
                                     gint n_colors,
                                     SML_CVECTOR_VAL(GdkRGBA, colors))
{
  gtk_color_chooser_add_palette (chooser,
                                 orientation,
                                 colors_per_line,
                                 n_colors,
                                 GET_SML_CVECTOR_VAL(GdkRGBA, colors));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
GtkWidget*
mlton_gtk_color_chooser_dialog_new (SML_CVECTOR_VAL(const gchar, title),
                                    GtkWindow* parent)
{
  return gtk_color_chooser_dialog_new (GET_SML_CVECTOR_VAL(const gchar, title),
                                       parent);
}
#endif

gboolean
mlton_gtk_color_selection_palette_from_string (SML_CVECTOR_VAL(const gchar, str),
                                               SML_CVECTOR_REF(GdkColor, colors),
                                               gint* n_colors)
{
  return gtk_color_selection_palette_from_string (GET_SML_CVECTOR_VAL(const gchar, str),
                                                  GET_SML_CVECTOR_REF(GdkColor, colors),
                                                  n_colors);
}

gchar*
mlton_gtk_color_selection_palette_to_string (SML_CVECTOR_VAL(GdkColor, colors),
                                             gint n_colors)
{
  return gtk_color_selection_palette_to_string (GET_SML_CVECTOR_VAL(GdkColor, colors),
                                                n_colors);
}

GtkWidget*
mlton_gtk_color_selection_dialog_new (SML_CVECTOR_VAL(const gchar, title))
{
  return gtk_color_selection_dialog_new (GET_SML_CVECTOR_VAL(const gchar, title));
}

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_combo_box_set_active_id (GtkComboBox* combo_box,
                                   SML_CVECTOR_VAL(const gchar, active_id))
{
  return gtk_combo_box_set_active_id (combo_box,
                                      GET_SML_CVECTOR_VAL(const gchar, active_id));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_combo_box_set_title (GtkComboBox* combo_box,
                               SML_CVECTOR_VAL(const gchar, title))
{
  gtk_combo_box_set_title (combo_box,
                           GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_combo_box_text_append (GtkComboBoxText* combo_box,
                                 SML_CVECTOR_VAL(const gchar, id),
                                 SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_append (combo_box,
                             GET_SML_CVECTOR_VAL(const gchar, id),
                             GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_combo_box_text_append_text (GtkComboBoxText* combo_box,
                                      SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_append_text (combo_box,
                                  GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_combo_box_text_insert (GtkComboBoxText* combo_box,
                                 gint position,
                                 SML_CVECTOR_VAL(const gchar, id),
                                 SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_insert (combo_box,
                             position,
                             GET_SML_CVECTOR_VAL(const gchar, id),
                             GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_combo_box_text_insert_text (GtkComboBoxText* combo_box,
                                      gint position,
                                      SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_insert_text (combo_box,
                                  position,
                                  GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_combo_box_text_prepend (GtkComboBoxText* combo_box,
                                  SML_CVECTOR_VAL(const gchar, id),
                                  SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_prepend (combo_box,
                              GET_SML_CVECTOR_VAL(const gchar, id),
                              GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_combo_box_text_prepend_text (GtkComboBoxText* combo_box,
                                       SML_CVECTOR_VAL(const gchar, text))
{
  gtk_combo_box_text_prepend_text (combo_box,
                                   GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

void
mlton_gtk_container_child_get_property (GtkContainer* container,
                                        GtkWidget* child,
                                        SML_CVECTOR_VAL(const gchar, property_name),
                                        GValue* value)
{
  gtk_container_child_get_property (container,
                                    child,
                                    GET_SML_CVECTOR_VAL(const gchar, property_name),
                                    value);
}

#if GTK_CHECK_VERSION(3, 2, 0)
void
mlton_gtk_container_child_notify (GtkContainer* container,
                                  GtkWidget* child,
                                  SML_CVECTOR_VAL(const gchar, child_property))
{
  gtk_container_child_notify (container,
                              child,
                              GET_SML_CVECTOR_VAL(const gchar, child_property));
}
#endif

void
mlton_gtk_container_child_set_property (GtkContainer* container,
                                        GtkWidget* child,
                                        SML_CVECTOR_VAL(const gchar, property_name),
                                        const GValue* value)
{
  gtk_container_child_set_property (container,
                                    child,
                                    GET_SML_CVECTOR_VAL(const gchar, property_name),
                                    value);
}

GParamSpec*
mlton_gtk_container_class_find_child_property (GObjectClass* cclass,
                                               SML_CVECTOR_VAL(const gchar, property_name))
{
  return gtk_container_class_find_child_property (cclass,
                                                  GET_SML_CVECTOR_VAL(const gchar, property_name));
}

#if GTK_CHECK_VERSION(3, 18, 0)
void
mlton_gtk_container_class_install_child_properties (GtkContainerClass* cclass,
                                                    guint n_pspecs,
                                                    SML_CVECTOR_VAL(GParamSpec*, pspecs))
{
  gtk_container_class_install_child_properties (cclass,
                                                n_pspecs,
                                                GET_SML_CVECTOR_VAL(GParamSpec*, pspecs));
}
#endif

GtkCssProvider*
mlton_gtk_css_provider_get_named (SML_CVECTOR_VAL(const gchar, name),
                                  SML_CVECTOR_VAL(const gchar, variant))
{
  return gtk_css_provider_get_named (GET_SML_CVECTOR_VAL(const gchar, name),
                                     GET_SML_CVECTOR_VAL(const gchar, variant));
}

gboolean
mlton_gtk_css_provider_load_from_data (GtkCssProvider* css_provider,
                                       SML_CVECTOR_VAL(gchar, data),
                                       gssize length,
                                       GError** error)
{
  return gtk_css_provider_load_from_data (css_provider,
                                          GET_SML_CVECTOR_VAL(gchar, data),
                                          length,
                                          error);
}

gboolean
mlton_gtk_css_provider_load_from_path (GtkCssProvider* css_provider,
                                       SML_CVECTOR_VAL(const gchar, path),
                                       GError** error)
{
  return gtk_css_provider_load_from_path (css_provider,
                                          GET_SML_CVECTOR_VAL(const gchar, path),
                                          error);
}

#if GTK_CHECK_VERSION(3, 16, 0)
void
mlton_gtk_css_provider_load_from_resource (GtkCssProvider* css_provider,
                                           SML_CVECTOR_VAL(const gchar, resource_path))
{
  gtk_css_provider_load_from_resource (css_provider,
                                       GET_SML_CVECTOR_VAL(const gchar, resource_path));
}
#endif

GtkWidget*
mlton_gtk_dialog_add_button (GtkDialog* dialog,
                             SML_CVECTOR_VAL(const gchar, button_text),
                             gint response_id)
{
  return gtk_dialog_add_button (dialog,
                                GET_SML_CVECTOR_VAL(const gchar, button_text),
                                response_id);
}

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_dialog_set_alternative_button_order_from_array (GtkDialog* dialog,
                                                          gint n_params,
                                                          SML_CVECTOR_VAL(gint, new_order))
{
  gtk_dialog_set_alternative_button_order_from_array (dialog,
                                                      n_params,
                                                      GET_SML_CVECTOR_VAL(gint, new_order));
}
#endif

void
mlton_gtk_editable_insert_text (GtkEditable* editable,
                                SML_CVECTOR_VAL(const gchar, new_text),
                                gint new_text_length,
                                gint* position)
{
  gtk_editable_insert_text (editable,
                            GET_SML_CVECTOR_VAL(const gchar, new_text),
                            new_text_length,
                            position);
}

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_entry_set_icon_from_icon_name (GtkEntry* entry,
                                         GtkEntryIconPosition icon_pos,
                                         SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_entry_set_icon_from_icon_name (entry,
                                     icon_pos,
                                     GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_entry_set_icon_from_stock (GtkEntry* entry,
                                     GtkEntryIconPosition icon_pos,
                                     SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_entry_set_icon_from_stock (entry,
                                 icon_pos,
                                 GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_entry_set_icon_tooltip_markup (GtkEntry* entry,
                                         GtkEntryIconPosition icon_pos,
                                         SML_CVECTOR_VAL(const gchar, tooltip))
{
  gtk_entry_set_icon_tooltip_markup (entry,
                                     icon_pos,
                                     GET_SML_CVECTOR_VAL(const gchar, tooltip));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_entry_set_icon_tooltip_text (GtkEntry* entry,
                                       GtkEntryIconPosition icon_pos,
                                       SML_CVECTOR_VAL(const gchar, tooltip))
{
  gtk_entry_set_icon_tooltip_text (entry,
                                   icon_pos,
                                   GET_SML_CVECTOR_VAL(const gchar, tooltip));
}
#endif

#if GTK_CHECK_VERSION(3, 2, 0)
void
mlton_gtk_entry_set_placeholder_text (GtkEntry* entry,
                                      SML_CVECTOR_VAL(const gchar, text))
{
  gtk_entry_set_placeholder_text (entry,
                                  GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

void
mlton_gtk_entry_set_text (GtkEntry* entry,
                          SML_CVECTOR_VAL(const gchar, text))
{
  gtk_entry_set_text (entry,
                      GET_SML_CVECTOR_VAL(const gchar, text));
}

#if GTK_CHECK_VERSION(2, 18, 0)
GtkEntryBuffer*
mlton_gtk_entry_buffer_new (SML_CVECTOR_VAL(const gchar, initial_chars),
                            gint n_initial_chars)
{
  return gtk_entry_buffer_new (GET_SML_CVECTOR_VAL(const gchar, initial_chars),
                               n_initial_chars);
}
#endif

#if GTK_CHECK_VERSION(2, 18, 0)
void
mlton_gtk_entry_buffer_emit_inserted_text (GtkEntryBuffer* buffer,
                                           guint position,
                                           SML_CVECTOR_VAL(const gchar, chars),
                                           guint n_chars)
{
  gtk_entry_buffer_emit_inserted_text (buffer,
                                       position,
                                       GET_SML_CVECTOR_VAL(const gchar, chars),
                                       n_chars);
}
#endif

#if GTK_CHECK_VERSION(2, 18, 0)
guint
mlton_gtk_entry_buffer_insert_text (GtkEntryBuffer* buffer,
                                    guint position,
                                    SML_CVECTOR_VAL(const gchar, chars),
                                    gint n_chars)
{
  return gtk_entry_buffer_insert_text (buffer,
                                       position,
                                       GET_SML_CVECTOR_VAL(const gchar, chars),
                                       n_chars);
}
#endif

#if GTK_CHECK_VERSION(2, 18, 0)
void
mlton_gtk_entry_buffer_set_text (GtkEntryBuffer* buffer,
                                 SML_CVECTOR_VAL(const gchar, chars),
                                 gint n_chars)
{
  gtk_entry_buffer_set_text (buffer,
                             GET_SML_CVECTOR_VAL(const gchar, chars),
                             n_chars);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
gchar*
mlton_gtk_entry_completion_compute_prefix (GtkEntryCompletion* completion,
                                           SML_CVECTOR_VAL(const char, key))
{
  return gtk_entry_completion_compute_prefix (completion,
                                              GET_SML_CVECTOR_VAL(const char, key));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_entry_completion_insert_action_markup (GtkEntryCompletion* completion,
                                                 gint index_,
                                                 SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_entry_completion_insert_action_markup (completion,
                                             index_,
                                             GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_entry_completion_insert_action_text (GtkEntryCompletion* completion,
                                               gint index_,
                                               SML_CVECTOR_VAL(const gchar, text))
{
  gtk_entry_completion_insert_action_text (completion,
                                           index_,
                                           GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_expander_new (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_expander_new (GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_expander_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_expander_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_expander_set_label (GtkExpander* expander,
                              SML_CVECTOR_VAL(const gchar, label))
{
  gtk_expander_set_label (expander,
                          GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_file_chooser_add_choice (GtkFileChooser* chooser,
                                   SML_CVECTOR_VAL(const char, id),
                                   SML_CVECTOR_VAL(const char, label),
                                   SML_CVECTOR_VAL(const char*, options),
                                   SML_CVECTOR_VAL(const char*, option_labels))
{
  gtk_file_chooser_add_choice (chooser,
                               GET_SML_CVECTOR_VAL(const char, id),
                               GET_SML_CVECTOR_VAL(const char, label),
                               GET_SML_CVECTOR_VAL(const char*, options),
                               GET_SML_CVECTOR_VAL(const char*, option_labels));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_add_shortcut_folder (GtkFileChooser* chooser,
                                            SML_CVECTOR_VAL(char, folder),
                                            GError** error)
{
  return gtk_file_chooser_add_shortcut_folder (chooser,
                                               GET_SML_CVECTOR_VAL(char, folder),
                                               error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_add_shortcut_folder_uri (GtkFileChooser* chooser,
                                                SML_CVECTOR_VAL(const char, uri),
                                                GError** error)
{
  return gtk_file_chooser_add_shortcut_folder_uri (chooser,
                                                   GET_SML_CVECTOR_VAL(const char, uri),
                                                   error);
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
const char*
mlton_gtk_file_chooser_get_choice (GtkFileChooser* chooser,
                                   SML_CVECTOR_VAL(const char, id))
{
  return gtk_file_chooser_get_choice (chooser,
                                      GET_SML_CVECTOR_VAL(const char, id));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_file_chooser_remove_choice (GtkFileChooser* chooser,
                                      SML_CVECTOR_VAL(const char, id))
{
  gtk_file_chooser_remove_choice (chooser,
                                  GET_SML_CVECTOR_VAL(const char, id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_remove_shortcut_folder (GtkFileChooser* chooser,
                                               SML_CVECTOR_VAL(char, folder),
                                               GError** error)
{
  return gtk_file_chooser_remove_shortcut_folder (chooser,
                                                  GET_SML_CVECTOR_VAL(char, folder),
                                                  error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_remove_shortcut_folder_uri (GtkFileChooser* chooser,
                                                   SML_CVECTOR_VAL(const char, uri),
                                                   GError** error)
{
  return gtk_file_chooser_remove_shortcut_folder_uri (chooser,
                                                      GET_SML_CVECTOR_VAL(const char, uri),
                                                      error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_select_filename (GtkFileChooser* chooser,
                                        SML_CVECTOR_VAL(char, filename))
{
  return gtk_file_chooser_select_filename (chooser,
                                           GET_SML_CVECTOR_VAL(char, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_select_uri (GtkFileChooser* chooser,
                                   SML_CVECTOR_VAL(const char, uri))
{
  return gtk_file_chooser_select_uri (chooser,
                                      GET_SML_CVECTOR_VAL(const char, uri));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_file_chooser_set_choice (GtkFileChooser* chooser,
                                   SML_CVECTOR_VAL(const char, id),
                                   SML_CVECTOR_VAL(const char, option))
{
  gtk_file_chooser_set_choice (chooser,
                               GET_SML_CVECTOR_VAL(const char, id),
                               GET_SML_CVECTOR_VAL(const char, option));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_set_current_folder (GtkFileChooser* chooser,
                                           SML_CVECTOR_VAL(gchar, filename))
{
  return gtk_file_chooser_set_current_folder (chooser,
                                              GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_set_current_folder_uri (GtkFileChooser* chooser,
                                               SML_CVECTOR_VAL(const gchar, uri))
{
  return gtk_file_chooser_set_current_folder_uri (chooser,
                                                  GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_chooser_set_current_name (GtkFileChooser* chooser,
                                         SML_CVECTOR_VAL(gchar, name))
{
  gtk_file_chooser_set_current_name (chooser,
                                     GET_SML_CVECTOR_VAL(gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_set_filename (GtkFileChooser* chooser,
                                     SML_CVECTOR_VAL(char, filename))
{
  return gtk_file_chooser_set_filename (chooser,
                                        GET_SML_CVECTOR_VAL(char, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_file_chooser_set_uri (GtkFileChooser* chooser,
                                SML_CVECTOR_VAL(const char, uri))
{
  return gtk_file_chooser_set_uri (chooser,
                                   GET_SML_CVECTOR_VAL(const char, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_chooser_unselect_filename (GtkFileChooser* chooser,
                                          SML_CVECTOR_VAL(char, filename))
{
  gtk_file_chooser_unselect_filename (chooser,
                                      GET_SML_CVECTOR_VAL(char, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_chooser_unselect_uri (GtkFileChooser* chooser,
                                     SML_CVECTOR_VAL(const char, uri))
{
  gtk_file_chooser_unselect_uri (chooser,
                                 GET_SML_CVECTOR_VAL(const char, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
GtkWidget*
mlton_gtk_file_chooser_button_new (SML_CVECTOR_VAL(const gchar, title),
                                   GtkFileChooserAction action)
{
  return gtk_file_chooser_button_new (GET_SML_CVECTOR_VAL(const gchar, title),
                                      action);
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_file_chooser_button_set_title (GtkFileChooserButton* button,
                                         SML_CVECTOR_VAL(const gchar, title))
{
  gtk_file_chooser_button_set_title (button,
                                     GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
GtkFileChooserNative*
mlton_gtk_file_chooser_native_new (SML_CVECTOR_VAL(const gchar, title),
                                   GtkWindow* parent,
                                   GtkFileChooserAction action,
                                   SML_CVECTOR_VAL(const gchar, accept_label),
                                   SML_CVECTOR_VAL(const gchar, cancel_label))
{
  return gtk_file_chooser_native_new (GET_SML_CVECTOR_VAL(const gchar, title),
                                      parent,
                                      action,
                                      GET_SML_CVECTOR_VAL(const gchar, accept_label),
                                      GET_SML_CVECTOR_VAL(const gchar, cancel_label));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_file_chooser_native_set_accept_label (GtkFileChooserNative* self,
                                                SML_CVECTOR_VAL(const char, accept_label))
{
  gtk_file_chooser_native_set_accept_label (self,
                                            GET_SML_CVECTOR_VAL(const char, accept_label));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_file_chooser_native_set_cancel_label (GtkFileChooserNative* self,
                                                SML_CVECTOR_VAL(const char, cancel_label))
{
  gtk_file_chooser_native_set_cancel_label (self,
                                            GET_SML_CVECTOR_VAL(const char, cancel_label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_filter_add_mime_type (GtkFileFilter* filter,
                                     SML_CVECTOR_VAL(const gchar, mime_type))
{
  gtk_file_filter_add_mime_type (filter,
                                 GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_filter_add_pattern (GtkFileFilter* filter,
                                   SML_CVECTOR_VAL(const gchar, pattern))
{
  gtk_file_filter_add_pattern (filter,
                               GET_SML_CVECTOR_VAL(const gchar, pattern));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_file_filter_set_name (GtkFileFilter* filter,
                                SML_CVECTOR_VAL(const gchar, name))
{
  gtk_file_filter_set_name (filter,
                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_font_button_new_with_font (SML_CVECTOR_VAL(const gchar, fontname))
{
  return gtk_font_button_new_with_font (GET_SML_CVECTOR_VAL(const gchar, fontname));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_font_button_set_font_name (GtkFontButton* font_button,
                                     SML_CVECTOR_VAL(const gchar, fontname))
{
  return gtk_font_button_set_font_name (font_button,
                                        GET_SML_CVECTOR_VAL(const gchar, fontname));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_font_button_set_title (GtkFontButton* font_button,
                                 SML_CVECTOR_VAL(const gchar, title))
{
  gtk_font_button_set_title (font_button,
                             GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(3, 2, 0)
void
mlton_gtk_font_chooser_set_font (GtkFontChooser* fontchooser,
                                 SML_CVECTOR_VAL(const gchar, fontname))
{
  gtk_font_chooser_set_font (fontchooser,
                             GET_SML_CVECTOR_VAL(const gchar, fontname));
}
#endif

#if GTK_CHECK_VERSION(3, 2, 0)
void
mlton_gtk_font_chooser_set_preview_text (GtkFontChooser* fontchooser,
                                         SML_CVECTOR_VAL(const gchar, text))
{
  gtk_font_chooser_set_preview_text (fontchooser,
                                     GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(3, 2, 0)
GtkWidget*
mlton_gtk_font_chooser_dialog_new (SML_CVECTOR_VAL(const gchar, title),
                                   GtkWindow* parent)
{
  return gtk_font_chooser_dialog_new (GET_SML_CVECTOR_VAL(const gchar, title),
                                      parent);
}
#endif

gboolean
mlton_gtk_font_selection_set_font_name (GtkFontSelection* fontsel,
                                        SML_CVECTOR_VAL(const gchar, fontname))
{
  return gtk_font_selection_set_font_name (fontsel,
                                           GET_SML_CVECTOR_VAL(const gchar, fontname));
}

void
mlton_gtk_font_selection_set_preview_text (GtkFontSelection* fontsel,
                                           SML_CVECTOR_VAL(const gchar, text))
{
  gtk_font_selection_set_preview_text (fontsel,
                                       GET_SML_CVECTOR_VAL(const gchar, text));
}

GtkWidget*
mlton_gtk_font_selection_dialog_new (SML_CVECTOR_VAL(const gchar, title))
{
  return gtk_font_selection_dialog_new (GET_SML_CVECTOR_VAL(const gchar, title));
}

gboolean
mlton_gtk_font_selection_dialog_set_font_name (GtkFontSelectionDialog* fsd,
                                               SML_CVECTOR_VAL(const gchar, fontname))
{
  return gtk_font_selection_dialog_set_font_name (fsd,
                                                  GET_SML_CVECTOR_VAL(const gchar, fontname));
}

void
mlton_gtk_font_selection_dialog_set_preview_text (GtkFontSelectionDialog* fsd,
                                                  SML_CVECTOR_VAL(const gchar, text))
{
  gtk_font_selection_dialog_set_preview_text (fsd,
                                              GET_SML_CVECTOR_VAL(const gchar, text));
}

GtkWidget*
mlton_gtk_frame_new (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_frame_new (GET_SML_CVECTOR_VAL(const gchar, label));
}

void
mlton_gtk_frame_set_label (GtkFrame* frame,
                           SML_CVECTOR_VAL(const gchar, label))
{
  gtk_frame_set_label (frame,
                       GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(3, 12, 0)
void
mlton_gtk_header_bar_set_decoration_layout (GtkHeaderBar* bar,
                                            SML_CVECTOR_VAL(const gchar, layout))
{
  gtk_header_bar_set_decoration_layout (bar,
                                        GET_SML_CVECTOR_VAL(const gchar, layout));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_header_bar_set_subtitle (GtkHeaderBar* bar,
                                   SML_CVECTOR_VAL(const gchar, subtitle))
{
  gtk_header_bar_set_subtitle (bar,
                               GET_SML_CVECTOR_VAL(const gchar, subtitle));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_header_bar_set_title (GtkHeaderBar* bar,
                                SML_CVECTOR_VAL(const gchar, title))
{
  gtk_header_bar_set_title (bar,
                            GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

void
mlton_gtk_im_context_get_preedit_string (GtkIMContext* context,
                                         SML_CVECTOR_REF(gchar, str),
                                         PangoAttrList** attrs,
                                         gint* cursor_pos)
{
  gtk_im_context_get_preedit_string (context,
                                     GET_SML_CVECTOR_REF(gchar, str),
                                     attrs,
                                     cursor_pos);
}

gboolean
mlton_gtk_im_context_get_surrounding (GtkIMContext* context,
                                      SML_CVECTOR_REF(gchar, text),
                                      gint* cursor_index)
{
  return gtk_im_context_get_surrounding (context,
                                         GET_SML_CVECTOR_REF(gchar, text),
                                         cursor_index);
}

void
mlton_gtk_im_context_set_surrounding (GtkIMContext* context,
                                      SML_CVECTOR_VAL(const gchar, text),
                                      gint len,
                                      gint cursor_index)
{
  gtk_im_context_set_surrounding (context,
                                  GET_SML_CVECTOR_VAL(const gchar, text),
                                  len,
                                  cursor_index);
}

void
mlton_gtk_im_context_simple_add_compose_file (GtkIMContextSimple* context_simple,
                                              SML_CVECTOR_VAL(const gchar, compose_file))
{
  gtk_im_context_simple_add_compose_file (context_simple,
                                          GET_SML_CVECTOR_VAL(const gchar, compose_file));
}

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_im_multicontext_set_context_id (GtkIMMulticontext* context,
                                          SML_CVECTOR_VAL(const char, context_id))
{
  gtk_im_multicontext_set_context_id (context,
                                      GET_SML_CVECTOR_VAL(const char, context_id));
}
#endif

GtkIconSet*
mlton_gtk_icon_factory_lookup_default (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_icon_factory_lookup_default (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

void
mlton_gtk_icon_factory_add (GtkIconFactory* factory,
                            SML_CVECTOR_VAL(const gchar, stock_id),
                            GtkIconSet* icon_set)
{
  gtk_icon_factory_add (factory,
                        GET_SML_CVECTOR_VAL(const gchar, stock_id),
                        icon_set);
}

GtkIconSet*
mlton_gtk_icon_factory_lookup (GtkIconFactory* factory,
                               SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_icon_factory_lookup (factory,
                                  GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_icon_info_get_attach_points (GtkIconInfo* icon_info,
                                       SML_CVECTOR_REF(GdkPoint, points),
                                       gint* n_points)
{
  return gtk_icon_info_get_attach_points (icon_info,
                                          GET_SML_CVECTOR_REF(GdkPoint, points),
                                          n_points);
}
#endif

void
mlton_gtk_icon_set_get_sizes (GtkIconSet* icon_set,
                              SML_CVECTOR_REF(GtkIconSize, sizes),
                              gint* n_sizes)
{
  gtk_icon_set_get_sizes (icon_set,
                          GET_SML_CVECTOR_REF(GtkIconSize, sizes),
                          n_sizes);
}

GdkPixbuf*
mlton_gtk_icon_set_render_icon (GtkIconSet* icon_set,
                                GtkStyle* style,
                                GtkTextDirection direction,
                                GtkStateType state,
                                GtkIconSize size,
                                GtkWidget* widget,
                                SML_CVECTOR_VAL(const gchar, detail))
{
  return gtk_icon_set_render_icon (icon_set,
                                   style,
                                   direction,
                                   state,
                                   size,
                                   widget,
                                   GET_SML_CVECTOR_VAL(const gchar, detail));
}

GtkIconSize
mlton_gtk_icon_size_from_name (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_icon_size_from_name (GET_SML_CVECTOR_VAL(const gchar, name));
}

GtkIconSize
mlton_gtk_icon_size_register (SML_CVECTOR_VAL(const gchar, name),
                              gint width,
                              gint height)
{
  return gtk_icon_size_register (GET_SML_CVECTOR_VAL(const gchar, name),
                                 width,
                                 height);
}

void
mlton_gtk_icon_size_register_alias (SML_CVECTOR_VAL(const gchar, alias),
                                    GtkIconSize target)
{
  gtk_icon_size_register_alias (GET_SML_CVECTOR_VAL(const gchar, alias),
                                target);
}

void
mlton_gtk_icon_source_set_filename (GtkIconSource* source,
                                    SML_CVECTOR_VAL(gchar, filename))
{
  gtk_icon_source_set_filename (source,
                                GET_SML_CVECTOR_VAL(gchar, filename));
}

void
mlton_gtk_icon_source_set_icon_name (GtkIconSource* source,
                                     SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_icon_source_set_icon_name (source,
                                 GET_SML_CVECTOR_VAL(const gchar, icon_name));
}

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_icon_theme_add_builtin_icon (SML_CVECTOR_VAL(const gchar, icon_name),
                                       gint size,
                                       GdkPixbuf* pixbuf)
{
  gtk_icon_theme_add_builtin_icon (GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                   size,
                                   pixbuf);
}
#endif

#if GTK_CHECK_VERSION(3, 14, 0)
void
mlton_gtk_icon_theme_add_resource_path (GtkIconTheme* icon_theme,
                                        SML_CVECTOR_VAL(const gchar, path))
{
  gtk_icon_theme_add_resource_path (icon_theme,
                                    GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_icon_theme_append_search_path (GtkIconTheme* icon_theme,
                                         SML_CVECTOR_VAL(gchar, path))
{
  gtk_icon_theme_append_search_path (icon_theme,
                                     GET_SML_CVECTOR_VAL(gchar, path));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
gint*
mlton_gtk_icon_theme_get_icon_sizes (GtkIconTheme* icon_theme,
                                     SML_CVECTOR_VAL(const gchar, icon_name))
{
  return gtk_icon_theme_get_icon_sizes (icon_theme,
                                        GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
gboolean
mlton_gtk_icon_theme_has_icon (GtkIconTheme* icon_theme,
                               SML_CVECTOR_VAL(const gchar, icon_name))
{
  return gtk_icon_theme_has_icon (icon_theme,
                                  GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GList*
mlton_gtk_icon_theme_list_icons (GtkIconTheme* icon_theme,
                                 SML_CVECTOR_VAL(const gchar, context))
{
  return gtk_icon_theme_list_icons (icon_theme,
                                    GET_SML_CVECTOR_VAL(const gchar, context));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GdkPixbuf*
mlton_gtk_icon_theme_load_icon (GtkIconTheme* icon_theme,
                                SML_CVECTOR_VAL(const gchar, icon_name),
                                gint size,
                                GtkIconLookupFlags flags,
                                GError** error)
{
  return gtk_icon_theme_load_icon (icon_theme,
                                   GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                   size,
                                   flags,
                                   error);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GdkPixbuf*
mlton_gtk_icon_theme_load_icon_for_scale (GtkIconTheme* icon_theme,
                                          SML_CVECTOR_VAL(const gchar, icon_name),
                                          gint size,
                                          gint scale,
                                          GtkIconLookupFlags flags,
                                          GError** error)
{
  return gtk_icon_theme_load_icon_for_scale (icon_theme,
                                             GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                             size,
                                             scale,
                                             flags,
                                             error);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
cairo_surface_t*
mlton_gtk_icon_theme_load_surface (GtkIconTheme* icon_theme,
                                   SML_CVECTOR_VAL(const gchar, icon_name),
                                   gint size,
                                   gint scale,
                                   GdkWindow* for_window,
                                   GtkIconLookupFlags flags,
                                   GError** error)
{
  return gtk_icon_theme_load_surface (icon_theme,
                                      GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                      size,
                                      scale,
                                      for_window,
                                      flags,
                                      error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkIconInfo*
mlton_gtk_icon_theme_lookup_icon (GtkIconTheme* icon_theme,
                                  SML_CVECTOR_VAL(const gchar, icon_name),
                                  gint size,
                                  GtkIconLookupFlags flags)
{
  return gtk_icon_theme_lookup_icon (icon_theme,
                                     GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                     size,
                                     flags);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
GtkIconInfo*
mlton_gtk_icon_theme_lookup_icon_for_scale (GtkIconTheme* icon_theme,
                                            SML_CVECTOR_VAL(const gchar, icon_name),
                                            gint size,
                                            gint scale,
                                            GtkIconLookupFlags flags)
{
  return gtk_icon_theme_lookup_icon_for_scale (icon_theme,
                                               GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                               size,
                                               scale,
                                               flags);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_icon_theme_prepend_search_path (GtkIconTheme* icon_theme,
                                          SML_CVECTOR_VAL(gchar, path))
{
  gtk_icon_theme_prepend_search_path (icon_theme,
                                      GET_SML_CVECTOR_VAL(gchar, path));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_icon_theme_set_custom_theme (GtkIconTheme* icon_theme,
                                       SML_CVECTOR_VAL(const gchar, theme_name))
{
  gtk_icon_theme_set_custom_theme (icon_theme,
                                   GET_SML_CVECTOR_VAL(const gchar, theme_name));
}
#endif

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_icon_view_enable_model_drag_dest (GtkIconView* icon_view,
                                            SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                            gint n_targets,
                                            GdkDragAction actions)
{
  gtk_icon_view_enable_model_drag_dest (icon_view,
                                        GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                        n_targets,
                                        actions);
}
#endif

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_icon_view_enable_model_drag_source (GtkIconView* icon_view,
                                              GdkModifierType start_button_mask,
                                              SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                              gint n_targets,
                                              GdkDragAction actions)
{
  gtk_icon_view_enable_model_drag_source (icon_view,
                                          start_button_mask,
                                          GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                          n_targets,
                                          actions);
}
#endif

GtkWidget*
mlton_gtk_image_new_from_file (SML_CVECTOR_VAL(gchar, filename))
{
  return gtk_image_new_from_file (GET_SML_CVECTOR_VAL(gchar, filename));
}

#if GTK_CHECK_VERSION(2, 6, 0)
GtkWidget*
mlton_gtk_image_new_from_icon_name (SML_CVECTOR_VAL(const gchar, icon_name),
                                    GtkIconSize size)
{
  return gtk_image_new_from_icon_name (GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                       size);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
GtkWidget*
mlton_gtk_image_new_from_resource (SML_CVECTOR_VAL(const gchar, resource_path))
{
  return gtk_image_new_from_resource (GET_SML_CVECTOR_VAL(const gchar, resource_path));
}
#endif

GtkWidget*
mlton_gtk_image_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id),
                                GtkIconSize size)
{
  return gtk_image_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                   size);
}

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_image_get_icon_name (GtkImage* image,
                               SML_CVECTOR_REF(const gchar, icon_name),
                               GtkIconSize* size)
{
  gtk_image_get_icon_name (image,
                           GET_SML_CVECTOR_REF(const gchar, icon_name),
                           size);
}
#endif

void
mlton_gtk_image_get_stock (GtkImage* image,
                           SML_CVECTOR_REF(gchar, stock_id),
                           GtkIconSize* size)
{
  gtk_image_get_stock (image,
                       GET_SML_CVECTOR_REF(gchar, stock_id),
                       size);
}

void
mlton_gtk_image_set_from_file (GtkImage* image,
                               SML_CVECTOR_VAL(gchar, filename))
{
  gtk_image_set_from_file (image,
                           GET_SML_CVECTOR_VAL(gchar, filename));
}

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_image_set_from_icon_name (GtkImage* image,
                                    SML_CVECTOR_VAL(const gchar, icon_name),
                                    GtkIconSize size)
{
  gtk_image_set_from_icon_name (image,
                                GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                size);
}
#endif

void
mlton_gtk_image_set_from_resource (GtkImage* image,
                                   SML_CVECTOR_VAL(const gchar, resource_path))
{
  gtk_image_set_from_resource (image,
                               GET_SML_CVECTOR_VAL(const gchar, resource_path));
}

void
mlton_gtk_image_set_from_stock (GtkImage* image,
                                SML_CVECTOR_VAL(const gchar, stock_id),
                                GtkIconSize size)
{
  gtk_image_set_from_stock (image,
                            GET_SML_CVECTOR_VAL(const gchar, stock_id),
                            size);
}

GtkWidget*
mlton_gtk_image_menu_item_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id),
                                          GtkAccelGroup* accel_group)
{
  return gtk_image_menu_item_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                             accel_group);
}

GtkWidget*
mlton_gtk_image_menu_item_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_image_menu_item_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_image_menu_item_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_image_menu_item_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(2, 18, 0)
GtkWidget*
mlton_gtk_info_bar_add_button (GtkInfoBar* info_bar,
                               SML_CVECTOR_VAL(const gchar, button_text),
                               gint response_id)
{
  return gtk_info_bar_add_button (info_bar,
                                  GET_SML_CVECTOR_VAL(const gchar, button_text),
                                  response_id);
}
#endif

GtkWidget*
mlton_gtk_label_new (SML_CVECTOR_VAL(const gchar, str))
{
  return gtk_label_new (GET_SML_CVECTOR_VAL(const gchar, str));
}

GtkWidget*
mlton_gtk_label_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, str))
{
  return gtk_label_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, str));
}

void
mlton_gtk_label_set_label (GtkLabel* label,
                           SML_CVECTOR_VAL(const gchar, str))
{
  gtk_label_set_label (label,
                       GET_SML_CVECTOR_VAL(const gchar, str));
}

void
mlton_gtk_label_set_markup (GtkLabel* label,
                            SML_CVECTOR_VAL(const gchar, str))
{
  gtk_label_set_markup (label,
                        GET_SML_CVECTOR_VAL(const gchar, str));
}

void
mlton_gtk_label_set_markup_with_mnemonic (GtkLabel* label,
                                          SML_CVECTOR_VAL(const gchar, str))
{
  gtk_label_set_markup_with_mnemonic (label,
                                      GET_SML_CVECTOR_VAL(const gchar, str));
}

void
mlton_gtk_label_set_pattern (GtkLabel* label,
                             SML_CVECTOR_VAL(const gchar, pattern))
{
  gtk_label_set_pattern (label,
                         GET_SML_CVECTOR_VAL(const gchar, pattern));
}

void
mlton_gtk_label_set_text (GtkLabel* label,
                          SML_CVECTOR_VAL(const gchar, str))
{
  gtk_label_set_text (label,
                      GET_SML_CVECTOR_VAL(const gchar, str));
}

void
mlton_gtk_label_set_text_with_mnemonic (GtkLabel* label,
                                        SML_CVECTOR_VAL(const gchar, str))
{
  gtk_label_set_text_with_mnemonic (label,
                                    GET_SML_CVECTOR_VAL(const gchar, str));
}

#if GTK_CHECK_VERSION(3, 6, 0)
void
mlton_gtk_level_bar_add_offset_value (GtkLevelBar* self,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      gdouble value)
{
  gtk_level_bar_add_offset_value (self,
                                  GET_SML_CVECTOR_VAL(const gchar, name),
                                  value);
}
#endif

#if GTK_CHECK_VERSION(3, 6, 0)
gboolean
mlton_gtk_level_bar_get_offset_value (GtkLevelBar* self,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      gdouble* value)
{
  return gtk_level_bar_get_offset_value (self,
                                         GET_SML_CVECTOR_VAL(const gchar, name),
                                         value);
}
#endif

#if GTK_CHECK_VERSION(3, 6, 0)
void
mlton_gtk_level_bar_remove_offset_value (GtkLevelBar* self,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  gtk_level_bar_remove_offset_value (self,
                                     GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkWidget*
mlton_gtk_link_button_new (SML_CVECTOR_VAL(const gchar, uri))
{
  return gtk_link_button_new (GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkWidget*
mlton_gtk_link_button_new_with_label (SML_CVECTOR_VAL(const gchar, uri),
                                      SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_link_button_new_with_label (GET_SML_CVECTOR_VAL(const gchar, uri),
                                         GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_link_button_set_uri (GtkLinkButton* link_button,
                               SML_CVECTOR_VAL(const gchar, uri))
{
  gtk_link_button_set_uri (link_button,
                           GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

GtkListStore*
mlton_gtk_list_store_newv (gint n_columns,
                           SML_CVECTOR_VAL(GType, types))
{
  return gtk_list_store_newv (n_columns,
                              GET_SML_CVECTOR_VAL(GType, types));
}

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_list_store_insert_with_valuesv (GtkListStore* list_store,
                                          GtkTreeIter* iter,
                                          gint position,
                                          SML_CVECTOR_VAL(gint, columns),
                                          SML_CVECTOR_VAL(GValue, values),
                                          gint n_values)
{
  gtk_list_store_insert_with_valuesv (list_store,
                                      iter,
                                      position,
                                      GET_SML_CVECTOR_VAL(gint, columns),
                                      GET_SML_CVECTOR_VAL(GValue, values),
                                      n_values);
}
#endif

#if GTK_CHECK_VERSION(2, 2, 0)
void
mlton_gtk_list_store_reorder (GtkListStore* store,
                              SML_CVECTOR_VAL(gint, new_order))
{
  gtk_list_store_reorder (store,
                          GET_SML_CVECTOR_VAL(gint, new_order));
}
#endif

void
mlton_gtk_list_store_set_column_types (GtkListStore* list_store,
                                       gint n_columns,
                                       SML_CVECTOR_VAL(GType, types))
{
  gtk_list_store_set_column_types (list_store,
                                   n_columns,
                                   GET_SML_CVECTOR_VAL(GType, types));
}

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_list_store_set_valuesv (GtkListStore* list_store,
                                  GtkTreeIter* iter,
                                  SML_CVECTOR_VAL(gint, columns),
                                  SML_CVECTOR_VAL(GValue, values),
                                  gint n_values)
{
  gtk_list_store_set_valuesv (list_store,
                              iter,
                              GET_SML_CVECTOR_VAL(gint, columns),
                              GET_SML_CVECTOR_VAL(GValue, values),
                              n_values);
}
#endif

void
mlton_gtk_menu_set_accel_path (GtkMenu* menu,
                               SML_CVECTOR_VAL(const gchar, accel_path))
{
  gtk_menu_set_accel_path (menu,
                           GET_SML_CVECTOR_VAL(const gchar, accel_path));
}

void
mlton_gtk_menu_set_title (GtkMenu* menu,
                          SML_CVECTOR_VAL(const gchar, title))
{
  gtk_menu_set_title (menu,
                      GET_SML_CVECTOR_VAL(const gchar, title));
}

GtkWidget*
mlton_gtk_menu_item_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_menu_item_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_menu_item_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_menu_item_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

void
mlton_gtk_menu_item_set_accel_path (GtkMenuItem* menu_item,
                                    SML_CVECTOR_VAL(const gchar, accel_path))
{
  gtk_menu_item_set_accel_path (menu_item,
                                GET_SML_CVECTOR_VAL(const gchar, accel_path));
}

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_menu_item_set_label (GtkMenuItem* menu_item,
                               SML_CVECTOR_VAL(const gchar, label))
{
  gtk_menu_item_set_label (menu_item,
                           GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(3, 6, 0)
void
mlton_gtk_menu_shell_bind_model (GtkMenuShell* menu_shell,
                                 GMenuModel* model,
                                 SML_CVECTOR_VAL(const gchar, action_namespace),
                                 gboolean with_separators)
{
  gtk_menu_shell_bind_model (menu_shell,
                             model,
                             GET_SML_CVECTOR_VAL(const gchar, action_namespace),
                             with_separators);
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
GtkToolItem*
mlton_gtk_menu_tool_button_new (GtkWidget* icon_widget,
                                SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_menu_tool_button_new (icon_widget,
                                   GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
GtkToolItem*
mlton_gtk_menu_tool_button_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_menu_tool_button_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_menu_tool_button_set_arrow_tooltip_markup (GtkMenuToolButton* button,
                                                     SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_menu_tool_button_set_arrow_tooltip_markup (button,
                                                 GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_menu_tool_button_set_arrow_tooltip_text (GtkMenuToolButton* button,
                                                   SML_CVECTOR_VAL(const gchar, text))
{
  gtk_menu_tool_button_set_arrow_tooltip_text (button,
                                               GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_message_dialog_set_markup (GtkMessageDialog* message_dialog,
                                     SML_CVECTOR_VAL(const gchar, str))
{
  gtk_message_dialog_set_markup (message_dialog,
                                 GET_SML_CVECTOR_VAL(const gchar, str));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_native_dialog_set_title (GtkNativeDialog* self,
                                   SML_CVECTOR_VAL(const char, title))
{
  gtk_native_dialog_set_title (self,
                               GET_SML_CVECTOR_VAL(const char, title));
}
#endif

#if GTK_CHECK_VERSION(2, 24, 0)
void
mlton_gtk_notebook_set_group_name (GtkNotebook* notebook,
                                   SML_CVECTOR_VAL(const gchar, group_name))
{
  gtk_notebook_set_group_name (notebook,
                               GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

void
mlton_gtk_notebook_set_menu_label_text (GtkNotebook* notebook,
                                        GtkWidget* child,
                                        SML_CVECTOR_VAL(const gchar, menu_text))
{
  gtk_notebook_set_menu_label_text (notebook,
                                    child,
                                    GET_SML_CVECTOR_VAL(const gchar, menu_text));
}

void
mlton_gtk_notebook_set_tab_label_text (GtkNotebook* notebook,
                                       GtkWidget* child,
                                       SML_CVECTOR_VAL(const gchar, tab_text))
{
  gtk_notebook_set_tab_label_text (notebook,
                                   child,
                                   GET_SML_CVECTOR_VAL(const gchar, tab_text));
}

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_numerable_icon_set_background_icon_name (GtkNumerableIcon* self,
                                                   SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_numerable_icon_set_background_icon_name (self,
                                               GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_numerable_icon_set_label (GtkNumerableIcon* self,
                                    SML_CVECTOR_VAL(const gchar, label))
{
  gtk_numerable_icon_set_label (self,
                                GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_pad_controller_set_action (GtkPadController* controller,
                                     GtkPadActionType type,
                                     gint index,
                                     gint mode,
                                     SML_CVECTOR_VAL(const gchar, label),
                                     SML_CVECTOR_VAL(const gchar, action_name))
{
  gtk_pad_controller_set_action (controller,
                                 type,
                                 index,
                                 mode,
                                 GET_SML_CVECTOR_VAL(const gchar, label),
                                 GET_SML_CVECTOR_VAL(const gchar, action_name));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_pad_controller_set_action_entries (GtkPadController* controller,
                                             SML_CVECTOR_VAL(GtkPadActionEntry, entries),
                                             gint n_entries)
{
  gtk_pad_controller_set_action_entries (controller,
                                         GET_SML_CVECTOR_VAL(GtkPadActionEntry, entries),
                                         n_entries);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkPageSetup*
mlton_gtk_page_setup_new_from_file (SML_CVECTOR_VAL(gchar, file_name),
                                    GError** error)
{
  return gtk_page_setup_new_from_file (GET_SML_CVECTOR_VAL(gchar, file_name),
                                       error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkPageSetup*
mlton_gtk_page_setup_new_from_key_file (GKeyFile* key_file,
                                        SML_CVECTOR_VAL(const gchar, group_name),
                                        GError** error)
{
  return gtk_page_setup_new_from_key_file (key_file,
                                           GET_SML_CVECTOR_VAL(const gchar, group_name),
                                           error);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
gboolean
mlton_gtk_page_setup_load_file (GtkPageSetup* setup,
                                SML_CVECTOR_VAL(char, file_name),
                                GError** error)
{
  return gtk_page_setup_load_file (setup,
                                   GET_SML_CVECTOR_VAL(char, file_name),
                                   error);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
gboolean
mlton_gtk_page_setup_load_key_file (GtkPageSetup* setup,
                                    GKeyFile* key_file,
                                    SML_CVECTOR_VAL(const gchar, group_name),
                                    GError** error)
{
  return gtk_page_setup_load_key_file (setup,
                                       key_file,
                                       GET_SML_CVECTOR_VAL(const gchar, group_name),
                                       error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
gboolean
mlton_gtk_page_setup_to_file (GtkPageSetup* setup,
                              SML_CVECTOR_VAL(char, file_name),
                              GError** error)
{
  return gtk_page_setup_to_file (setup,
                                 GET_SML_CVECTOR_VAL(char, file_name),
                                 error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_page_setup_to_key_file (GtkPageSetup* setup,
                                  GKeyFile* key_file,
                                  SML_CVECTOR_VAL(const gchar, group_name))
{
  gtk_page_setup_to_key_file (setup,
                              key_file,
                              GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkPaperSize*
mlton_gtk_paper_size_new (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_paper_size_new (GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkPaperSize*
mlton_gtk_paper_size_new_custom (SML_CVECTOR_VAL(const gchar, name),
                                 SML_CVECTOR_VAL(const gchar, display_name),
                                 gdouble width,
                                 gdouble height,
                                 GtkUnit unit)
{
  return gtk_paper_size_new_custom (GET_SML_CVECTOR_VAL(const gchar, name),
                                    GET_SML_CVECTOR_VAL(const gchar, display_name),
                                    width,
                                    height,
                                    unit);
}
#endif

#if GTK_CHECK_VERSION(3, 16, 0)
GtkPaperSize*
mlton_gtk_paper_size_new_from_ipp (SML_CVECTOR_VAL(const gchar, ipp_name),
                                   gdouble width,
                                   gdouble height)
{
  return gtk_paper_size_new_from_ipp (GET_SML_CVECTOR_VAL(const gchar, ipp_name),
                                      width,
                                      height);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkPaperSize*
mlton_gtk_paper_size_new_from_key_file (GKeyFile* key_file,
                                        SML_CVECTOR_VAL(const gchar, group_name),
                                        GError** error)
{
  return gtk_paper_size_new_from_key_file (key_file,
                                           GET_SML_CVECTOR_VAL(const gchar, group_name),
                                           error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkPaperSize*
mlton_gtk_paper_size_new_from_ppd (SML_CVECTOR_VAL(const gchar, ppd_name),
                                   SML_CVECTOR_VAL(const gchar, ppd_display_name),
                                   gdouble width,
                                   gdouble height)
{
  return gtk_paper_size_new_from_ppd (GET_SML_CVECTOR_VAL(const gchar, ppd_name),
                                      GET_SML_CVECTOR_VAL(const gchar, ppd_display_name),
                                      width,
                                      height);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_paper_size_to_key_file (GtkPaperSize* size,
                                  GKeyFile* key_file,
                                  SML_CVECTOR_VAL(const gchar, group_name))
{
  gtk_paper_size_to_key_file (size,
                              key_file,
                              GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

#if GTK_CHECK_VERSION(3, 12, 0)
void
mlton_gtk_popover_bind_model (GtkPopover* popover,
                              GMenuModel* model,
                              SML_CVECTOR_VAL(const gchar, action_namespace))
{
  gtk_popover_bind_model (popover,
                          model,
                          GET_SML_CVECTOR_VAL(const gchar, action_namespace));
}
#endif

#if GTK_CHECK_VERSION(3, 16, 0)
void
mlton_gtk_popover_menu_open_submenu (GtkPopoverMenu* popover,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  gtk_popover_menu_open_submenu (popover,
                                 GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_operation_set_custom_tab_label (GtkPrintOperation* op,
                                                SML_CVECTOR_VAL(const gchar, label))
{
  gtk_print_operation_set_custom_tab_label (op,
                                            GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_operation_set_export_filename (GtkPrintOperation* op,
                                               SML_CVECTOR_VAL(gchar, filename))
{
  gtk_print_operation_set_export_filename (op,
                                           GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_operation_set_job_name (GtkPrintOperation* op,
                                        SML_CVECTOR_VAL(const gchar, job_name))
{
  gtk_print_operation_set_job_name (op,
                                    GET_SML_CVECTOR_VAL(const gchar, job_name));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkPrintSettings*
mlton_gtk_print_settings_new_from_file (SML_CVECTOR_VAL(gchar, file_name),
                                        GError** error)
{
  return gtk_print_settings_new_from_file (GET_SML_CVECTOR_VAL(gchar, file_name),
                                           error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkPrintSettings*
mlton_gtk_print_settings_new_from_key_file (GKeyFile* key_file,
                                            SML_CVECTOR_VAL(const gchar, group_name),
                                            GError** error)
{
  return gtk_print_settings_new_from_key_file (key_file,
                                               GET_SML_CVECTOR_VAL(const gchar, group_name),
                                               error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
const gchar*
mlton_gtk_print_settings_get (GtkPrintSettings* settings,
                              SML_CVECTOR_VAL(const gchar, key))
{
  return gtk_print_settings_get (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_print_settings_get_bool (GtkPrintSettings* settings,
                                   SML_CVECTOR_VAL(const gchar, key))
{
  return gtk_print_settings_get_bool (settings,
                                      GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gdouble
mlton_gtk_print_settings_get_double (GtkPrintSettings* settings,
                                     SML_CVECTOR_VAL(const gchar, key))
{
  return gtk_print_settings_get_double (settings,
                                        GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gdouble
mlton_gtk_print_settings_get_double_with_default (GtkPrintSettings* settings,
                                                  SML_CVECTOR_VAL(const gchar, key),
                                                  gdouble def)
{
  return gtk_print_settings_get_double_with_default (settings,
                                                     GET_SML_CVECTOR_VAL(const gchar, key),
                                                     def);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gint
mlton_gtk_print_settings_get_int (GtkPrintSettings* settings,
                                  SML_CVECTOR_VAL(const gchar, key))
{
  return gtk_print_settings_get_int (settings,
                                     GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gint
mlton_gtk_print_settings_get_int_with_default (GtkPrintSettings* settings,
                                               SML_CVECTOR_VAL(const gchar, key),
                                               gint def)
{
  return gtk_print_settings_get_int_with_default (settings,
                                                  GET_SML_CVECTOR_VAL(const gchar, key),
                                                  def);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gdouble
mlton_gtk_print_settings_get_length (GtkPrintSettings* settings,
                                     SML_CVECTOR_VAL(const gchar, key),
                                     GtkUnit unit)
{
  return gtk_print_settings_get_length (settings,
                                        GET_SML_CVECTOR_VAL(const gchar, key),
                                        unit);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_print_settings_has_key (GtkPrintSettings* settings,
                                  SML_CVECTOR_VAL(const gchar, key))
{
  return gtk_print_settings_has_key (settings,
                                     GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
gboolean
mlton_gtk_print_settings_load_file (GtkPrintSettings* settings,
                                    SML_CVECTOR_VAL(gchar, file_name),
                                    GError** error)
{
  return gtk_print_settings_load_file (settings,
                                       GET_SML_CVECTOR_VAL(gchar, file_name),
                                       error);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
gboolean
mlton_gtk_print_settings_load_key_file (GtkPrintSettings* settings,
                                        GKeyFile* key_file,
                                        SML_CVECTOR_VAL(const gchar, group_name),
                                        GError** error)
{
  return gtk_print_settings_load_key_file (settings,
                                           key_file,
                                           GET_SML_CVECTOR_VAL(const gchar, group_name),
                                           error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set (GtkPrintSettings* settings,
                              SML_CVECTOR_VAL(const gchar, key),
                              SML_CVECTOR_VAL(const gchar, value))
{
  gtk_print_settings_set (settings,
                          GET_SML_CVECTOR_VAL(const gchar, key),
                          GET_SML_CVECTOR_VAL(const gchar, value));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_bool (GtkPrintSettings* settings,
                                   SML_CVECTOR_VAL(const gchar, key),
                                   gboolean value)
{
  gtk_print_settings_set_bool (settings,
                               GET_SML_CVECTOR_VAL(const gchar, key),
                               value);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_default_source (GtkPrintSettings* settings,
                                             SML_CVECTOR_VAL(const gchar, default_source))
{
  gtk_print_settings_set_default_source (settings,
                                         GET_SML_CVECTOR_VAL(const gchar, default_source));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_dither (GtkPrintSettings* settings,
                                     SML_CVECTOR_VAL(const gchar, dither))
{
  gtk_print_settings_set_dither (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, dither));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_double (GtkPrintSettings* settings,
                                     SML_CVECTOR_VAL(const gchar, key),
                                     gdouble value)
{
  gtk_print_settings_set_double (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 value);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_finishings (GtkPrintSettings* settings,
                                         SML_CVECTOR_VAL(const gchar, finishings))
{
  gtk_print_settings_set_finishings (settings,
                                     GET_SML_CVECTOR_VAL(const gchar, finishings));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_int (GtkPrintSettings* settings,
                                  SML_CVECTOR_VAL(const gchar, key),
                                  gint value)
{
  gtk_print_settings_set_int (settings,
                              GET_SML_CVECTOR_VAL(const gchar, key),
                              value);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_length (GtkPrintSettings* settings,
                                     SML_CVECTOR_VAL(const gchar, key),
                                     gdouble value,
                                     GtkUnit unit)
{
  gtk_print_settings_set_length (settings,
                                 GET_SML_CVECTOR_VAL(const gchar, key),
                                 value,
                                 unit);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_media_type (GtkPrintSettings* settings,
                                         SML_CVECTOR_VAL(const gchar, media_type))
{
  gtk_print_settings_set_media_type (settings,
                                     GET_SML_CVECTOR_VAL(const gchar, media_type));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_output_bin (GtkPrintSettings* settings,
                                         SML_CVECTOR_VAL(const gchar, output_bin))
{
  gtk_print_settings_set_output_bin (settings,
                                     GET_SML_CVECTOR_VAL(const gchar, output_bin));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_page_ranges (GtkPrintSettings* settings,
                                          SML_CVECTOR_VAL(GtkPageRange, page_ranges),
                                          gint num_ranges)
{
  gtk_print_settings_set_page_ranges (settings,
                                      GET_SML_CVECTOR_VAL(GtkPageRange, page_ranges),
                                      num_ranges);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_set_printer (GtkPrintSettings* settings,
                                      SML_CVECTOR_VAL(const gchar, printer))
{
  gtk_print_settings_set_printer (settings,
                                  GET_SML_CVECTOR_VAL(const gchar, printer));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
gboolean
mlton_gtk_print_settings_to_file (GtkPrintSettings* settings,
                                  SML_CVECTOR_VAL(gchar, file_name),
                                  GError** error)
{
  return gtk_print_settings_to_file (settings,
                                     GET_SML_CVECTOR_VAL(gchar, file_name),
                                     error);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_print_settings_to_key_file (GtkPrintSettings* settings,
                                      GKeyFile* key_file,
                                      SML_CVECTOR_VAL(const gchar, group_name))
{
  gtk_print_settings_to_key_file (settings,
                                  key_file,
                                  GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_print_settings_unset (GtkPrintSettings* settings,
                                SML_CVECTOR_VAL(const gchar, key))
{
  gtk_print_settings_unset (settings,
                            GET_SML_CVECTOR_VAL(const gchar, key));
}
#endif

void
mlton_gtk_progress_bar_set_text (GtkProgressBar* pbar,
                                 SML_CVECTOR_VAL(const gchar, text))
{
  gtk_progress_bar_set_text (pbar,
                             GET_SML_CVECTOR_VAL(const gchar, text));
}

#if GTK_CHECK_VERSION(2, 4, 0)
GtkRadioAction*
mlton_gtk_radio_action_new (SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, label),
                            SML_CVECTOR_VAL(const gchar, tooltip),
                            SML_CVECTOR_VAL(const gchar, stock_id),
                            gint value)
{
  return gtk_radio_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                               GET_SML_CVECTOR_VAL(const gchar, label),
                               GET_SML_CVECTOR_VAL(const gchar, tooltip),
                               GET_SML_CVECTOR_VAL(const gchar, stock_id),
                               value);
}
#endif

GtkWidget*
mlton_gtk_radio_button_new_with_label (GSList* group,
                                       SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_button_new_with_label (group,
                                          GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_radio_button_new_with_label_from_widget (GtkRadioButton* radio_group_member,
                                                   SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_button_new_with_label_from_widget (radio_group_member,
                                                      GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_radio_button_new_with_mnemonic (GSList* group,
                                          SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_button_new_with_mnemonic (group,
                                             GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_radio_button_new_with_mnemonic_from_widget (GtkRadioButton* radio_group_member,
                                                      SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_button_new_with_mnemonic_from_widget (radio_group_member,
                                                         GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_radio_menu_item_new_with_label (GSList* group,
                                          SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_menu_item_new_with_label (group,
                                             GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_radio_menu_item_new_with_label_from_widget (GtkRadioMenuItem* group,
                                                      SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_menu_item_new_with_label_from_widget (group,
                                                         GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

GtkWidget*
mlton_gtk_radio_menu_item_new_with_mnemonic (GSList* group,
                                             SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_menu_item_new_with_mnemonic (group,
                                                GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_radio_menu_item_new_with_mnemonic_from_widget (GtkRadioMenuItem* group,
                                                         SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_radio_menu_item_new_with_mnemonic_from_widget (group,
                                                            GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToolItem*
mlton_gtk_radio_tool_button_new_from_stock (GSList* group,
                                            SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_radio_tool_button_new_from_stock (group,
                                               GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToolItem*
mlton_gtk_radio_tool_button_new_with_stock_from_widget (GtkRadioToolButton* group,
                                                        SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_radio_tool_button_new_with_stock_from_widget (group,
                                                           GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkAction*
mlton_gtk_recent_action_new (SML_CVECTOR_VAL(const gchar, name),
                             SML_CVECTOR_VAL(const gchar, label),
                             SML_CVECTOR_VAL(const gchar, tooltip),
                             SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_recent_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                                GET_SML_CVECTOR_VAL(const gchar, label),
                                GET_SML_CVECTOR_VAL(const gchar, tooltip),
                                GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkAction*
mlton_gtk_recent_action_new_for_manager (SML_CVECTOR_VAL(const gchar, name),
                                         SML_CVECTOR_VAL(const gchar, label),
                                         SML_CVECTOR_VAL(const gchar, tooltip),
                                         SML_CVECTOR_VAL(const gchar, stock_id),
                                         GtkRecentManager* manager)
{
  return gtk_recent_action_new_for_manager (GET_SML_CVECTOR_VAL(const gchar, name),
                                            GET_SML_CVECTOR_VAL(const gchar, label),
                                            GET_SML_CVECTOR_VAL(const gchar, tooltip),
                                            GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                            manager);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_chooser_select_uri (GtkRecentChooser* chooser,
                                     SML_CVECTOR_VAL(const gchar, uri),
                                     GError** error)
{
  return gtk_recent_chooser_select_uri (chooser,
                                        GET_SML_CVECTOR_VAL(const gchar, uri),
                                        error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_chooser_set_current_uri (GtkRecentChooser* chooser,
                                          SML_CVECTOR_VAL(const gchar, uri),
                                          GError** error)
{
  return gtk_recent_chooser_set_current_uri (chooser,
                                             GET_SML_CVECTOR_VAL(const gchar, uri),
                                             error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_chooser_unselect_uri (GtkRecentChooser* chooser,
                                       SML_CVECTOR_VAL(const gchar, uri))
{
  gtk_recent_chooser_unselect_uri (chooser,
                                   GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_filter_add_application (GtkRecentFilter* filter,
                                         SML_CVECTOR_VAL(const gchar, application))
{
  gtk_recent_filter_add_application (filter,
                                     GET_SML_CVECTOR_VAL(const gchar, application));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_filter_add_group (GtkRecentFilter* filter,
                                   SML_CVECTOR_VAL(const gchar, group))
{
  gtk_recent_filter_add_group (filter,
                               GET_SML_CVECTOR_VAL(const gchar, group));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_filter_add_mime_type (GtkRecentFilter* filter,
                                       SML_CVECTOR_VAL(const gchar, mime_type))
{
  gtk_recent_filter_add_mime_type (filter,
                                   GET_SML_CVECTOR_VAL(const gchar, mime_type));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_filter_add_pattern (GtkRecentFilter* filter,
                                     SML_CVECTOR_VAL(const gchar, pattern))
{
  gtk_recent_filter_add_pattern (filter,
                                 GET_SML_CVECTOR_VAL(const gchar, pattern));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_recent_filter_set_name (GtkRecentFilter* filter,
                                  SML_CVECTOR_VAL(const gchar, name))
{
  gtk_recent_filter_set_name (filter,
                              GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

GAppInfo*
mlton_gtk_recent_info_create_app_info (GtkRecentInfo* info,
                                       SML_CVECTOR_VAL(const gchar, app_name),
                                       GError** error)
{
  return gtk_recent_info_create_app_info (info,
                                          GET_SML_CVECTOR_VAL(const gchar, app_name),
                                          error);
}

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_info_get_application_info (GtkRecentInfo* info,
                                            SML_CVECTOR_VAL(const gchar, app_name),
                                            SML_CVECTOR_REF(const gchar, app_exec),
                                            guint* count,
                                            time_t* time_)
{
  return gtk_recent_info_get_application_info (info,
                                               GET_SML_CVECTOR_VAL(const gchar, app_name),
                                               GET_SML_CVECTOR_REF(const gchar, app_exec),
                                               count,
                                               time_);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_info_has_application (GtkRecentInfo* info,
                                       SML_CVECTOR_VAL(const gchar, app_name))
{
  return gtk_recent_info_has_application (info,
                                          GET_SML_CVECTOR_VAL(const gchar, app_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_info_has_group (GtkRecentInfo* info,
                                 SML_CVECTOR_VAL(const gchar, group_name))
{
  return gtk_recent_info_has_group (info,
                                    GET_SML_CVECTOR_VAL(const gchar, group_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_manager_add_full (GtkRecentManager* manager,
                                   SML_CVECTOR_VAL(const gchar, uri),
                                   const GtkRecentData* recent_data)
{
  return gtk_recent_manager_add_full (manager,
                                      GET_SML_CVECTOR_VAL(const gchar, uri),
                                      recent_data);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_manager_add_item (GtkRecentManager* manager,
                                   SML_CVECTOR_VAL(const gchar, uri))
{
  return gtk_recent_manager_add_item (manager,
                                      GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_manager_has_item (GtkRecentManager* manager,
                                   SML_CVECTOR_VAL(const gchar, uri))
{
  return gtk_recent_manager_has_item (manager,
                                      GET_SML_CVECTOR_VAL(const gchar, uri));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkRecentInfo*
mlton_gtk_recent_manager_lookup_item (GtkRecentManager* manager,
                                      SML_CVECTOR_VAL(const gchar, uri),
                                      GError** error)
{
  return gtk_recent_manager_lookup_item (manager,
                                         GET_SML_CVECTOR_VAL(const gchar, uri),
                                         error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_manager_move_item (GtkRecentManager* manager,
                                    SML_CVECTOR_VAL(const gchar, uri),
                                    SML_CVECTOR_VAL(const gchar, new_uri),
                                    GError** error)
{
  return gtk_recent_manager_move_item (manager,
                                       GET_SML_CVECTOR_VAL(const gchar, uri),
                                       GET_SML_CVECTOR_VAL(const gchar, new_uri),
                                       error);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_recent_manager_remove_item (GtkRecentManager* manager,
                                      SML_CVECTOR_VAL(const gchar, uri),
                                      GError** error)
{
  return gtk_recent_manager_remove_item (manager,
                                         GET_SML_CVECTOR_VAL(const gchar, uri),
                                         error);
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_scale_add_mark (GtkScale* scale,
                          gdouble value,
                          GtkPositionType position,
                          SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_scale_add_mark (scale,
                      value,
                      position,
                      GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
GtkWidget*
mlton_gtk_scale_button_new (GtkIconSize size,
                            gdouble min,
                            gdouble max,
                            gdouble step,
                            SML_CVECTORVECTOR_VAL(const gchar, icons))
{
  return gtk_scale_button_new (size,
                               min,
                               max,
                               step,
                               GET_SML_CVECTORVECTOR_VAL(const gchar, icons));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_scale_button_set_icons (GtkScaleButton* button,
                                  SML_CVECTORVECTOR_VAL(const gchar, icons))
{
  gtk_scale_button_set_icons (button,
                              GET_SML_CVECTORVECTOR_VAL(const gchar, icons));
}
#endif

gboolean
mlton_gtk_selection_data_get_targets (const GtkSelectionData* selection_data,
                                      SML_CVECTOR_REF(GdkAtom, targets),
                                      gint* n_atoms)
{
  return gtk_selection_data_get_targets (selection_data,
                                         GET_SML_CVECTOR_REF(GdkAtom, targets),
                                         n_atoms);
}

void
mlton_gtk_selection_data_set (GtkSelectionData* selection_data,
                              GdkAtom type,
                              gint format,
                              SML_CVECTOR_VAL(guchar, data),
                              gint length)
{
  gtk_selection_data_set (selection_data,
                          type,
                          format,
                          GET_SML_CVECTOR_VAL(guchar, data),
                          length);
}

gboolean
mlton_gtk_selection_data_set_text (GtkSelectionData* selection_data,
                                   SML_CVECTOR_VAL(const gchar, str),
                                   gint len)
{
  return gtk_selection_data_set_text (selection_data,
                                      GET_SML_CVECTOR_VAL(const gchar, str),
                                      len);
}

#if GTK_CHECK_VERSION(2, 6, 0)
gboolean
mlton_gtk_selection_data_set_uris (GtkSelectionData* selection_data,
                                   SML_CVECTORVECTOR_VAL(gchar, uris))
{
  return gtk_selection_data_set_uris (selection_data,
                                      GET_SML_CVECTORVECTOR_VAL(gchar, uris));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_settings_reset_property (GtkSettings* settings,
                                   SML_CVECTOR_VAL(const gchar, name))
{
  gtk_settings_reset_property (settings,
                               GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

void
mlton_gtk_settings_set_double_property (GtkSettings* settings,
                                        SML_CVECTOR_VAL(const gchar, name),
                                        gdouble v_double,
                                        SML_CVECTOR_VAL(const gchar, origin))
{
  gtk_settings_set_double_property (settings,
                                    GET_SML_CVECTOR_VAL(const gchar, name),
                                    v_double,
                                    GET_SML_CVECTOR_VAL(const gchar, origin));
}

void
mlton_gtk_settings_set_long_property (GtkSettings* settings,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      glong v_long,
                                      SML_CVECTOR_VAL(const gchar, origin))
{
  gtk_settings_set_long_property (settings,
                                  GET_SML_CVECTOR_VAL(const gchar, name),
                                  v_long,
                                  GET_SML_CVECTOR_VAL(const gchar, origin));
}

void
mlton_gtk_settings_set_property_value (GtkSettings* settings,
                                       SML_CVECTOR_VAL(const gchar, name),
                                       const GtkSettingsValue* svalue)
{
  gtk_settings_set_property_value (settings,
                                   GET_SML_CVECTOR_VAL(const gchar, name),
                                   svalue);
}

void
mlton_gtk_settings_set_string_property (GtkSettings* settings,
                                        SML_CVECTOR_VAL(const gchar, name),
                                        SML_CVECTOR_VAL(const gchar, v_string),
                                        SML_CVECTOR_VAL(const gchar, origin))
{
  gtk_settings_set_string_property (settings,
                                    GET_SML_CVECTOR_VAL(const gchar, name),
                                    GET_SML_CVECTOR_VAL(const gchar, v_string),
                                    GET_SML_CVECTOR_VAL(const gchar, origin));
}

#if GTK_CHECK_VERSION(3, 22, 0)
GtkWidget*
mlton_gtk_shortcut_label_new (SML_CVECTOR_VAL(const gchar, accelerator))
{
  return gtk_shortcut_label_new (GET_SML_CVECTOR_VAL(const gchar, accelerator));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_shortcut_label_set_accelerator (GtkShortcutLabel* self,
                                          SML_CVECTOR_VAL(const gchar, accelerator))
{
  gtk_shortcut_label_set_accelerator (self,
                                      GET_SML_CVECTOR_VAL(const gchar, accelerator));
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
void
mlton_gtk_shortcut_label_set_disabled_text (GtkShortcutLabel* self,
                                            SML_CVECTOR_VAL(const gchar, disabled_text))
{
  gtk_shortcut_label_set_disabled_text (self,
                                        GET_SML_CVECTOR_VAL(const gchar, disabled_text));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_stack_add_named (GtkStack* stack,
                           GtkWidget* child,
                           SML_CVECTOR_VAL(const gchar, name))
{
  gtk_stack_add_named (stack,
                       child,
                       GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_stack_add_titled (GtkStack* stack,
                            GtkWidget* child,
                            SML_CVECTOR_VAL(const gchar, name),
                            SML_CVECTOR_VAL(const gchar, title))
{
  gtk_stack_add_titled (stack,
                        child,
                        GET_SML_CVECTOR_VAL(const gchar, name),
                        GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(3, 12, 0)
GtkWidget*
mlton_gtk_stack_get_child_by_name (GtkStack* stack,
                                   SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_stack_get_child_by_name (stack,
                                      GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_stack_set_visible_child_full (GtkStack* stack,
                                        SML_CVECTOR_VAL(const gchar, name),
                                        GtkStackTransitionType transition)
{
  gtk_stack_set_visible_child_full (stack,
                                    GET_SML_CVECTOR_VAL(const gchar, name),
                                    transition);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_stack_set_visible_child_name (GtkStack* stack,
                                        SML_CVECTOR_VAL(const gchar, name))
{
  gtk_stack_set_visible_child_name (stack,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkStatusIcon*
mlton_gtk_status_icon_new_from_file (SML_CVECTOR_VAL(gchar, filename))
{
  return gtk_status_icon_new_from_file (GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkStatusIcon*
mlton_gtk_status_icon_new_from_icon_name (SML_CVECTOR_VAL(const gchar, icon_name))
{
  return gtk_status_icon_new_from_icon_name (GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GtkStatusIcon*
mlton_gtk_status_icon_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_status_icon_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_status_icon_set_from_file (GtkStatusIcon* status_icon,
                                     SML_CVECTOR_VAL(gchar, filename))
{
  gtk_status_icon_set_from_file (status_icon,
                                 GET_SML_CVECTOR_VAL(gchar, filename));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_status_icon_set_from_icon_name (GtkStatusIcon* status_icon,
                                          SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_status_icon_set_from_icon_name (status_icon,
                                      GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_status_icon_set_from_stock (GtkStatusIcon* status_icon,
                                      SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_status_icon_set_from_stock (status_icon,
                                  GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 20, 0)
void
mlton_gtk_status_icon_set_name (GtkStatusIcon* status_icon,
                                SML_CVECTOR_VAL(const gchar, name))
{
  gtk_status_icon_set_name (status_icon,
                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(2, 18, 0)
void
mlton_gtk_status_icon_set_title (GtkStatusIcon* status_icon,
                                 SML_CVECTOR_VAL(const gchar, title))
{
  gtk_status_icon_set_title (status_icon,
                             GET_SML_CVECTOR_VAL(const gchar, title));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_status_icon_set_tooltip_markup (GtkStatusIcon* status_icon,
                                          SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_status_icon_set_tooltip_markup (status_icon,
                                      GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_status_icon_set_tooltip_text (GtkStatusIcon* status_icon,
                                        SML_CVECTOR_VAL(const gchar, text))
{
  gtk_status_icon_set_tooltip_text (status_icon,
                                    GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

guint
mlton_gtk_statusbar_get_context_id (GtkStatusbar* statusbar,
                                    SML_CVECTOR_VAL(const gchar, context_description))
{
  return gtk_statusbar_get_context_id (statusbar,
                                       GET_SML_CVECTOR_VAL(const gchar, context_description));
}

guint
mlton_gtk_statusbar_push (GtkStatusbar* statusbar,
                          guint context_id,
                          SML_CVECTOR_VAL(const gchar, text))
{
  return gtk_statusbar_push (statusbar,
                             context_id,
                             GET_SML_CVECTOR_VAL(const gchar, text));
}

#if GTK_CHECK_VERSION(2, 16, 0)
void
mlton_gtk_style_get_style_property (GtkStyle* style,
                                    GType widget_type,
                                    SML_CVECTOR_VAL(const gchar, property_name),
                                    GValue* value)
{
  gtk_style_get_style_property (style,
                                widget_type,
                                GET_SML_CVECTOR_VAL(const gchar, property_name),
                                value);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_style_lookup_color (GtkStyle* style,
                              SML_CVECTOR_VAL(const gchar, color_name),
                              GdkColor* color)
{
  return gtk_style_lookup_color (style,
                                 GET_SML_CVECTOR_VAL(const gchar, color_name),
                                 color);
}
#endif

GtkIconSet*
mlton_gtk_style_lookup_icon_set (GtkStyle* style,
                                 SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_style_lookup_icon_set (style,
                                    GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

GdkPixbuf*
mlton_gtk_style_render_icon (GtkStyle* style,
                             const GtkIconSource* source,
                             GtkTextDirection direction,
                             GtkStateType state,
                             GtkIconSize size,
                             GtkWidget* widget,
                             SML_CVECTOR_VAL(const gchar, detail))
{
  return gtk_style_render_icon (style,
                                source,
                                direction,
                                state,
                                size,
                                widget,
                                GET_SML_CVECTOR_VAL(const gchar, detail));
}

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_context_add_class (GtkStyleContext* context,
                                   SML_CVECTOR_VAL(const gchar, class_name))
{
  gtk_style_context_add_class (context,
                               GET_SML_CVECTOR_VAL(const gchar, class_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_context_add_region (GtkStyleContext* context,
                                    SML_CVECTOR_VAL(const gchar, region_name),
                                    GtkRegionFlags flags)
{
  gtk_style_context_add_region (context,
                                GET_SML_CVECTOR_VAL(const gchar, region_name),
                                flags);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_context_get_property (GtkStyleContext* context,
                                      SML_CVECTOR_VAL(const gchar, property),
                                      GtkStateFlags state,
                                      GValue* value)
{
  gtk_style_context_get_property (context,
                                  GET_SML_CVECTOR_VAL(const gchar, property),
                                  state,
                                  value);
}
#endif

GtkCssSection*
mlton_gtk_style_context_get_section (GtkStyleContext* context,
                                     SML_CVECTOR_VAL(const gchar, property))
{
  return gtk_style_context_get_section (context,
                                        GET_SML_CVECTOR_VAL(const gchar, property));
}

void
mlton_gtk_style_context_get_style_property (GtkStyleContext* context,
                                            SML_CVECTOR_VAL(const gchar, property_name),
                                            GValue* value)
{
  gtk_style_context_get_style_property (context,
                                        GET_SML_CVECTOR_VAL(const gchar, property_name),
                                        value);
}

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_style_context_has_class (GtkStyleContext* context,
                                   SML_CVECTOR_VAL(const gchar, class_name))
{
  return gtk_style_context_has_class (context,
                                      GET_SML_CVECTOR_VAL(const gchar, class_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_style_context_has_region (GtkStyleContext* context,
                                    SML_CVECTOR_VAL(const gchar, region_name),
                                    GtkRegionFlags* flags_return)
{
  return gtk_style_context_has_region (context,
                                       GET_SML_CVECTOR_VAL(const gchar, region_name),
                                       flags_return);
}
#endif

gboolean
mlton_gtk_style_context_lookup_color (GtkStyleContext* context,
                                      SML_CVECTOR_VAL(const gchar, color_name),
                                      GdkRGBA* color)
{
  return gtk_style_context_lookup_color (context,
                                         GET_SML_CVECTOR_VAL(const gchar, color_name),
                                         color);
}

GtkIconSet*
mlton_gtk_style_context_lookup_icon_set (GtkStyleContext* context,
                                         SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_style_context_lookup_icon_set (context,
                                            GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_context_remove_class (GtkStyleContext* context,
                                      SML_CVECTOR_VAL(const gchar, class_name))
{
  gtk_style_context_remove_class (context,
                                  GET_SML_CVECTOR_VAL(const gchar, class_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_context_remove_region (GtkStyleContext* context,
                                       SML_CVECTOR_VAL(const gchar, region_name))
{
  gtk_style_context_remove_region (context,
                                   GET_SML_CVECTOR_VAL(const gchar, region_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_style_properties_get_property (GtkStyleProperties* props,
                                         SML_CVECTOR_VAL(const gchar, property),
                                         GtkStateFlags state,
                                         GValue* value)
{
  return gtk_style_properties_get_property (props,
                                            GET_SML_CVECTOR_VAL(const gchar, property),
                                            state,
                                            value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
GtkSymbolicColor*
mlton_gtk_style_properties_lookup_color (GtkStyleProperties* props,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_style_properties_lookup_color (props,
                                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_properties_map_color (GtkStyleProperties* props,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      GtkSymbolicColor* color)
{
  gtk_style_properties_map_color (props,
                                  GET_SML_CVECTOR_VAL(const gchar, name),
                                  color);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_properties_set_property (GtkStyleProperties* props,
                                         SML_CVECTOR_VAL(const gchar, property),
                                         GtkStateFlags state,
                                         const GValue* value)
{
  gtk_style_properties_set_property (props,
                                     GET_SML_CVECTOR_VAL(const gchar, property),
                                     state,
                                     value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_style_properties_unset_property (GtkStyleProperties* props,
                                           SML_CVECTOR_VAL(const gchar, property),
                                           GtkStateFlags state)
{
  gtk_style_properties_unset_property (props,
                                       GET_SML_CVECTOR_VAL(const gchar, property),
                                       state);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
GtkSymbolicColor*
mlton_gtk_symbolic_color_new_name (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_symbolic_color_new_name (GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
GtkSymbolicColor*
mlton_gtk_symbolic_color_new_win32 (SML_CVECTOR_VAL(const gchar, theme_class),
                                    gint id)
{
  return gtk_symbolic_color_new_win32 (GET_SML_CVECTOR_VAL(const gchar, theme_class),
                                       id);
}
#endif

GtkTargetEntry*
mlton_gtk_target_entry_new (SML_CVECTOR_VAL(const gchar, target),
                            guint flags,
                            guint info)
{
  return gtk_target_entry_new (GET_SML_CVECTOR_VAL(const gchar, target),
                               flags,
                               info);
}

GtkTargetList*
mlton_gtk_target_list_new (SML_CVECTOR_VAL(GtkTargetEntry, targets),
                           guint ntargets)
{
  return gtk_target_list_new (GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                              ntargets);
}

void
mlton_gtk_target_list_add_table (GtkTargetList* list,
                                 SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                 guint ntargets)
{
  gtk_target_list_add_table (list,
                             GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                             ntargets);
}

void
mlton_gtk_text_buffer_apply_tag_by_name (GtkTextBuffer* buffer,
                                         SML_CVECTOR_VAL(const gchar, name),
                                         const GtkTextIter* start,
                                         const GtkTextIter* end)
{
  gtk_text_buffer_apply_tag_by_name (buffer,
                                     GET_SML_CVECTOR_VAL(const gchar, name),
                                     start,
                                     end);
}

GtkTextMark*
mlton_gtk_text_buffer_create_mark (GtkTextBuffer* buffer,
                                   SML_CVECTOR_VAL(const gchar, mark_name),
                                   const GtkTextIter* where,
                                   gboolean left_gravity)
{
  return gtk_text_buffer_create_mark (buffer,
                                      GET_SML_CVECTOR_VAL(const gchar, mark_name),
                                      where,
                                      left_gravity);
}

void
mlton_gtk_text_buffer_delete_mark_by_name (GtkTextBuffer* buffer,
                                           SML_CVECTOR_VAL(const gchar, name))
{
  gtk_text_buffer_delete_mark_by_name (buffer,
                                       GET_SML_CVECTOR_VAL(const gchar, name));
}

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_text_buffer_deserialize (GtkTextBuffer* register_buffer,
                                   GtkTextBuffer* content_buffer,
                                   GdkAtom format,
                                   GtkTextIter* iter,
                                   SML_CVECTOR_VAL(guint8, data),
                                   gsize length,
                                   GError** error)
{
  return gtk_text_buffer_deserialize (register_buffer,
                                      content_buffer,
                                      format,
                                      iter,
                                      GET_SML_CVECTOR_VAL(guint8, data),
                                      length,
                                      error);
}
#endif

GtkTextMark*
mlton_gtk_text_buffer_get_mark (GtkTextBuffer* buffer,
                                SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_text_buffer_get_mark (buffer,
                                   GET_SML_CVECTOR_VAL(const gchar, name));
}

void
mlton_gtk_text_buffer_insert (GtkTextBuffer* buffer,
                              GtkTextIter* iter,
                              SML_CVECTOR_VAL(const gchar, text),
                              gint len)
{
  gtk_text_buffer_insert (buffer,
                          iter,
                          GET_SML_CVECTOR_VAL(const gchar, text),
                          len);
}

void
mlton_gtk_text_buffer_insert_at_cursor (GtkTextBuffer* buffer,
                                        SML_CVECTOR_VAL(const gchar, text),
                                        gint len)
{
  gtk_text_buffer_insert_at_cursor (buffer,
                                    GET_SML_CVECTOR_VAL(const gchar, text),
                                    len);
}

gboolean
mlton_gtk_text_buffer_insert_interactive (GtkTextBuffer* buffer,
                                          GtkTextIter* iter,
                                          SML_CVECTOR_VAL(const gchar, text),
                                          gint len,
                                          gboolean default_editable)
{
  return gtk_text_buffer_insert_interactive (buffer,
                                             iter,
                                             GET_SML_CVECTOR_VAL(const gchar, text),
                                             len,
                                             default_editable);
}

gboolean
mlton_gtk_text_buffer_insert_interactive_at_cursor (GtkTextBuffer* buffer,
                                                    SML_CVECTOR_VAL(const gchar, text),
                                                    gint len,
                                                    gboolean default_editable)
{
  return gtk_text_buffer_insert_interactive_at_cursor (buffer,
                                                       GET_SML_CVECTOR_VAL(const gchar, text),
                                                       len,
                                                       default_editable);
}

#if GTK_CHECK_VERSION(3, 16, 0)
void
mlton_gtk_text_buffer_insert_markup (GtkTextBuffer* buffer,
                                     GtkTextIter* iter,
                                     SML_CVECTOR_VAL(const gchar, markup),
                                     gint len)
{
  gtk_text_buffer_insert_markup (buffer,
                                 iter,
                                 GET_SML_CVECTOR_VAL(const gchar, markup),
                                 len);
}
#endif

void
mlton_gtk_text_buffer_move_mark_by_name (GtkTextBuffer* buffer,
                                         SML_CVECTOR_VAL(const gchar, name),
                                         const GtkTextIter* where)
{
  gtk_text_buffer_move_mark_by_name (buffer,
                                     GET_SML_CVECTOR_VAL(const gchar, name),
                                     where);
}

#if GTK_CHECK_VERSION(2, 10, 0)
GdkAtom
mlton_gtk_text_buffer_register_deserialize_format (GtkTextBuffer* buffer,
                                                   SML_CVECTOR_VAL(const gchar, mime_type),
                                                   GtkTextBufferDeserializeFunc function,
                                                   gpointer user_data,
                                                   GDestroyNotify user_data_destroy)
{
  return gtk_text_buffer_register_deserialize_format (buffer,
                                                      GET_SML_CVECTOR_VAL(const gchar, mime_type),
                                                      function,
                                                      user_data,
                                                      user_data_destroy);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GdkAtom
mlton_gtk_text_buffer_register_deserialize_tagset (GtkTextBuffer* buffer,
                                                   SML_CVECTOR_VAL(const gchar, tagset_name))
{
  return gtk_text_buffer_register_deserialize_tagset (buffer,
                                                      GET_SML_CVECTOR_VAL(const gchar, tagset_name));
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GdkAtom
mlton_gtk_text_buffer_register_serialize_format (GtkTextBuffer* buffer,
                                                 SML_CVECTOR_VAL(const gchar, mime_type),
                                                 GtkTextBufferSerializeFunc function,
                                                 gpointer user_data,
                                                 GDestroyNotify user_data_destroy)
{
  return gtk_text_buffer_register_serialize_format (buffer,
                                                    GET_SML_CVECTOR_VAL(const gchar, mime_type),
                                                    function,
                                                    user_data,
                                                    user_data_destroy);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
GdkAtom
mlton_gtk_text_buffer_register_serialize_tagset (GtkTextBuffer* buffer,
                                                 SML_CVECTOR_VAL(const gchar, tagset_name))
{
  return gtk_text_buffer_register_serialize_tagset (buffer,
                                                    GET_SML_CVECTOR_VAL(const gchar, tagset_name));
}
#endif

void
mlton_gtk_text_buffer_remove_tag_by_name (GtkTextBuffer* buffer,
                                          SML_CVECTOR_VAL(const gchar, name),
                                          const GtkTextIter* start,
                                          const GtkTextIter* end)
{
  gtk_text_buffer_remove_tag_by_name (buffer,
                                      GET_SML_CVECTOR_VAL(const gchar, name),
                                      start,
                                      end);
}

void
mlton_gtk_text_buffer_set_text (GtkTextBuffer* buffer,
                                SML_CVECTOR_VAL(const gchar, text),
                                gint len)
{
  gtk_text_buffer_set_text (buffer,
                            GET_SML_CVECTOR_VAL(const gchar, text),
                            len);
}

gboolean
mlton_gtk_text_iter_backward_search (const GtkTextIter* iter,
                                     SML_CVECTOR_VAL(const gchar, str),
                                     GtkTextSearchFlags flags,
                                     GtkTextIter* match_start,
                                     GtkTextIter* match_end,
                                     const GtkTextIter* limit)
{
  return gtk_text_iter_backward_search (iter,
                                        GET_SML_CVECTOR_VAL(const gchar, str),
                                        flags,
                                        match_start,
                                        match_end,
                                        limit);
}

gboolean
mlton_gtk_text_iter_forward_search (const GtkTextIter* iter,
                                    SML_CVECTOR_VAL(const gchar, str),
                                    GtkTextSearchFlags flags,
                                    GtkTextIter* match_start,
                                    GtkTextIter* match_end,
                                    const GtkTextIter* limit)
{
  return gtk_text_iter_forward_search (iter,
                                       GET_SML_CVECTOR_VAL(const gchar, str),
                                       flags,
                                       match_start,
                                       match_end,
                                       limit);
}

#if GTK_CHECK_VERSION(2, 12, 0)
GtkTextMark*
mlton_gtk_text_mark_new (SML_CVECTOR_VAL(const gchar, name),
                         gboolean left_gravity)
{
  return gtk_text_mark_new (GET_SML_CVECTOR_VAL(const gchar, name),
                            left_gravity);
}
#endif

GtkTextTag*
mlton_gtk_text_tag_new (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_text_tag_new (GET_SML_CVECTOR_VAL(const gchar, name));
}

GtkTextTag*
mlton_gtk_text_tag_table_lookup (GtkTextTagTable* table,
                                 SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_text_tag_table_lookup (table,
                                    GET_SML_CVECTOR_VAL(const gchar, name));
}

GtkThemingEngine*
mlton_gtk_theming_engine_load (SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_theming_engine_load (GET_SML_CVECTOR_VAL(const gchar, name));
}

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_theming_engine_get_property (GtkThemingEngine* engine,
                                       SML_CVECTOR_VAL(const gchar, property),
                                       GtkStateFlags state,
                                       GValue* value)
{
  gtk_theming_engine_get_property (engine,
                                   GET_SML_CVECTOR_VAL(const gchar, property),
                                   state,
                                   value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_theming_engine_get_style_property (GtkThemingEngine* engine,
                                             SML_CVECTOR_VAL(const gchar, property_name),
                                             GValue* value)
{
  gtk_theming_engine_get_style_property (engine,
                                         GET_SML_CVECTOR_VAL(const gchar, property_name),
                                         value);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_theming_engine_has_class (GtkThemingEngine* engine,
                                    SML_CVECTOR_VAL(const gchar, style_class))
{
  return gtk_theming_engine_has_class (engine,
                                       GET_SML_CVECTOR_VAL(const gchar, style_class));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_theming_engine_has_region (GtkThemingEngine* engine,
                                     SML_CVECTOR_VAL(const gchar, style_region),
                                     GtkRegionFlags* flags)
{
  return gtk_theming_engine_has_region (engine,
                                        GET_SML_CVECTOR_VAL(const gchar, style_region),
                                        flags);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_theming_engine_lookup_color (GtkThemingEngine* engine,
                                       SML_CVECTOR_VAL(const gchar, color_name),
                                       GdkRGBA* color)
{
  return gtk_theming_engine_lookup_color (engine,
                                          GET_SML_CVECTOR_VAL(const gchar, color_name),
                                          color);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToggleAction*
mlton_gtk_toggle_action_new (SML_CVECTOR_VAL(const gchar, name),
                             SML_CVECTOR_VAL(const gchar, label),
                             SML_CVECTOR_VAL(const gchar, tooltip),
                             SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_toggle_action_new (GET_SML_CVECTOR_VAL(const gchar, name),
                                GET_SML_CVECTOR_VAL(const gchar, label),
                                GET_SML_CVECTOR_VAL(const gchar, tooltip),
                                GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

GtkWidget*
mlton_gtk_toggle_button_new_with_label (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_toggle_button_new_with_label (GET_SML_CVECTOR_VAL(const gchar, label));
}

GtkWidget*
mlton_gtk_toggle_button_new_with_mnemonic (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_toggle_button_new_with_mnemonic (GET_SML_CVECTOR_VAL(const gchar, label));
}

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToolItem*
mlton_gtk_toggle_tool_button_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_toggle_tool_button_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToolItem*
mlton_gtk_tool_button_new (GtkWidget* icon_widget,
                           SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_tool_button_new (icon_widget,
                              GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkToolItem*
mlton_gtk_tool_button_new_from_stock (SML_CVECTOR_VAL(const gchar, stock_id))
{
  return gtk_tool_button_new_from_stock (GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_tool_button_set_icon_name (GtkToolButton* button,
                                     SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_tool_button_set_icon_name (button,
                                 GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_tool_button_set_label (GtkToolButton* button,
                                 SML_CVECTOR_VAL(const gchar, label))
{
  gtk_tool_button_set_label (button,
                             GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_tool_button_set_stock_id (GtkToolButton* button,
                                    SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_tool_button_set_stock_id (button,
                                GET_SML_CVECTOR_VAL(const gchar, stock_id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_tool_item_get_proxy_menu_item (GtkToolItem* tool_item,
                                         SML_CVECTOR_VAL(const gchar, menu_item_id))
{
  return gtk_tool_item_get_proxy_menu_item (tool_item,
                                            GET_SML_CVECTOR_VAL(const gchar, menu_item_id));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_tool_item_set_proxy_menu_item (GtkToolItem* tool_item,
                                         SML_CVECTOR_VAL(const gchar, menu_item_id),
                                         GtkWidget* menu_item)
{
  gtk_tool_item_set_proxy_menu_item (tool_item,
                                     GET_SML_CVECTOR_VAL(const gchar, menu_item_id),
                                     menu_item);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tool_item_set_tooltip_markup (GtkToolItem* tool_item,
                                        SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_tool_item_set_tooltip_markup (tool_item,
                                    GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tool_item_set_tooltip_text (GtkToolItem* tool_item,
                                      SML_CVECTOR_VAL(const gchar, text))
{
  gtk_tool_item_set_tooltip_text (tool_item,
                                  GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

#if GTK_CHECK_VERSION(2, 20, 0)
GtkWidget*
mlton_gtk_tool_item_group_new (SML_CVECTOR_VAL(const gchar, label))
{
  return gtk_tool_item_group_new (GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 20, 0)
void
mlton_gtk_tool_item_group_set_label (GtkToolItemGroup* group,
                                     SML_CVECTOR_VAL(const gchar, label))
{
  gtk_tool_item_group_set_label (group,
                                 GET_SML_CVECTOR_VAL(const gchar, label));
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
void
mlton_gtk_tooltip_set_icon_from_icon_name (GtkTooltip* tooltip,
                                           SML_CVECTOR_VAL(const gchar, icon_name),
                                           GtkIconSize size)
{
  gtk_tooltip_set_icon_from_icon_name (tooltip,
                                       GET_SML_CVECTOR_VAL(const gchar, icon_name),
                                       size);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tooltip_set_icon_from_stock (GtkTooltip* tooltip,
                                       SML_CVECTOR_VAL(const gchar, stock_id),
                                       GtkIconSize size)
{
  gtk_tooltip_set_icon_from_stock (tooltip,
                                   GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                   size);
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tooltip_set_markup (GtkTooltip* tooltip,
                              SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_tooltip_set_markup (tooltip,
                          GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tooltip_set_text (GtkTooltip* tooltip,
                            SML_CVECTOR_VAL(const gchar, text))
{
  gtk_tooltip_set_text (tooltip,
                        GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

gboolean
mlton_gtk_tree_model_get_iter_from_string (GtkTreeModel* tree_model,
                                           GtkTreeIter* iter,
                                           SML_CVECTOR_VAL(const gchar, path_string))
{
  return gtk_tree_model_get_iter_from_string (tree_model,
                                              iter,
                                              GET_SML_CVECTOR_VAL(const gchar, path_string));
}

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_tree_model_rows_reordered_with_length (GtkTreeModel* tree_model,
                                                 GtkTreePath* path,
                                                 GtkTreeIter* iter,
                                                 SML_CVECTOR_VAL(gint, new_order),
                                                 gint length)
{
  gtk_tree_model_rows_reordered_with_length (tree_model,
                                             path,
                                             iter,
                                             GET_SML_CVECTOR_VAL(gint, new_order),
                                             length);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_tree_model_filter_set_modify_func (GtkTreeModelFilter* filter,
                                             gint n_columns,
                                             SML_CVECTOR_VAL(GType, types),
                                             GtkTreeModelFilterModifyFunc func,
                                             gpointer data,
                                             GDestroyNotify destroy)
{
  gtk_tree_model_filter_set_modify_func (filter,
                                         n_columns,
                                         GET_SML_CVECTOR_VAL(GType, types),
                                         func,
                                         data,
                                         destroy);
}
#endif

#if GTK_CHECK_VERSION(3, 12, 0)
GtkTreePath*
mlton_gtk_tree_path_new_from_indicesv (SML_CVECTOR_VAL(gint, indices),
                                       gsize length)
{
  return gtk_tree_path_new_from_indicesv (GET_SML_CVECTOR_VAL(gint, indices),
                                          length);
}
#endif

GtkTreePath*
mlton_gtk_tree_path_new_from_string (SML_CVECTOR_VAL(const gchar, path))
{
  return gtk_tree_path_new_from_string (GET_SML_CVECTOR_VAL(const gchar, path));
}

GtkTreeStore*
mlton_gtk_tree_store_newv (gint n_columns,
                           SML_CVECTOR_VAL(GType, types))
{
  return gtk_tree_store_newv (n_columns,
                              GET_SML_CVECTOR_VAL(GType, types));
}

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_tree_store_insert_with_valuesv (GtkTreeStore* tree_store,
                                          GtkTreeIter* iter,
                                          GtkTreeIter* parent,
                                          gint position,
                                          SML_CVECTOR_VAL(gint, columns),
                                          SML_CVECTOR_VAL(GValue, values),
                                          gint n_values)
{
  gtk_tree_store_insert_with_valuesv (tree_store,
                                      iter,
                                      parent,
                                      position,
                                      GET_SML_CVECTOR_VAL(gint, columns),
                                      GET_SML_CVECTOR_VAL(GValue, values),
                                      n_values);
}
#endif

void
mlton_gtk_tree_store_set_column_types (GtkTreeStore* tree_store,
                                       gint n_columns,
                                       SML_CVECTOR_VAL(GType, types))
{
  gtk_tree_store_set_column_types (tree_store,
                                   n_columns,
                                   GET_SML_CVECTOR_VAL(GType, types));
}

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_tree_store_set_valuesv (GtkTreeStore* tree_store,
                                  GtkTreeIter* iter,
                                  SML_CVECTOR_VAL(gint, columns),
                                  SML_CVECTOR_VAL(GValue, values),
                                  gint n_values)
{
  gtk_tree_store_set_valuesv (tree_store,
                              iter,
                              GET_SML_CVECTOR_VAL(gint, columns),
                              GET_SML_CVECTOR_VAL(GValue, values),
                              n_values);
}
#endif

void
mlton_gtk_tree_view_enable_model_drag_dest (GtkTreeView* tree_view,
                                            SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                            gint n_targets,
                                            GdkDragAction actions)
{
  gtk_tree_view_enable_model_drag_dest (tree_view,
                                        GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                        n_targets,
                                        actions);
}

void
mlton_gtk_tree_view_enable_model_drag_source (GtkTreeView* tree_view,
                                              GdkModifierType start_button_mask,
                                              SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                              gint n_targets,
                                              GdkDragAction actions)
{
  gtk_tree_view_enable_model_drag_source (tree_view,
                                          start_button_mask,
                                          GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                          n_targets,
                                          actions);
}

gint
mlton_gtk_tree_view_insert_column_with_data_func (GtkTreeView* tree_view,
                                                  gint position,
                                                  SML_CVECTOR_VAL(const gchar, title),
                                                  GtkCellRenderer* cell,
                                                  GtkTreeCellDataFunc func,
                                                  gpointer data,
                                                  GDestroyNotify dnotify)
{
  return gtk_tree_view_insert_column_with_data_func (tree_view,
                                                     position,
                                                     GET_SML_CVECTOR_VAL(const gchar, title),
                                                     cell,
                                                     func,
                                                     data,
                                                     dnotify);
}

void
mlton_gtk_tree_view_column_add_attribute (GtkTreeViewColumn* tree_column,
                                          GtkCellRenderer* cell_renderer,
                                          SML_CVECTOR_VAL(const gchar, attribute),
                                          gint column)
{
  gtk_tree_view_column_add_attribute (tree_column,
                                      cell_renderer,
                                      GET_SML_CVECTOR_VAL(const gchar, attribute),
                                      column);
}

void
mlton_gtk_tree_view_column_set_title (GtkTreeViewColumn* tree_column,
                                      SML_CVECTOR_VAL(const gchar, title))
{
  gtk_tree_view_column_set_title (tree_column,
                                  GET_SML_CVECTOR_VAL(const gchar, title));
}

#if GTK_CHECK_VERSION(2, 4, 0)
void
mlton_gtk_ui_manager_add_ui (GtkUIManager* manager,
                             guint merge_id,
                             SML_CVECTOR_VAL(const gchar, path),
                             SML_CVECTOR_VAL(const gchar, name),
                             SML_CVECTOR_VAL(const gchar, action),
                             GtkUIManagerItemType type,
                             gboolean top)
{
  gtk_ui_manager_add_ui (manager,
                         merge_id,
                         GET_SML_CVECTOR_VAL(const gchar, path),
                         GET_SML_CVECTOR_VAL(const gchar, name),
                         GET_SML_CVECTOR_VAL(const gchar, action),
                         type,
                         top);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
guint
mlton_gtk_ui_manager_add_ui_from_file (GtkUIManager* manager,
                                       SML_CVECTOR_VAL(gchar, filename),
                                       GError** error)
{
  return gtk_ui_manager_add_ui_from_file (manager,
                                          GET_SML_CVECTOR_VAL(gchar, filename),
                                          error);
}
#endif

#if GTK_CHECK_VERSION(3, 4, 0)
guint
mlton_gtk_ui_manager_add_ui_from_resource (GtkUIManager* manager,
                                           SML_CVECTOR_VAL(const gchar, resource_path),
                                           GError** error)
{
  return gtk_ui_manager_add_ui_from_resource (manager,
                                              GET_SML_CVECTOR_VAL(const gchar, resource_path),
                                              error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
guint
mlton_gtk_ui_manager_add_ui_from_string (GtkUIManager* manager,
                                         SML_CVECTOR_VAL(const gchar, buffer),
                                         gssize length,
                                         GError** error)
{
  return gtk_ui_manager_add_ui_from_string (manager,
                                            GET_SML_CVECTOR_VAL(const gchar, buffer),
                                            length,
                                            error);
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkAction*
mlton_gtk_ui_manager_get_action (GtkUIManager* manager,
                                 SML_CVECTOR_VAL(const gchar, path))
{
  return gtk_ui_manager_get_action (manager,
                                    GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

#if GTK_CHECK_VERSION(2, 4, 0)
GtkWidget*
mlton_gtk_ui_manager_get_widget (GtkUIManager* manager,
                                 SML_CVECTOR_VAL(const gchar, path))
{
  return gtk_ui_manager_get_widget (manager,
                                    GET_SML_CVECTOR_VAL(const gchar, path));
}
#endif

void
mlton_gtk_widget_add_accelerator (GtkWidget* widget,
                                  SML_CVECTOR_VAL(const gchar, accel_signal),
                                  GtkAccelGroup* accel_group,
                                  guint accel_key,
                                  GdkModifierType accel_mods,
                                  GtkAccelFlags accel_flags)
{
  gtk_widget_add_accelerator (widget,
                              GET_SML_CVECTOR_VAL(const gchar, accel_signal),
                              accel_group,
                              accel_key,
                              accel_mods,
                              accel_flags);
}

void
mlton_gtk_widget_child_notify (GtkWidget* widget,
                               SML_CVECTOR_VAL(const gchar, child_property))
{
  gtk_widget_child_notify (widget,
                           GET_SML_CVECTOR_VAL(const gchar, child_property));
}

void
mlton_gtk_widget_class_path (GtkWidget* widget,
                             guint* path_length,
                             SML_CVECTOR_REF(gchar, path),
                             SML_CVECTOR_REF(gchar, path_reversed))
{
  gtk_widget_class_path (widget,
                         path_length,
                         GET_SML_CVECTOR_REF(gchar, path),
                         GET_SML_CVECTOR_REF(gchar, path_reversed));
}

PangoLayout*
mlton_gtk_widget_create_pango_layout (GtkWidget* widget,
                                      SML_CVECTOR_VAL(const gchar, text))
{
  return gtk_widget_create_pango_layout (widget,
                                         GET_SML_CVECTOR_VAL(const gchar, text));
}

void
mlton_gtk_drag_dest_set (GtkWidget* widget,
                         GtkDestDefaults flags,
                         SML_CVECTOR_VAL(GtkTargetEntry, targets),
                         gint n_targets,
                         GdkDragAction actions)
{
  gtk_drag_dest_set (widget,
                     flags,
                     GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                     n_targets,
                     actions);
}

void
mlton_gtk_drag_source_set (GtkWidget* widget,
                           GdkModifierType start_button_mask,
                           SML_CVECTOR_VAL(GtkTargetEntry, targets),
                           gint n_targets,
                           GdkDragAction actions)
{
  gtk_drag_source_set (widget,
                       start_button_mask,
                       GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                       n_targets,
                       actions);
}

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_drag_source_set_icon_name (GtkWidget* widget,
                                     SML_CVECTOR_VAL(const gchar, icon_name))
{
  gtk_drag_source_set_icon_name (widget,
                                 GET_SML_CVECTOR_VAL(const gchar, icon_name));
}
#endif

void
mlton_gtk_drag_source_set_icon_stock (GtkWidget* widget,
                                      SML_CVECTOR_VAL(const gchar, stock_id))
{
  gtk_drag_source_set_icon_stock (widget,
                                  GET_SML_CVECTOR_VAL(const gchar, stock_id));
}

#if GTK_CHECK_VERSION(3, 16, 0)
GActionGroup*
mlton_gtk_widget_get_action_group (GtkWidget* widget,
                                   SML_CVECTOR_VAL(const gchar, prefix))
{
  return gtk_widget_get_action_group (widget,
                                      GET_SML_CVECTOR_VAL(const gchar, prefix));
}
#endif

GObject*
mlton_gtk_widget_get_template_child (GtkWidget* widget,
                                     GType widget_type,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_widget_get_template_child (widget,
                                        widget_type,
                                        GET_SML_CVECTOR_VAL(const gchar, name));
}

#if GTK_CHECK_VERSION(3, 6, 0)
void
mlton_gtk_widget_insert_action_group (GtkWidget* widget,
                                      SML_CVECTOR_VAL(const gchar, name),
                                      GActionGroup* group)
{
  gtk_widget_insert_action_group (widget,
                                  GET_SML_CVECTOR_VAL(const gchar, name),
                                  group);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_override_symbolic_color (GtkWidget* widget,
                                          SML_CVECTOR_VAL(const gchar, name),
                                          const GdkRGBA* color)
{
  gtk_widget_override_symbolic_color (widget,
                                      GET_SML_CVECTOR_VAL(const gchar, name),
                                      color);
}
#endif

void
mlton_gtk_widget_path (GtkWidget* widget,
                       guint* path_length,
                       SML_CVECTOR_REF(gchar, path),
                       SML_CVECTOR_REF(gchar, path_reversed))
{
  gtk_widget_path (widget,
                   path_length,
                   GET_SML_CVECTOR_REF(gchar, path),
                   GET_SML_CVECTOR_REF(gchar, path_reversed));
}

GdkPixbuf*
mlton_gtk_widget_render_icon (GtkWidget* widget,
                              SML_CVECTOR_VAL(const gchar, stock_id),
                              GtkIconSize size,
                              SML_CVECTOR_VAL(const gchar, detail))
{
  return gtk_widget_render_icon (widget,
                                 GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                 size,
                                 GET_SML_CVECTOR_VAL(const gchar, detail));
}

#if GTK_CHECK_VERSION(3, 0, 0)
GdkPixbuf*
mlton_gtk_widget_render_icon_pixbuf (GtkWidget* widget,
                                     SML_CVECTOR_VAL(const gchar, stock_id),
                                     GtkIconSize size)
{
  return gtk_widget_render_icon_pixbuf (widget,
                                        GET_SML_CVECTOR_VAL(const gchar, stock_id),
                                        size);
}
#endif

void
mlton_gtk_widget_set_accel_path (GtkWidget* widget,
                                 SML_CVECTOR_VAL(const gchar, accel_path),
                                 GtkAccelGroup* accel_group)
{
  gtk_widget_set_accel_path (widget,
                             GET_SML_CVECTOR_VAL(const gchar, accel_path),
                             accel_group);
}

void
mlton_gtk_widget_set_composite_name (GtkWidget* widget,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_set_composite_name (widget,
                                 GET_SML_CVECTOR_VAL(const gchar, name));
}

void
mlton_gtk_widget_set_name (GtkWidget* widget,
                           SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_set_name (widget,
                       GET_SML_CVECTOR_VAL(const gchar, name));
}

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_widget_set_tooltip_markup (GtkWidget* widget,
                                     SML_CVECTOR_VAL(const gchar, markup))
{
  gtk_widget_set_tooltip_markup (widget,
                                 GET_SML_CVECTOR_VAL(const gchar, markup));
}
#endif

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_widget_set_tooltip_text (GtkWidget* widget,
                                   SML_CVECTOR_VAL(const gchar, text))
{
  gtk_widget_set_tooltip_text (widget,
                               GET_SML_CVECTOR_VAL(const gchar, text));
}
#endif

void
mlton_gtk_widget_style_get_property (GtkWidget* widget,
                                     SML_CVECTOR_VAL(const gchar, property_name),
                                     GValue* value)
{
  gtk_widget_style_get_property (widget,
                                 GET_SML_CVECTOR_VAL(const gchar, property_name),
                                 value);
}

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_widget_class_bind_template_callback_full (GtkWidgetClass* widget_class,
                                                    SML_CVECTOR_VAL(const gchar, callback_name),
                                                    GCallback callback_symbol)
{
  gtk_widget_class_bind_template_callback_full (widget_class,
                                                GET_SML_CVECTOR_VAL(const gchar, callback_name),
                                                callback_symbol);
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_widget_class_bind_template_child_full (GtkWidgetClass* widget_class,
                                                 SML_CVECTOR_VAL(const gchar, name),
                                                 gboolean internal_child,
                                                 gssize struct_offset)
{
  gtk_widget_class_bind_template_child_full (widget_class,
                                             GET_SML_CVECTOR_VAL(const gchar, name),
                                             internal_child,
                                             struct_offset);
}
#endif

#if GTK_CHECK_VERSION(2, 2, 0)
GParamSpec*
mlton_gtk_widget_class_find_style_property (GtkWidgetClass* klass,
                                            SML_CVECTOR_VAL(const gchar, property_name))
{
  return gtk_widget_class_find_style_property (klass,
                                               GET_SML_CVECTOR_VAL(const gchar, property_name));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_widget_class_set_css_name (GtkWidgetClass* widget_class,
                                     SML_CVECTOR_VAL(const char, name))
{
  gtk_widget_class_set_css_name (widget_class,
                                 GET_SML_CVECTOR_VAL(const char, name));
}
#endif

#if GTK_CHECK_VERSION(3, 10, 0)
void
mlton_gtk_widget_class_set_template_from_resource (GtkWidgetClass* widget_class,
                                                   SML_CVECTOR_VAL(const gchar, resource_name))
{
  gtk_widget_class_set_template_from_resource (widget_class,
                                               GET_SML_CVECTOR_VAL(const gchar, resource_name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_path_iter_add_class (GtkWidgetPath* path,
                                      gint pos,
                                      SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_path_iter_add_class (path,
                                  pos,
                                  GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_path_iter_add_region (GtkWidgetPath* path,
                                       gint pos,
                                       SML_CVECTOR_VAL(const gchar, name),
                                       GtkRegionFlags flags)
{
  gtk_widget_path_iter_add_region (path,
                                   pos,
                                   GET_SML_CVECTOR_VAL(const gchar, name),
                                   flags);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_widget_path_iter_has_class (const GtkWidgetPath* path,
                                      gint pos,
                                      SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_widget_path_iter_has_class (path,
                                         pos,
                                         GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_widget_path_iter_has_name (const GtkWidgetPath* path,
                                     gint pos,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  return gtk_widget_path_iter_has_name (path,
                                        pos,
                                        GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
gboolean
mlton_gtk_widget_path_iter_has_region (const GtkWidgetPath* path,
                                       gint pos,
                                       SML_CVECTOR_VAL(const gchar, name),
                                       GtkRegionFlags* flags)
{
  return gtk_widget_path_iter_has_region (path,
                                          pos,
                                          GET_SML_CVECTOR_VAL(const gchar, name),
                                          flags);
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_path_iter_remove_class (GtkWidgetPath* path,
                                         gint pos,
                                         SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_path_iter_remove_class (path,
                                     pos,
                                     GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_path_iter_remove_region (GtkWidgetPath* path,
                                          gint pos,
                                          SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_path_iter_remove_region (path,
                                      pos,
                                      GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 0, 0)
void
mlton_gtk_widget_path_iter_set_name (GtkWidgetPath* path,
                                     gint pos,
                                     SML_CVECTOR_VAL(const gchar, name))
{
  gtk_widget_path_iter_set_name (path,
                                 pos,
                                 GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

#if GTK_CHECK_VERSION(3, 20, 0)
void
mlton_gtk_widget_path_iter_set_object_name (GtkWidgetPath* path,
                                            gint pos,
                                            SML_CVECTOR_VAL(const char, name))
{
  gtk_widget_path_iter_set_object_name (path,
                                        pos,
                                        GET_SML_CVECTOR_VAL(const char, name));
}
#endif

#if GTK_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gtk_window_set_default_icon_from_file (SML_CVECTOR_VAL(gchar, filename),
                                             GError** error)
{
  return gtk_window_set_default_icon_from_file (GET_SML_CVECTOR_VAL(gchar, filename),
                                                error);
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_window_set_default_icon_name (SML_CVECTOR_VAL(const gchar, name))
{
  gtk_window_set_default_icon_name (GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

gboolean
mlton_gtk_window_parse_geometry (GtkWindow* window,
                                 SML_CVECTOR_VAL(const gchar, geometry))
{
  return gtk_window_parse_geometry (window,
                                    GET_SML_CVECTOR_VAL(const gchar, geometry));
}

#if GTK_CHECK_VERSION(2, 2, 0)
gboolean
mlton_gtk_window_set_icon_from_file (GtkWindow* window,
                                     SML_CVECTOR_VAL(gchar, filename),
                                     GError** error)
{
  return gtk_window_set_icon_from_file (window,
                                        GET_SML_CVECTOR_VAL(gchar, filename),
                                        error);
}
#endif

#if GTK_CHECK_VERSION(2, 6, 0)
void
mlton_gtk_window_set_icon_name (GtkWindow* window,
                                SML_CVECTOR_VAL(const gchar, name))
{
  gtk_window_set_icon_name (window,
                            GET_SML_CVECTOR_VAL(const gchar, name));
}
#endif

void
mlton_gtk_window_set_role (GtkWindow* window,
                           SML_CVECTOR_VAL(const gchar, role))
{
  gtk_window_set_role (window,
                       GET_SML_CVECTOR_VAL(const gchar, role));
}

#if GTK_CHECK_VERSION(2, 12, 0)
void
mlton_gtk_window_set_startup_id (GtkWindow* window,
                                 SML_CVECTOR_VAL(const gchar, startup_id))
{
  gtk_window_set_startup_id (window,
                             GET_SML_CVECTOR_VAL(const gchar, startup_id));
}
#endif

void
mlton_gtk_window_set_title (GtkWindow* window,
                            SML_CVECTOR_VAL(const gchar, title))
{
  gtk_window_set_title (window,
                        GET_SML_CVECTOR_VAL(const gchar, title));
}

void
mlton_gtk_window_set_wmclass (GtkWindow* window,
                              SML_CVECTOR_VAL(const gchar, wmclass_name),
                              SML_CVECTOR_VAL(const gchar, wmclass_class))
{
  gtk_window_set_wmclass (window,
                          GET_SML_CVECTOR_VAL(const gchar, wmclass_name),
                          GET_SML_CVECTOR_VAL(const gchar, wmclass_class));
}

void
mlton_gtk_accelerator_parse (SML_CVECTOR_VAL(const gchar, accelerator),
                             guint* accelerator_key,
                             GdkModifierType* accelerator_mods)
{
  gtk_accelerator_parse (GET_SML_CVECTOR_VAL(const gchar, accelerator),
                         accelerator_key,
                         accelerator_mods);
}

#if GTK_CHECK_VERSION(3, 4, 0)
void
mlton_gtk_accelerator_parse_with_keycode (SML_CVECTOR_VAL(const gchar, accelerator),
                                          guint* accelerator_key,
                                          SML_CVECTOR_REF(guint, accelerator_codes),
                                          GdkModifierType* accelerator_mods)
{
  gtk_accelerator_parse_with_keycode (GET_SML_CVECTOR_VAL(const gchar, accelerator),
                                      accelerator_key,
                                      GET_SML_CVECTOR_REF(guint, accelerator_codes),
                                      accelerator_mods);
}
#endif

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_drag_set_icon_name (GdkDragContext* context,
                              SML_CVECTOR_VAL(const gchar, icon_name),
                              gint hot_x,
                              gint hot_y)
{
  gtk_drag_set_icon_name (context,
                          GET_SML_CVECTOR_VAL(const gchar, icon_name),
                          hot_x,
                          hot_y);
}
#endif

void
mlton_gtk_drag_set_icon_stock (GdkDragContext* context,
                               SML_CVECTOR_VAL(const gchar, stock_id),
                               gint hot_x,
                               gint hot_y)
{
  gtk_drag_set_icon_stock (context,
                           GET_SML_CVECTOR_VAL(const gchar, stock_id),
                           hot_x,
                           hot_y);
}

void
mlton_gtk_init (int* argc,
                SML_CVECTORVECTOR_REF(char, argv))
{
  gtk_init (argc,
            GET_SML_CVECTORVECTOR_REF(char, argv));
}

gboolean
mlton_gtk_init_check (int* argc,
                      SML_CVECTORVECTOR_REF(char, argv))
{
  return gtk_init_check (argc,
                         GET_SML_CVECTORVECTOR_REF(char, argv));
}

#if GTK_CHECK_VERSION(2, 6, 0)
gboolean
mlton_gtk_init_with_args (gint* argc,
                          SML_CVECTORVECTOR_REF(gchar, argv),
                          SML_CVECTOR_VAL(const gchar, parameter_string),
                          SML_CVECTOR_VAL(GOptionEntry, entries),
                          SML_CVECTOR_VAL(const gchar, translation_domain),
                          GError** error)
{
  return gtk_init_with_args (argc,
                             GET_SML_CVECTORVECTOR_REF(gchar, argv),
                             GET_SML_CVECTOR_VAL(const gchar, parameter_string),
                             GET_SML_CVECTOR_VAL(GOptionEntry, entries),
                             GET_SML_CVECTOR_VAL(const gchar, translation_domain),
                             error);
}
#endif

void
mlton_gtk_paint_arrow (GtkStyle* style,
                       cairo_t* cr,
                       GtkStateType state_type,
                       GtkShadowType shadow_type,
                       GtkWidget* widget,
                       SML_CVECTOR_VAL(const gchar, detail),
                       GtkArrowType arrow_type,
                       gboolean fill,
                       gint x,
                       gint y,
                       gint width,
                       gint height)
{
  gtk_paint_arrow (style,
                   cr,
                   state_type,
                   shadow_type,
                   widget,
                   GET_SML_CVECTOR_VAL(const gchar, detail),
                   arrow_type,
                   fill,
                   x,
                   y,
                   width,
                   height);
}

void
mlton_gtk_paint_box (GtkStyle* style,
                     cairo_t* cr,
                     GtkStateType state_type,
                     GtkShadowType shadow_type,
                     GtkWidget* widget,
                     SML_CVECTOR_VAL(const gchar, detail),
                     gint x,
                     gint y,
                     gint width,
                     gint height)
{
  gtk_paint_box (style,
                 cr,
                 state_type,
                 shadow_type,
                 widget,
                 GET_SML_CVECTOR_VAL(const gchar, detail),
                 x,
                 y,
                 width,
                 height);
}

void
mlton_gtk_paint_box_gap (GtkStyle* style,
                         cairo_t* cr,
                         GtkStateType state_type,
                         GtkShadowType shadow_type,
                         GtkWidget* widget,
                         SML_CVECTOR_VAL(const gchar, detail),
                         gint x,
                         gint y,
                         gint width,
                         gint height,
                         GtkPositionType gap_side,
                         gint gap_x,
                         gint gap_width)
{
  gtk_paint_box_gap (style,
                     cr,
                     state_type,
                     shadow_type,
                     widget,
                     GET_SML_CVECTOR_VAL(const gchar, detail),
                     x,
                     y,
                     width,
                     height,
                     gap_side,
                     gap_x,
                     gap_width);
}

void
mlton_gtk_paint_check (GtkStyle* style,
                       cairo_t* cr,
                       GtkStateType state_type,
                       GtkShadowType shadow_type,
                       GtkWidget* widget,
                       SML_CVECTOR_VAL(const gchar, detail),
                       gint x,
                       gint y,
                       gint width,
                       gint height)
{
  gtk_paint_check (style,
                   cr,
                   state_type,
                   shadow_type,
                   widget,
                   GET_SML_CVECTOR_VAL(const gchar, detail),
                   x,
                   y,
                   width,
                   height);
}

void
mlton_gtk_paint_diamond (GtkStyle* style,
                         cairo_t* cr,
                         GtkStateType state_type,
                         GtkShadowType shadow_type,
                         GtkWidget* widget,
                         SML_CVECTOR_VAL(const gchar, detail),
                         gint x,
                         gint y,
                         gint width,
                         gint height)
{
  gtk_paint_diamond (style,
                     cr,
                     state_type,
                     shadow_type,
                     widget,
                     GET_SML_CVECTOR_VAL(const gchar, detail),
                     x,
                     y,
                     width,
                     height);
}

void
mlton_gtk_paint_expander (GtkStyle* style,
                          cairo_t* cr,
                          GtkStateType state_type,
                          GtkWidget* widget,
                          SML_CVECTOR_VAL(const gchar, detail),
                          gint x,
                          gint y,
                          GtkExpanderStyle expander_style)
{
  gtk_paint_expander (style,
                      cr,
                      state_type,
                      widget,
                      GET_SML_CVECTOR_VAL(const gchar, detail),
                      x,
                      y,
                      expander_style);
}

void
mlton_gtk_paint_extension (GtkStyle* style,
                           cairo_t* cr,
                           GtkStateType state_type,
                           GtkShadowType shadow_type,
                           GtkWidget* widget,
                           SML_CVECTOR_VAL(const gchar, detail),
                           gint x,
                           gint y,
                           gint width,
                           gint height,
                           GtkPositionType gap_side)
{
  gtk_paint_extension (style,
                       cr,
                       state_type,
                       shadow_type,
                       widget,
                       GET_SML_CVECTOR_VAL(const gchar, detail),
                       x,
                       y,
                       width,
                       height,
                       gap_side);
}

void
mlton_gtk_paint_flat_box (GtkStyle* style,
                          cairo_t* cr,
                          GtkStateType state_type,
                          GtkShadowType shadow_type,
                          GtkWidget* widget,
                          SML_CVECTOR_VAL(const gchar, detail),
                          gint x,
                          gint y,
                          gint width,
                          gint height)
{
  gtk_paint_flat_box (style,
                      cr,
                      state_type,
                      shadow_type,
                      widget,
                      GET_SML_CVECTOR_VAL(const gchar, detail),
                      x,
                      y,
                      width,
                      height);
}

void
mlton_gtk_paint_focus (GtkStyle* style,
                       cairo_t* cr,
                       GtkStateType state_type,
                       GtkWidget* widget,
                       SML_CVECTOR_VAL(const gchar, detail),
                       gint x,
                       gint y,
                       gint width,
                       gint height)
{
  gtk_paint_focus (style,
                   cr,
                   state_type,
                   widget,
                   GET_SML_CVECTOR_VAL(const gchar, detail),
                   x,
                   y,
                   width,
                   height);
}

void
mlton_gtk_paint_handle (GtkStyle* style,
                        cairo_t* cr,
                        GtkStateType state_type,
                        GtkShadowType shadow_type,
                        GtkWidget* widget,
                        SML_CVECTOR_VAL(const gchar, detail),
                        gint x,
                        gint y,
                        gint width,
                        gint height,
                        GtkOrientation orientation)
{
  gtk_paint_handle (style,
                    cr,
                    state_type,
                    shadow_type,
                    widget,
                    GET_SML_CVECTOR_VAL(const gchar, detail),
                    x,
                    y,
                    width,
                    height,
                    orientation);
}

void
mlton_gtk_paint_hline (GtkStyle* style,
                       cairo_t* cr,
                       GtkStateType state_type,
                       GtkWidget* widget,
                       SML_CVECTOR_VAL(const gchar, detail),
                       gint x1,
                       gint x2,
                       gint y)
{
  gtk_paint_hline (style,
                   cr,
                   state_type,
                   widget,
                   GET_SML_CVECTOR_VAL(const gchar, detail),
                   x1,
                   x2,
                   y);
}

void
mlton_gtk_paint_layout (GtkStyle* style,
                        cairo_t* cr,
                        GtkStateType state_type,
                        gboolean use_text,
                        GtkWidget* widget,
                        SML_CVECTOR_VAL(const gchar, detail),
                        gint x,
                        gint y,
                        PangoLayout* layout)
{
  gtk_paint_layout (style,
                    cr,
                    state_type,
                    use_text,
                    widget,
                    GET_SML_CVECTOR_VAL(const gchar, detail),
                    x,
                    y,
                    layout);
}

void
mlton_gtk_paint_option (GtkStyle* style,
                        cairo_t* cr,
                        GtkStateType state_type,
                        GtkShadowType shadow_type,
                        GtkWidget* widget,
                        SML_CVECTOR_VAL(const gchar, detail),
                        gint x,
                        gint y,
                        gint width,
                        gint height)
{
  gtk_paint_option (style,
                    cr,
                    state_type,
                    shadow_type,
                    widget,
                    GET_SML_CVECTOR_VAL(const gchar, detail),
                    x,
                    y,
                    width,
                    height);
}

void
mlton_gtk_paint_resize_grip (GtkStyle* style,
                             cairo_t* cr,
                             GtkStateType state_type,
                             GtkWidget* widget,
                             SML_CVECTOR_VAL(const gchar, detail),
                             GdkWindowEdge edge,
                             gint x,
                             gint y,
                             gint width,
                             gint height)
{
  gtk_paint_resize_grip (style,
                         cr,
                         state_type,
                         widget,
                         GET_SML_CVECTOR_VAL(const gchar, detail),
                         edge,
                         x,
                         y,
                         width,
                         height);
}

void
mlton_gtk_paint_shadow (GtkStyle* style,
                        cairo_t* cr,
                        GtkStateType state_type,
                        GtkShadowType shadow_type,
                        GtkWidget* widget,
                        SML_CVECTOR_VAL(const gchar, detail),
                        gint x,
                        gint y,
                        gint width,
                        gint height)
{
  gtk_paint_shadow (style,
                    cr,
                    state_type,
                    shadow_type,
                    widget,
                    GET_SML_CVECTOR_VAL(const gchar, detail),
                    x,
                    y,
                    width,
                    height);
}

void
mlton_gtk_paint_shadow_gap (GtkStyle* style,
                            cairo_t* cr,
                            GtkStateType state_type,
                            GtkShadowType shadow_type,
                            GtkWidget* widget,
                            SML_CVECTOR_VAL(const gchar, detail),
                            gint x,
                            gint y,
                            gint width,
                            gint height,
                            GtkPositionType gap_side,
                            gint gap_x,
                            gint gap_width)
{
  gtk_paint_shadow_gap (style,
                        cr,
                        state_type,
                        shadow_type,
                        widget,
                        GET_SML_CVECTOR_VAL(const gchar, detail),
                        x,
                        y,
                        width,
                        height,
                        gap_side,
                        gap_x,
                        gap_width);
}

void
mlton_gtk_paint_slider (GtkStyle* style,
                        cairo_t* cr,
                        GtkStateType state_type,
                        GtkShadowType shadow_type,
                        GtkWidget* widget,
                        SML_CVECTOR_VAL(const gchar, detail),
                        gint x,
                        gint y,
                        gint width,
                        gint height,
                        GtkOrientation orientation)
{
  gtk_paint_slider (style,
                    cr,
                    state_type,
                    shadow_type,
                    widget,
                    GET_SML_CVECTOR_VAL(const gchar, detail),
                    x,
                    y,
                    width,
                    height,
                    orientation);
}

void
mlton_gtk_paint_spinner (GtkStyle* style,
                         cairo_t* cr,
                         GtkStateType state_type,
                         GtkWidget* widget,
                         SML_CVECTOR_VAL(const gchar, detail),
                         guint step,
                         gint x,
                         gint y,
                         gint width,
                         gint height)
{
  gtk_paint_spinner (style,
                     cr,
                     state_type,
                     widget,
                     GET_SML_CVECTOR_VAL(const gchar, detail),
                     step,
                     x,
                     y,
                     width,
                     height);
}

void
mlton_gtk_paint_tab (GtkStyle* style,
                     cairo_t* cr,
                     GtkStateType state_type,
                     GtkShadowType shadow_type,
                     GtkWidget* widget,
                     SML_CVECTOR_VAL(const gchar, detail),
                     gint x,
                     gint y,
                     gint width,
                     gint height)
{
  gtk_paint_tab (style,
                 cr,
                 state_type,
                 shadow_type,
                 widget,
                 GET_SML_CVECTOR_VAL(const gchar, detail),
                 x,
                 y,
                 width,
                 height);
}

void
mlton_gtk_paint_vline (GtkStyle* style,
                       cairo_t* cr,
                       GtkStateType state_type,
                       GtkWidget* widget,
                       SML_CVECTOR_VAL(const gchar, detail),
                       gint y1_,
                       gint y2_,
                       gint x)
{
  gtk_paint_vline (style,
                   cr,
                   state_type,
                   widget,
                   GET_SML_CVECTOR_VAL(const gchar, detail),
                   y1_,
                   y2_,
                   x);
}

gboolean
mlton_gtk_parse_args (int* argc,
                      SML_CVECTORVECTOR_REF(char, argv))
{
  return gtk_parse_args (argc,
                         GET_SML_CVECTORVECTOR_REF(char, argv));
}

void
mlton_gtk_rc_add_default_file (SML_CVECTOR_VAL(gchar, filename))
{
  gtk_rc_add_default_file (GET_SML_CVECTOR_VAL(gchar, filename));
}

gchar*
mlton_gtk_rc_find_module_in_path (SML_CVECTOR_VAL(const gchar, module_file))
{
  return gtk_rc_find_module_in_path (GET_SML_CVECTOR_VAL(const gchar, module_file));
}

gchar*
mlton_gtk_rc_find_pixmap_in_path (GtkSettings* settings,
                                  GScanner* scanner,
                                  SML_CVECTOR_VAL(const gchar, pixmap_file))
{
  return gtk_rc_find_pixmap_in_path (settings,
                                     scanner,
                                     GET_SML_CVECTOR_VAL(const gchar, pixmap_file));
}

GtkStyle*
mlton_gtk_rc_get_style_by_paths (GtkSettings* settings,
                                 SML_CVECTOR_VAL(const char, widget_path),
                                 SML_CVECTOR_VAL(const char, class_path),
                                 GType type)
{
  return gtk_rc_get_style_by_paths (settings,
                                    GET_SML_CVECTOR_VAL(const char, widget_path),
                                    GET_SML_CVECTOR_VAL(const char, class_path),
                                    type);
}

void
mlton_gtk_rc_parse (SML_CVECTOR_VAL(const gchar, filename))
{
  gtk_rc_parse (GET_SML_CVECTOR_VAL(const gchar, filename));
}

void
mlton_gtk_rc_parse_string (SML_CVECTOR_VAL(const gchar, rc_string))
{
  gtk_rc_parse_string (GET_SML_CVECTOR_VAL(const gchar, rc_string));
}

void
mlton_gtk_rc_set_default_files (SML_CVECTORVECTOR_VAL(gchar, filenames))
{
  gtk_rc_set_default_files (GET_SML_CVECTORVECTOR_VAL(gchar, filenames));
}

void
mlton_gtk_selection_add_targets (GtkWidget* widget,
                                 GdkAtom selection,
                                 SML_CVECTOR_VAL(GtkTargetEntry, targets),
                                 guint ntargets)
{
  gtk_selection_add_targets (widget,
                             selection,
                             GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                             ntargets);
}

#if GTK_CHECK_VERSION(2, 14, 0)
gboolean
mlton_gtk_show_uri (GdkScreen* screen,
                    SML_CVECTOR_VAL(const gchar, uri),
                    guint32 timestamp,
                    GError** error)
{
  return gtk_show_uri (screen,
                       GET_SML_CVECTOR_VAL(const gchar, uri),
                       timestamp,
                       error);
}
#endif

#if GTK_CHECK_VERSION(3, 22, 0)
gboolean
mlton_gtk_show_uri_on_window (GtkWindow* parent,
                              SML_CVECTOR_VAL(const char, uri),
                              guint32 timestamp,
                              GError** error)
{
  return gtk_show_uri_on_window (parent,
                                 GET_SML_CVECTOR_VAL(const char, uri),
                                 timestamp,
                                 error);
}
#endif

void
mlton_gtk_stock_add (SML_CVECTOR_VAL(GtkStockItem, items),
                     guint n_items)
{
  gtk_stock_add (GET_SML_CVECTOR_VAL(GtkStockItem, items),
                 n_items);
}

void
mlton_gtk_stock_add_static (SML_CVECTOR_VAL(GtkStockItem, items),
                            guint n_items)
{
  gtk_stock_add_static (GET_SML_CVECTOR_VAL(GtkStockItem, items),
                        n_items);
}

gboolean
mlton_gtk_stock_lookup (SML_CVECTOR_VAL(const gchar, stock_id),
                        GtkStockItem* item)
{
  return gtk_stock_lookup (GET_SML_CVECTOR_VAL(const gchar, stock_id),
                           item);
}

#if GTK_CHECK_VERSION(2, 8, 0)
void
mlton_gtk_stock_set_translate_func (SML_CVECTOR_VAL(const gchar, domain),
                                    GtkTranslateFunc func,
                                    gpointer data,
                                    GDestroyNotify notify)
{
  gtk_stock_set_translate_func (GET_SML_CVECTOR_VAL(const gchar, domain),
                                func,
                                data,
                                notify);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
void
mlton_gtk_target_table_free (SML_CVECTOR_VAL(GtkTargetEntry, targets),
                             gint n_targets)
{
  gtk_target_table_free (GET_SML_CVECTOR_VAL(GtkTargetEntry, targets),
                         n_targets);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_targets_include_image (SML_CVECTOR_VAL(GdkAtom, targets),
                                 gint n_targets,
                                 gboolean writable)
{
  return gtk_targets_include_image (GET_SML_CVECTOR_VAL(GdkAtom, targets),
                                    n_targets,
                                    writable);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_targets_include_rich_text (SML_CVECTOR_VAL(GdkAtom, targets),
                                     gint n_targets,
                                     GtkTextBuffer* buffer)
{
  return gtk_targets_include_rich_text (GET_SML_CVECTOR_VAL(GdkAtom, targets),
                                        n_targets,
                                        buffer);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_targets_include_text (SML_CVECTOR_VAL(GdkAtom, targets),
                                gint n_targets)
{
  return gtk_targets_include_text (GET_SML_CVECTOR_VAL(GdkAtom, targets),
                                   n_targets);
}
#endif

#if GTK_CHECK_VERSION(2, 10, 0)
gboolean
mlton_gtk_targets_include_uri (SML_CVECTOR_VAL(GdkAtom, targets),
                               gint n_targets)
{
  return gtk_targets_include_uri (GET_SML_CVECTOR_VAL(GdkAtom, targets),
                                  n_targets);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
GtkWidget*
mlton_gtk_test_create_simple_window (SML_CVECTOR_VAL(const gchar, window_title),
                                     SML_CVECTOR_VAL(const gchar, dialog_text))
{
  return gtk_test_create_simple_window (GET_SML_CVECTOR_VAL(const gchar, window_title),
                                        GET_SML_CVECTOR_VAL(const gchar, dialog_text));
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
GtkWidget*
mlton_gtk_test_find_label (GtkWidget* widget,
                           SML_CVECTOR_VAL(const gchar, label_pattern))
{
  return gtk_test_find_label (widget,
                              GET_SML_CVECTOR_VAL(const gchar, label_pattern));
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
GtkWidget*
mlton_gtk_test_find_widget (GtkWidget* widget,
                            SML_CVECTOR_VAL(const gchar, label_pattern),
                            GType widget_type)
{
  return gtk_test_find_widget (widget,
                               GET_SML_CVECTOR_VAL(const gchar, label_pattern),
                               widget_type);
}
#endif

#if GTK_CHECK_VERSION(2, 14, 0)
void
mlton_gtk_test_text_set (GtkWidget* widget,
                         SML_CVECTOR_VAL(const gchar, string))
{
  gtk_test_text_set (widget,
                     GET_SML_CVECTOR_VAL(const gchar, string));
}
#endif
