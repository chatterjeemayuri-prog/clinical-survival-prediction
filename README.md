# Clinical Survival Prediction

This project analyses clinical time-to-event data using both classical survival analysis methods and machine learning approaches in R.

The analysis uses the `lung` dataset from the `survival` package and compares Kaplan–Meier estimation, Cox proportional hazards models, penalized Cox regression, and random survival forests for modelling patient survival outcomes.

The project focuses on survival prediction, interpretation of risk factors, and evaluation of predictive performance in censored clinical data.

## Methods

The workflow includes:

- Kaplan–Meier survival estimation
- Log-rank testing
- Cox proportional hazards modelling
- Penalized Cox regression (LASSO)
- Random Survival Forests
- Concordance-based model evaluation
- Train/test split validation

The analysis also includes:
- proportional hazards diagnostics,
- variable importance analysis,
- and reproducible modelling workflows in R.

## Dataset

The project uses the `lung` dataset available in the R `survival` package.

Variables include:
- survival time,
- censoring status,
- age,
- sex,
- ECOG performance score.

## Key Findings

- ECOG performance score showed a strong association with mortality risk.
- Cox models provided interpretable estimates of covariate effects.
- Random survival forests improved modelling flexibility for non-linear relationships.
- Penalized regression supported regularized predictive modelling and variable selection.
- Validation workflows highlighted the importance of evaluating generalizability in survival prediction.

## Visualisations

### Kaplan–Meier Survival Curve

![Kaplan-Meier Curve](figures/km_survival_curve.png)

### Proportional Hazards Diagnostics

![PH Diagnostics](figures/ph_assumption_plot.png)

### LASSO Cross-Validation

![LASSO CV](figures/lasso_cv_plot.png)

### Random Survival Forest Variable Importance

![Variable Importance](figures/variable_importance.png)

## Limitations

- The dataset is relatively small and intended primarily for methodological illustration.
- Clinical covariates available in the dataset are limited.
- The proportional hazards assumption may not hold uniformly across all predictors.
- Random survival forests improve flexibility but reduce interpretability compared with Cox models.
- External clinical validation was not performed.

## Tools

### Programming Language
- R

### Packages
- survival
- glmnet
- randomForestSRC

## Repository Contents

- `clinical_survival_prediction.R` — full analysis workflow
- `figures/` — generated visualisations
- `README.md` — project overview and methodology

## Author

**Mayuri Chatterjee**  
PhD Researcher in Statistics  
Stockholm University
