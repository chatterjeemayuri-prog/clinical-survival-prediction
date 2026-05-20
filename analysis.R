#############################################
# Clinical Survival Prediction Using
# Statistical and Machine Learning Approaches
#############################################

# =====================================================
# 1. Load Libraries
# =====================================================

library(survival)
library(glmnet)
library(randomForestSRC)

# =====================================================
# 2. Load Dataset
# =====================================================

data(lung)

# =====================================================
# 3. Data Preprocessing
# =====================================================

# Remove missing values
lung <- na.omit(lung)

# Convert status variable
# Original:
#   1 = censored/alive
#   2 = dead
#
# Convert to:
#   0 = alive
#   1 = dead

lung$status <- ifelse(lung$status == 2, 1, 0)

# Convert sex to factor
lung$sex <- factor(
  lung$sex,
  levels = c(1, 2),
  labels = c("Male", "Female")
)

# View dataset
head(lung)

# =====================================================
# 4. Train-Test Split
# =====================================================

set.seed(123)

train_index <- sample(
  1:nrow(lung),
  size = 0.7 * nrow(lung)
)

train_data <- lung[train_index, ]
test_data  <- lung[-train_index, ]

# =====================================================
# 5. Create Survival Object
# =====================================================

surv_object <- Surv(
  time = train_data$time,
  event = train_data$status
)

head(surv_object)

# =====================================================
# 6. Kaplan-Meier Estimation
# =====================================================

km_fit <- survfit(
  Surv(time, status) ~ sex,
  data = train_data
)

# Plot Kaplan-Meier Curve
plot(
  km_fit,
  col = c("blue", "red"),
  lty = 1:2,
  xlab = "Time (days)",
  ylab = "Survival Probability",
  main = "Kaplan-Meier Survival Curve by Sex"
)

legend(
  "topright",
  legend = c("Male", "Female"),
  col = c("blue", "red"),
  lty = 1:2
)

# =====================================================
# 7. Log-Rank Test
# =====================================================

log_rank <- survdiff(
  Surv(time, status) ~ sex,
  data = train_data
)

cat("\n=============================\n")
cat("Log-Rank Test\n")
cat("=============================\n")

print(log_rank)

# =====================================================
# 8. Cox Proportional Hazards Model
# =====================================================

cox_model <- coxph(
  Surv(time, status) ~ age + sex + ph.ecog,
  data = train_data
)

cat("\n=============================\n")
cat("Cox Proportional Hazards Model\n")
cat("=============================\n")

summary(cox_model)

# =====================================================
# 9. Hazard Ratios
# =====================================================

cat("\n=============================\n")
cat("Hazard Ratios\n")
cat("=============================\n")

print(exp(coef(cox_model)))

cat("\n=============================\n")
cat("95% Confidence Intervals\n")
cat("=============================\n")

print(exp(confint(cox_model)))

# =====================================================
# 10. Proportional Hazards Assumption
# =====================================================

ph_test <- cox.zph(cox_model)

cat("\n=============================\n")
cat("Proportional Hazards Test\n")
cat("=============================\n")

print(ph_test)

# Plot PH diagnostics
plot(ph_test)

# =====================================================
# 11. Concordance Index
# =====================================================

cox_predictions <- predict(
  cox_model,
  newdata = test_data,
  type = "risk"
)

concordance_result <- concordance(
  Surv(test_data$time, test_data$status) ~
    cox_predictions
)

cat("\n=============================\n")
cat("Concordance Index\n")
cat("=============================\n")

print(concordance_result)

# =====================================================
# 12. Penalized Cox Regression (LASSO)
# =====================================================

# Create design matrix
x_train <- model.matrix(
  Surv(time, status) ~ age + sex + ph.ecog,
  data = train_data
)[, -1]

y_train <- Surv(
  train_data$time,
  train_data$status
)

# Cross-validated LASSO Cox model
cv_lasso <- cv.glmnet(
  x = x_train,
  y = y_train,
  family = "cox",
  alpha = 1
)

cat("\n=============================\n")
cat("Penalized Cox Regression (LASSO)\n")
cat("=============================\n")

print(cv_lasso)

# Plot cross-validation results
plot(cv_lasso)

# Best lambda
cat("\nOptimal Lambda:\n")
print(cv_lasso$lambda.min)

# =====================================================
# 13. Random Survival Forest
# =====================================================

rsf_model <- rfsrc(
  Surv(time, status) ~ age + sex + ph.ecog,
  data = train_data,
  ntree = 500,
  importance = TRUE
)

cat("\n=============================\n")
cat("Random Survival Forest\n")
cat("=============================\n")

print(rsf_model)

# =====================================================
# 14. Variable Importance
# =====================================================

cat("\n=============================\n")
cat("Variable Importance\n")
cat("=============================\n")

print(rsf_model$importance)

# Plot variable importance
var.select(rsf_model)

# =====================================================
# 15. Prediction on Test Data
# =====================================================

rsf_predictions <- predict(
  rsf_model,
  newdata = test_data
)

cat("\n=============================\n")
cat("Random Survival Forest Predictions\n")
cat("=============================\n")

print(head(rsf_predictions$predicted))

# =====================================================
# 16. Model Comparison Summary
# =====================================================

cat("\n=========================================\n")
cat("Model Comparison Summary\n")
cat("=========================================\n")

cat("\nModels Implemented:\n")
cat("- Kaplan-Meier Survival Estimation\n")
cat("- Cox Proportional Hazards Model\n")
cat("- Penalized Cox Regression (LASSO)\n")
cat("- Random Survival Forest\n")

cat("\nValidation Approaches:\n")
cat("- Train/Test Split\n")
cat("- Concordance Index\n")
cat("- Cross-Validation\n")

# =====================================================
# END
# =====================================================