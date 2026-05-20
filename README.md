# Clinical Survival Prediction Using Statistical and Machine Learning Approaches

## Overview

This project investigates clinical survival prediction using both classical statistical methods and modern machine learning approaches on patient-level survival data. The objective is to evaluate how different modelling strategies perform in predicting time-to-event outcomes while maintaining interpretability and methodological rigor.

The analysis uses the `lung` dataset from the R `survival` package and demonstrates reproducible workflows commonly used in clinical research, epidemiology, and biostatistics.

The project compares traditional survival analysis techniques with predictive machine learning-based survival models and evaluates their performance using validation metrics appropriate for censored clinical outcomes.

# Research Objectives

- Analyse patient survival outcomes using statistical and machine learning methods
- Compare classical survival models with predictive machine learning approaches
- Evaluate model performance using validation frameworks for censored data
- Investigate clinically relevant predictors associated with survival outcomes
- Demonstrate reproducible analytical workflows for health data research

# Dataset

The analysis uses the publicly available `lung` dataset from the R `survival` package.

## Variables include

- `time` — survival time
- `status` — censoring indicator
- `age` — patient age
- `sex` — patient sex
- `ph.ecog` — ECOG performance score
- additional clinical covariates

The dataset contains right-censored survival data commonly encountered in clinical and epidemiological studies.

# Methods

## 1. Kaplan–Meier Survival Estimation

Kaplan–Meier estimators were used to estimate survival probabilities across patient groups.

### Purpose
- Non-parametric estimation of survival functions
- Visual comparison of survival trajectories

## 2. Log-Rank Test

The log-rank test was used to compare survival distributions between groups.

### Purpose
- Statistical comparison of group-level survival differences

## 3. Cox Proportional Hazards Model

A multivariable Cox proportional hazards model was fitted to evaluate associations between clinical covariates and survival outcomes.

### Covariates examined
- age
- sex
- ECOG performance score

### Purpose
- Estimate hazard ratios
- Quantify covariate effects on mortality risk

## 4. Penalized Survival Models

Regularized survival models were implemented to improve predictive performance and reduce overfitting.

### Methods
- LASSO penalized Cox regression
- Ridge regression
- Elastic Net

### Purpose
- Variable selection
- High-dimensional predictive modelling

## 5. Machine Learning Survival Models

Machine learning approaches were implemented for survival prediction.

### Methods
- Random Survival Forests
- Gradient Boosting Survival Models

### Purpose
- Capture non-linear relationships
- Improve predictive accuracy
- Explore ensemble learning techniques for censored outcomes

## 6. Model Validation and Evaluation

Models were evaluated using validation metrics appropriate for survival prediction.

### Validation approaches
- Cross-validation
- Train/test split evaluation

### Metrics
- Concordance Index (C-index)
- Integrated Brier Score
- Calibration assessment

# Key Findings

- ECOG performance score showed a strong association with mortality risk
- Classical Cox models provided interpretable estimates of clinical risk factors
- Machine learning survival models improved predictive flexibility and captured more complex relationships within the data
- Ensemble methods demonstrated improved predictive performance relative to simpler baseline models
- Proper validation was critical for assessing model generalizability

# Interpretation

This project demonstrates how statistical modelling and machine learning methods can be integrated in survival analysis workflows for clinical research.

Classical survival models provide interpretable inference regarding risk factors, while machine learning approaches offer increased predictive flexibility for complex clinical datasets.

The analysis highlights the importance of:
- validation strategies
- reproducible workflows
- handling censored outcomes appropriately
- balancing interpretability and predictive performance

These approaches are widely applicable in:
- biostatistics
- epidemiology
- clinical prediction modelling
- precision medicine research

# Methodological Considerations

This project highlights the importance of combining statistical inference with predictive modelling in clinical survival analysis.

Classical survival models such as the Cox proportional hazards model provide interpretable estimates of covariate effects and remain important for understanding clinically meaningful associations. However, machine learning survival methods can improve predictive flexibility by capturing non-linear relationships and interactions that may not be adequately represented in traditional models.

The project therefore compares interpretable statistical approaches with more flexible predictive methods while emphasizing validation and reproducibility.

# Limitations

Several limitations should be considered:

- The dataset used is relatively small and intended primarily for methodological demonstration.
- External validation was not performed.
- The analysis uses a limited number of clinical covariates.
- More advanced approaches such as deep learning survival models were not explored.

Future work could extend the analysis to larger real-world clinical datasets and incorporate additional predictors, longitudinal measurements, and explainability methods.

# Why Survival Machine Learning Matters

Predictive modelling for time-to-event outcomes plays an important role in clinical research and healthcare analytics.

Accurate survival prediction can support:
- risk stratification,
- treatment planning,
- clinical decision-making,
- identification of high-risk patient groups.

Machine learning survival methods are increasingly being used in biostatistics and precision medicine research because they allow more flexible modelling of complex clinical relationships while maintaining predictive performance.

# Reproducibility

The analysis was developed using reproducible workflows in R with script-based implementation and version-controlled project organization through GitHub.

# Tools and Technologies

## Programming Language
- R

## Packages
- `survival`
- `survminer`
- `glmnet`
- `randomForestSRC`
- `pec`
- `caret`

## Reproducibility
- GitHub version control
- Reproducible analytical workflows
- Script-based analysis pipeline

# Results

## Visualisations
- Kaplan–Meier survival curves
- Variable importance plots
- Calibration plots
- Model comparison tables

## Outputs
- Survival probability estimates
- Hazard ratio estimates
- Predictive performance metrics
- Cross-validation results

# Repository Structure

```text
├── data/
├── scripts/
├── figures/
├── results/
├── README.md
└── requirements.txt
```

# Future Extensions

Potential future developments include:
- Deep learning survival models
- Time-dependent covariates
- External validation datasets
- Explainable AI methods (e.g. SHAP values)
- Integration with longitudinal clinical data

# Author

**Mayuri Chatterjee**  
PhD Researcher in Statistics  
Stockholm University