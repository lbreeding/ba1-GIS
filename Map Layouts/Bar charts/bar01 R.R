

# Create a data frame with the given data
data <- data.frame(
  Category = 1:6,
  Value1 = c(0.66, 0.69, 0.69, 0.71, 0.72, 0.72),
  Value2 = c(0.66, 0.69, 0.69, 0.69, 0.7, 0.7),
  Value3 = c(0.37087, 0.41556, 0.41556, 0.36343, 0.37601, 0.37601)
)

# Load the necessary library
library(ggplot2)

# Reshape the data to long format
data_long <- tidyr::gather(data, Key, Value, -Category)

# Create the bar chart with a gap between Value1 and Value2
ggplot(data_long, aes(x = as.factor(Category), y = Value, fill = Key)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6, color = "black") +
  labs(title = "", x = "Number of Predictors", y = "Accuracy/Skill") +
  scale_fill_manual(values = c("Value1" = "blue2", "Value2" = "red3", "Value3" = "orange")) +
  scale_x_discrete(labels = c("1", "2", "3", "4", "5", "6")) +
  scale_y_continuous(limits = c(0, 0.8), breaks = seq(0, 0.8, 0.1)) +
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.background = element_rect(fill = "white"),
    axis.text.x = element_text(size = 9, face = "plain"),
    axis.ticks = element_line(color = "black", size = .5), panel.grid = element_blank()
    
  )

# Save the plot as a PNG file
ggsave("clustered_bar_chart.png", width = 8, height = 6, dpi = 300, bg = "white")


# Create a data frame with the given data
data <- data.frame(
  Category = 1:6,
  Value1 = c(0.66, 0.69, 0.69, 0.71, 0.72, 0.72),
  Value2 = c(0.66, 0.69, 0.69, 0.69, 0.7, 0.7),
  Value3 = c(0.37087, 0.41556, 0.41556, 0.36343, 0.37601, 0.37601)
)

# Load the necessary library
library(ggplot2)

# Reshape the data to long format
data_long <- tidyr::gather(data, Key, Value, -Category)

# Create the bar chart with a gap between Value1 and Value2
ggplot(data_long, aes(x = as.factor(Category), y = Value, fill = Key)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6, color = "black") +
  labs(title = "", x = "Number of Predictors", y = "Accuracy/Skill") +
  scale_fill_manual(values = c("Value1" = "blue2", "Value2" = "red3", "Value3" = "orange")) +
  scale_x_discrete(labels = c("1", "2", "3", "4", "5", "6")) +
  scale_y_continuous(limits = c(0, 0.8), breaks = seq(0, 0.8, 0.1)) +
  labs(fill = NULL) +  # Remove legend title
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.background = element_rect(fill = "white"),
    axis.text.x = element_text(size = 9, face = "plain"),
    axis.ticks = element_line(color = "black", size = .5),
    panel.grid = element_blank()
  )

# Save the plot as a PNG file
ggsave("clustered_bar_chart.png", width = 8, height = 6, dpi = 300, bg = "white")


# Create a data frame with the given data
data <- data.frame(
  Category = 1:6,
  Value1 = c(0.66, 0.69, 0.69, 0.71, 0.72, 0.72),
  Value2 = c(0.66, 0.69, 0.69, 0.69, 0.7, 0.7),
  Value3 = c(0.37087, 0.41556, 0.41556, 0.36343, 0.37601, 0.37601)
)

# Load the necessary library
library(ggplot2)

# Reshape the data to long format
data_long <- tidyr::gather(data, Key, Value, -Category)

# Create the bar chart with a gap between Value1 and Value2
ggplot(data_long, aes(x = as.factor(Category), y = Value, fill = Key)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7), width = 0.6, color = "black") +
  labs(title = "", x = "Number of Predictors", y = "Accuracy/Skill") +
  scale_fill_manual(
    values = c("Value1" = "blue2", "Value2" = "red3", "Value3" = "orange"), 
    labels = c("R²ₐ", expression(RE[CV]), expression(r[E]))
  ) +
  scale_x_discrete(labels = c("1", "2", "3", "4", "5", "6")) +
  scale_y_continuous(limits = c(0, 0.8), breaks = seq(0, 0.8, 0.1)) +
  labs(fill = NULL) +  # Remove legend title
  theme_minimal() +
  theme(
    legend.position = "right",
    panel.background = element_rect(fill = "white"),
    axis.text.x = element_text(size = 9, face = "plain"),
    axis.ticks = element_line(color = "black", size = .5),
    panel.grid = element_blank(),
    legend.text.align = 0
  )

# Save the plot as a PNG file
ggsave("clustered_bar_chart.png", width = 8, height = 6, dpi = 300, bg = "white")











