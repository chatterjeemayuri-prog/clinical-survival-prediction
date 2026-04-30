#############################################
# Survival Analysis (Clean Version)
# No ggplot2 / survminer dependency
#############################################

# -------------------------------
# 1. Load library
# -------------------------------
library(survival)

# -------------------------------
# 2. Load dataset
# -------------------------------
data(lung)

# -------------------------------
# 3. Data preprocessing
# -------------------------------

# Remove missing values
lung <- na.omit(lung)

# Convert status:
# Original:
#   1 = alive (censored)
#   2 = dead
# Convert to:
#   0 = alive
#   1 = dead
lung$status <- ifelse(lung$status == 2, 1, 0)

# -------------------------------
# 4. Create survival object
# -------------------------------

surv_object <- Surv(time = lung$time, event = lung$status)

# View
head(surv_object)

# -------------------------------
# 5. Kaplan-Meier estimation
# -------------------------------

km_fit <- survfit(surv_object ~ sex, data = lung)

# Plot (base R)
plot(km_fit,
     col = c("blue", "red"),
     lty = 1:2,
     xlab = "Time (days)",
     ylab = "Survival Probability",
     main = "Kaplan-Meier Survival Curve by Sex")

legend("topright",
       legend = c("Male", "Female"),
       col = c("blue", "red"),
       lty = 1:2)

# -------------------------------
# 6. Log-rank test
# -------------------------------

log_rank <- survdiff(surv_object ~ sex, data = lung)
print(log_rank)

# -------------------------------
# 7. Cox Proportional Hazards Model
# -------------------------------

cox_model <- coxph(surv_object ~ age + sex + ph.ecog, data = lung)

summary(cox_model)

# -------------------------------
# 8. Hazard ratios
# -------------------------------

cat("\nHazard Ratios:\n")
print(exp(coef(cox_model)))

cat("\nConfidence Intervals:\n")
print(exp(confint(cox_model)))

# -------------------------------
# 9. Check proportional hazards assumption
# -------------------------------

ph_test <- cox.zph(cox_model)
print(ph_test)

plot(ph_test)

#############################################
# END
#############################################