# hrs_stress_sensitization
This repository holds code for the the project titled: "Stress sensitization: does childhood adversity modify trauma effects on memory?"

Zenodo DOI: 10.5281/zenodo.23735846

* **01_data construction stress 4.9.Rmd** : Import RAND fat files, LHMS, CSES measures, and Memory Scores data; clean filter and integrate these datasets. Childhood adversity variable construction (both core and lhms).
* **02_data imputation stress 4.3.Rmd** : Impute dataset includes the full sample size. The data was split into the 2006/2010 and 2008/2012 cohorts, and imputation was performed separately for each using mice. The imputed datasets for both cohorts were merged, and confirmatory factor analysis was performed. Factor score variables were added to the dataset.
* **03_table 1 stress 4.7.Rmd** : Create Table 1
* **04_model stress 4.10.Rmd** : The imputed dataset was then converted to long format and a time variable was added. Linear mixed models were used to fit the models and conduct sensitivity analyses.  
* **05_data construction stress 6.5 wordtot.Rmd** : Import RAND fat files, LHMS, CSES measures, and Memory Scores data; clean filter and integrate these datasets. Change the outcome from memimp to wordtot. Childhood adversity variable construction (both core and lhms)
* **06_data imputation stress 6.5 wordtot.Rmd** : Impute dataset includes the full sample size. The data was split into the 2006/2010 and 2008/2012 cohorts, and imputation was performed separately for each using mice. The imputed datasets for both cohorts were merged, and confirmatory factor analysis was performed. Factor score variables were added to the dataset.
* **07_model stress 6.5 wordtot.Rmd** : The imputed dataset was then converted to long format and a time variable was added. Linear mixed models were used to fit the models and conduct sensitivity analyses.  
* **0c_imp_tbl1_function.R** : Mean and SD across imputation for table 1
