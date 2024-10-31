#Welcome to R Graphing Buddy - Violin Plot
#Julian Vargo (2024)
#Department of Spanish & Portuguese
#University of California, Berkeley

rm(list = ls()) #Clears environment so nothing gets mucked up. Beware if you don't want your environment to be cleared.
install.packages("ggplot2") #You can remove the pound sign if you've never installed ggplot2 before
install.packages("ggthemes") #You can remove the pound sign if you've never installed ggthemes before
install.packages("extrafont") #You can remove the pound sign if you've never installed extrafont before
library(ggplot2)
library(ggthemes)
library(extrafont)
# font_import() #This command takes a while to run. If you've already loaded your required fonts into R previously, you should insert a pound sign to deactivate this line.
# fonts() #Run this command if you don't remember the names of all of your fonts.
DataName <- read.csv(file.choose(), header = TRUE, stringsAsFactors = TRUE)

# Adjust your graph here:
# Data variables
x_var <- "manner"                       # Variable for x-axis
y_var <- "duration"                     # Variable for y-axis

# Graph titles and labels
graph_title <- "Duration vs Manner of Articulation"  
graph_subtitle <- "By Julian Vargo"       
graph_caption <- "Data taken from the Multilingual Hispanic Speech in California Corpus"
x_label <- "Manner of Articulation"     
y_label <- "Duration (s)"               

# Axis text properties
axis_text_angle_x <- 45                   # Angle for x-axis text (e.g., 45 for slanted labels)
axis_text_angle_y <- 0                   # Angle for y-axis text
axis_text_color <- "black"               # Color of axis text
axis_font <- "Arial"                # Font for axis text
axis_text_size <- 10                      # Font size for axis text

# Axis title properties
axis_title_color <- "black"              # Color of axis titles
axis_title_font <- "Arial"          # Font for axis titles
axis_title_x_hjust <- 0.5                   # Horizontal justification for x axis title
axis_title_x_vjust <- 5                   # Vertical justification for axis x title
axis_title_y_hjust <- .5                   # Horizontal justification for y axis title
axis_title_y_vjust <- 2                   # Vertical justification for y axis title
axis_title_size <- 12                     # Font size for axis titles
axis_x_hjust <- 0.85                       # Horizontal justification for x-axis labels
axis_x_vjust <- 1                       # Vertical justification for x-axis labels
axis_y_hjust <- 0.5                       # Horizontal justification for y-axis labels
axis_y_vjust <- 0.5                       # Vertical justification for y-axis labels

# plot properties
plot_alpha <- 0.6                     # Transparency level for the fill color
plot_color <- "NA"                 # Outline color of the plot
plot_linetype <- "solid"              # Linetype of the plot outline
plot_shape <- 21                       # Shape of outlier points
plot_size <- 0.5                       # Width of the plot outline
plot_width <- 0.6                      # Width of the plot

# Caption properties
caption_color <- "black"                  # Color of caption text
caption_font <- "Arial"              # Font for caption text
caption_hjust <- 0                        # Horizontal alignment for caption
caption_size <- 10                        # Font size for caption text

# Legend properties
legend_background_fill <- "white"         # Legend background color
legend_key_fill <- "white"                # Background color of individual legend items
legend_position <- "right"                # Position of the legend ("right", "bottom", "top", "left")
legend_text_color <- "black"              # Color of legend text
legend_text_font <- "Arial"         # Font for legend text
legend_text_size <- 10                    # Font size for legend text
legend_title <- "Legend title here yippee"  # Legend title placeholder
legend_title_color <- "black"             # Color of legend title
legend_title_font <- "Arial"        # Font for legend title
legend_title_size <- 12                    # Font size for the legend title

# Outlier properties
notch <- FALSE                            # Notch to indicate confidence interval around median
notch_width <- 0.25                       # Width of the notch
outlier_alpha <- 0.8                      # Transparency level of outliers
outlier_color <- "lightgray"              # Outline color of outliers
outlier_fill <- "black"                   # Fill color of outliers
outlier_shape <- 1                        # Shape of outliers (e.g., circle)
outlier_size <- 2                         # Size of outlier points
outlier_stroke <- 0.5                     # Border width of outliers

