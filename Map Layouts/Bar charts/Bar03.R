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
  labs(title = "", x = "Length of Running Mean (yr)", y = "% of Normal Runoff") +
  scale_fill_manual(
    values = c("Value1" = "blue2", "Value2" = "cyan3", "Value3" = "red2", "Value4" = "orange2"),
    labels = c("1939-1999", "1687-1999", "1687-1999, deltaT=+6degC", "1687-1999, deltaSWC=-50%")
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
ggsave("Bar03.png", plot = chart + guides(fill = guide_legend(nrow = 4, byrow = TRUE, keyheight = unit(.7, "cm"))) +
         theme(legend.text = element_text(size = 13)), 
       width = 8, height = 6, dpi = 300, bg = "white")
