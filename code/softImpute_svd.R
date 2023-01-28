# Set working directory
setwd('C:\\Users\\brand\\source\\ml\\imputation\\data\\svd')

# Set Data List
data_names <- list("iris", "wine", "winequality-red", "winequality-white", "abalone")
missing_percentages <- list(0.1, 0.15, 0.2, 0.25)

# Prepare Impute
require(softImpute)
set.seed(42)

for (data_name in data_names) {
  for (missing_percentage in missing_percentages){
    
    # Load Data
    data <- read.csv(paste0(data_name, "_", missing_percentage, "_dropped.csv"))
    
    # Impute and Save
    fits = softImpute(data, type = "svd")
    write.csv(complete(data, fits), paste0(data_name, "_", missing_percentage, "_imputed.csv"))
    
  }
}