# Panel and plot background properties
panel_background_fill <- "white"          # Panel background color
panel_grid_color <- "lightgray"          # Grid line color
plot_background_fill <- "white"           # Plot background color

# Subtitle and title properties
subtitle_color <- "black"                 # Color of subtitle text
subtitle_font <- "Arial"             # Font for subtitle text
subtitle_hjust <- 0                       # Horizontal alignment for subtitle
subtitle_size <- 12                       # Font size for subtitle text
title_color <- "black"                    # Color of title text
title_font <- "Arial"                # Font for title text
title_hjust <- 0                          # Horizontal alignment for title
title_size <- 14                          # Font size for the plot title

# Box width variation
varwidth <- TRUE                          # Varies box width based on number of observations


##### Variable entry complete. You may now run the entire script by pressing Ctrl/Cmd + Alt + r

# Build ggplot() layer
ggplot_layer <- ggplot(
  DataName, 
  aes(
    x = .data[[x_var]], 
    y = .data[[y_var]],
    fill = .data[[x_var]]
  )
)

# Build geom_plot() layer
plot_layer <- ggplot_layer + geom_violin(
  alpha = plot_alpha,
  color = plot_color,
  width = plot_width,
  size = plot_size,
  linetype = plot_linetype,
  outlier.colour = outlier_color,
  outlier.fill = outlier_fill,
  outlier.shape = outlier_shape,
  outlier.size = outlier_size,
  outlier.stroke = outlier_stroke,
  outlier.alpha = outlier_alpha,
  notch = notch,
  notchwidth = notch_width,
  varwidth = varwidth
)

# Build labs() layer
labs_layer <- plot_layer + labs(
  title = graph_title, 
  subtitle = graph_subtitle, 
  caption = graph_caption,
  x = x_label, 
  y = y_label,
  fill = legend_title  # Customize the legend title
)

# Build the theme() layer
theme_layer <- labs_layer + theme(
  plot.background = element_rect(fill = plot_background_fill, color = NA),
  panel.background = element_rect(fill = panel_background_fill, color = NA),
  panel.grid.major = element_line(color = panel_grid_color),
  panel.grid.minor = element_blank(),
  legend.background = element_rect(fill = legend_background_fill),
  legend.key = element_rect(fill = legend_key_fill),
  legend.position = legend_position,
  legend.title = element_text(size = legend_title_size, color = legend_title_color, family = legend_title_font),
  legend.text = element_text(size = legend_text_size, color = legend_text_color, family = legend_text_font),
  axis.title.x = element_text(size = axis_title_size, hjust = axis_title_x_hjust, vjust = axis_title_x_vjust, color = axis_title_color, family = axis_title_font),
  axis.title.y = element_text(size = axis_title_size, hjust = axis_title_y_hjust, vjust = axis_title_y_vjust, color = axis_title_color, family = axis_title_font),
  axis.text.x = element_text(size = axis_text_size, hjust = axis_x_hjust, vjust = axis_x_vjust, color = axis_text_color, angle = axis_text_angle_x, family = axis_font),
  axis.text.y = element_text(size = axis_text_size, hjust = axis_y_hjust, vjust = axis_y_vjust, color = axis_text_color, angle = axis_text_angle_y, family = axis_font),
  plot.title = element_text(size = title_size, hjust = title_hjust, color = title_color, family = title_font),
  plot.subtitle = element_text(size = subtitle_size, hjust = subtitle_hjust, color = subtitle_color, family = subtitle_font),
  plot.caption = element_text(size = caption_size, hjust = caption_hjust, color = caption_color, family = caption_font)
)

palette_layer <- theme_layer + scale_fill_colorblind()

# Print the finalized plot
print(palette_layer)
