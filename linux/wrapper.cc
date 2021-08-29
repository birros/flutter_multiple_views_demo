#include <gtk/gtk.h>
#include <flutter_linux/flutter_linux.h>
#include "wrapper.h"

void wrapper_setup(GtkContainer *container, FlView *view, FlView *view2)
{
  // box
  GtkWidget *box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
  gtk_widget_show(GTK_WIDGET(box));
  gtk_container_add(container, GTK_WIDGET(box));

  gtk_box_pack_start(GTK_BOX(box), GTK_WIDGET(view), TRUE, TRUE, 0);
  gtk_box_pack_start(GTK_BOX(box), GTK_WIDGET(view2), TRUE, TRUE, 0);
}
