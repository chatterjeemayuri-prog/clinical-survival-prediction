# Survival Analysis of Patient Outcomes

## Objective
The goal of this project is to analyze patient survival data using statistical methods to understand how different factors affect time-to-event outcomes.

## Dataset
The analysis uses the lung cancer dataset available in the R `survival` package.  
It includes patient-level clinical data such as survival time, age, sex, and performance score.

## Methods

### 1. Kaplan-Meier Estimation
Used to estimate survival probabilities over time for different groups.

### 2. Log-Rank Test
Used to compare survival distributions between groups.

### 3. Cox Proportional Hazards Model
Used to evaluate the effect of covariates (age, sex, performance status) on survival.

### 4. Assumption Testing
Proportional hazards assumption checked using Schoenfeld residuals.

## Key Findings

- Survival probabilities differ across patient groups.
- Performance status (ph.ecog) shows a strong association with survival.
- Age has a moderate effect on mortality risk.
- Differences between groups were statistically evaluated using log-rank test.

## Interpretation

The analysis demonstrates how survival models can be used to quantify patient risk over time.  
Higher performance scores are associated with increased hazard, indicating worse clinical condition.  
These methods are widely used in clinical research and epidemiology.

## Tools Used
- R
- survival package

## Author
Mayuri Chatterjee
