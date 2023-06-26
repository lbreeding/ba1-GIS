# Create a data frame with the given data
data <- data.frame(
  Category = 1:4,
  Value1 = c(15.935, 60.629, 70.573, 78.404),
  Value2 = c(27.441, 57.617, 69.072, 78.518),
  Value3 = c(18.414, 52.808, 64.429, 72.531),
  Value4 = c(33.867, 64.223, 75.221, 84.231)
)

# Load the necessary library
library(ggplot2)

# Reshape the data to long format
data_long <- tidyr::gather(data, Key, Value, -Category)

# Create the bar chart
chart <- ggplot(data_long, aes(x = as.factor(Category), y = Value, fill = Key)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6, color = "black") +
  geom_segment(aes(x = 3.6, xend = 4.4, y = 38, yend = 38),
               linetype = "dashed", color = "black") +
  geom_segment(aes(x = 0.6, xend = 1.4, y = 54.997, yend = 54.997),
               linetype = "dashed", color = "black") +
  geom_segment(aes(x = 1.6, xend = 2.4, y = 69.634, yend = 69.634),
               linetype = "dashed", color = "black") +
  geom_segment(aes(x = 2.6, xend = 3.4, y = 83.453, yend = 83.453),
               linetype = "dashed", color = "black") +
  geom_text(aes(x = 1, y = 46, label = "Observed"),
            color = "black", size = 3, vjust = -0.5) +
  
 
  labs(title = "", x = "Running Mean (yr)", y = "% of Normal") +
  scale_fill_manual(
    values = c("Value1" = "black", "Value2" = "grey", "Value3" = "blue2", "Value4" = "cyan3"),
    labels = c("Dir, 1939-1999", "Dir, 1687-1938", "Ind, 1939-1999", "Ind, 1687-1938")
  ) +
  scale_x_discrete(labels = c("2", "5", "10", "20")) +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, 10), expand = c(0,0)) +
  labs(fill = NULL) +
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.background = element_rect(fill = "white"),
    axis.text.x = element_text(size = 9, face = "plain"),
    axis.ticks = element_line(color = "black", size = .5),
    panel.grid = element_blank()
  )

# Save the plot as a PNG file
ggsave("bar_chart05.png", plot = chart + guides(fill = guide_legend(nrow = 4, byrow = TRUE, keyheight = unit(.7, "cm"))) +
         theme(legend.text = element_text(size = 13)), 
       width = 8, height = 6, dpi = 300, bg = "white")




