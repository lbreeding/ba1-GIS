

# Create a data frame with the given data
data <- data.frame(
  Category = 1:6,
  Value1 = c(0.57, 0.62, 0.65, 0.65, 0.67, 0.68),
  Value2 = c(0.56, 0.59, 0.65, 0.65, 0.65, 0.67),
  Value3 = c(0.27245, 0.32431, 0.4068, 0.4068, 0.36618, 0.35329),
  Value4 = c(0.1154, 0.19716, 0.27812, 0.27812, 0.26386, 0.25859)
)

# Load the necessary library
library(ggplot2)

# Reshape the data to long format
data_long <- tidyr::gather(data, Key, Value, -Category)

# Create the bar chart
chart <- ggplot(data_long, aes(x = as.factor(Category), y = Value, fill = Key)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6, color = "black") +
  labs(title = "", x = "Number of Predictors", y = "Accuracy/Skill") +
  scale_fill_manual(
    values = c("Value1" = "blue2", "Value2" = "red2", "Value3" = "orange2", "Value4" = "purple3"),
    labels = c("R²ₐ", expression(RE[CV]), "R²ₑ", "NSE")
  ) +
  scale_x_discrete(labels = c("1", "2", "3", "4", "5", "6")) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, 0.1)) +
  labs(fill = NULL) +  # Remove legend title
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.background = element_rect(fill = "white"),
    axis.text.x = element_text(size = 9, face = "plain"),
    axis.ticks = element_line(color = "black", size = .5),
    panel.grid = element_blank()
  )

# Adjust the legend spacing
chart + guides(fill = guide_legend(nrow = 4, byrow = TRUE, keyheight = unit(.7, "cm"))) +
  theme(legend.text = element_text(size = 13))

# Save the plot as a PNG file
ggsave("bar_chart.png", width = 8, height = 6, dpi = 300, bg = "white")













