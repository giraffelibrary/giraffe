/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gtk C interface support for Poly/ML
 */

#include <gtk/gtk.h>


/* GtkAccelKey */

GtkAccelKey *
giraffe_gtk_accel_key_new (void)
{
  return g_slice_new (GtkAccelKey);
}

GtkAccelKey *
giraffe_gtk_accel_key_copy (const GtkAccelKey *key)
{
  return g_slice_dup (GtkAccelKey, key);
}

void
giraffe_gtk_accel_key_free (GtkAccelKey *key)
{
  g_slice_free (GtkAccelKey, key);
}


/* GtkFileChooserDialog */

GtkWidget *
giraffe_gtk_file_chooser_dialog_new (const gchar *title,
                                     GtkWindow *parent,
                                     GtkFileChooserAction action)
{
  return gtk_file_chooser_dialog_new (title,
                                      parent,
                                      action,
                                      NULL);
}


/* GtkFileFilter */

GtkFileFilterInfo *
giraffe_gtk_file_filter_info_new (void)
{
  return g_slice_new (GtkFileFilterInfo);
}

GtkFileFilterInfo *
giraffe_gtk_file_filter_info_copy (const GtkFileFilterInfo *info)
{
  return g_slice_dup (GtkFileFilterInfo, info);
}

void
giraffe_gtk_file_filter_info_free (GtkFileFilterInfo *info)
{
  g_slice_free (GtkFileFilterInfo, info);
}


/* GtkMessageDialog */

GtkWidget *
giraffe_gtk_message_dialog_new (GtkWindow *parent,
                                GtkDialogFlags flags,
                                GtkMessageType type,
                                GtkButtonsType buttons)
{
  return gtk_message_dialog_new (parent,
                                 flags,
                                 type,
                                 buttons,
                                 NULL);
}


/* GtkRecentFilter */

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_new (void)
{
  return g_slice_new (GtkRecentFilterInfo);
}

GtkRecentFilterInfo *
giraffe_gtk_recent_filter_info_copy (const GtkRecentFilterInfo *info)
{
  return g_slice_dup (GtkRecentFilterInfo, info);
}

void
giraffe_gtk_recent_filter_info_free (GtkRecentFilterInfo *info)
{
  g_slice_free (GtkRecentFilterInfo, info);
}


/* GtkRecentData */

GtkRecentData *
giraffe_gtk_recent_data_new (void)
{
  return g_slice_new (GtkRecentData);
}

GtkRecentData *
giraffe_gtk_recent_data_copy (const GtkRecentData *data)
{
  return g_slice_dup (GtkRecentData, data);
}

void
giraffe_gtk_recent_data_free (GtkRecentData *data)
{
  g_slice_free (GtkRecentData, data);
}


/* GtkSettingsValue */

GtkSettingsValue *
giraffe_gtk_settings_value_new (void)
{
  return g_slice_new (GtkSettingsValue);
}

GtkSettingsValue *
giraffe_gtk_settings_value_copy (const GtkSettingsValue *settings_value)
{
  return g_slice_dup (GtkSettingsValue, settings_value);
}

void
giraffe_gtk_settings_value_free (GtkSettingsValue *settings_value)
{
  g_slice_free (GtkSettingsValue, settings_value);
}


/* GtkStockItem */

GtkStockItem *
giraffe_gtk_stock_item_new (void)
{
  return g_new (GtkStockItem, 1);
}


/* GtkTextIter */

GtkTextIter *
giraffe_gtk_text_iter_new (void)
{
  return g_slice_new (GtkTextIter);
}


/* GtkTreeIter */

GtkTreeIter *
giraffe_gtk_tree_iter_new (void)
{
  return g_slice_new (GtkTreeIter);
}
