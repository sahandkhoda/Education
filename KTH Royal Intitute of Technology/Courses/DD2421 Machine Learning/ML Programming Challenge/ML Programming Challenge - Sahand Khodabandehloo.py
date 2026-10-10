# ML Programming Challenge
# Author: Sahand Khodabandehloo (sahandkh@kth.se)

#%% === PACKAGES ==============================================================

import pandas as pd
import numpy as np

from sklearn.model_selection import StratifiedKFold
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score



#%% === LOAD DATA =============================================================

# Load CSV files
data_T = pd.read_csv("TrainOnMe_orig.csv")      # has target column "y"
data_E = pd.read_csv("EvaluateOnMe.csv")        # no target column

# Separate target (y) from features (x)
y_T = data_T["y"]                               # Target   (y, output)
X_T = data_T.drop(columns=["y"])                # Features (x, input columns)

# Detect input (x) column types
X_T_cat = []                                    # Categorical inputs
X_T_num = []                                    # Numerical inputs

for col in X_T.columns:    
    
    if X_T[col].dtype == "object" or X_T[col].dtype == "bool":
        X_T_cat.append(col)
        
    else:
        X_T_num.append(col)


# Delete temporary/unnecessary variable
del col


#%% === MODEL ACCURACY FUNCTION ===============================================

# Helper: average CV accuracy for a given pipeline
def cv_accuracy(model, X=X_T, y=y_T):
    
    accuracies = []
    for idx_tr, idx_va in cv.split(X, y):
        
        # Training samples
        X_train, y_train = X.iloc[idx_tr], y.iloc[idx_tr]
        
        # Validation samples
        X_valid, y_valid = X.iloc[idx_va], y.iloc[idx_va]
        
        # Fit the model parameters, i.e., train the model
        model.fit(X_train, y_train)
        
        # Predict (validation) output with corresponding (validation) inputs
        pred = model.predict(X_valid)
        
        # Fraction of correctly classified samples
        accuracies.append(accuracy_score(y_valid, pred))
    
    return float(np.mean(accuracies))


#%% === PREPROCESSING =========================================================

pre = ColumnTransformer(
    
    transformers=[
        
        # Standardize numeric columns
        # Centers to mean 0 and scales to variance 1 by subtracting mean and 
        # dividing by std for each numerical feature. This is important for 
        # SVMs so all features contribute on the same scale to the margin.
        ("num", StandardScaler(), X_T_num),
        
        # CATEGORICAL BRANCH:
        # One-hot encode categorical columns
        # Converts each category feature into 0/1 indicator columns so SVM 
        # can use non-numeric inputs.
        ("cat", OneHotEncoder(handle_unknown="ignore"), X_T_cat),
        
    ]
    
)


#%% === CROSS-VALIDATION + HYPERPARAMETER SEARCH ==============================

kernel_vec = ["linear", "poly", "rbf"]

# C controls the slack, i.e., margin vs. missclassification trade-off
C_vec = [0.5, 1, 5, 10, 15, 20]

# Polynomial degree (p)
degree_values = [2, 3, 4, 5]

# RBF width, i.e., model flexibility
gamma_vec = [0.01, 0.03, 0.05, "scale"]

# Manual cross-validation (CV)
# Provides train/test indices to split data in train/test sets
#   * shuffle = data is randomly shuffled before splitting
#   * random_state = allows the shuffled data to be repeatable (safety check)
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

# Keep track of the best setting found
best_acc = -1.0
best_kernel = None
best_params = {}

# Finding the best hyperparameters
for kernel in kernel_vec:

    for C in C_vec:
        
        # ------------------
        if kernel == "linear":
            
            model = Pipeline([
                ("pre", pre),
                ("svm", SVC(kernel=kernel, C=C))
            ])
            mean_acc = cv_accuracy(model)
            if mean_acc > best_acc:
                best_acc = mean_acc
                best_kernel = kernel
                best_params = {"C": C}
                
        # ------------------
        elif kernel == "poly":
            
            for degree in degree_values:
                
                model = Pipeline([
                    ("pre", pre),
                    ("svm", SVC(kernel=kernel, C=C, degree=degree))
                ])
                mean_acc = cv_accuracy(model)
                if mean_acc > best_acc:
                    best_acc = mean_acc
                    best_kernel = kernel
                    best_params = {"C": C, "degree": degree}
                    
        # ------------------
        elif kernel == "rbf":
            
            for gamma in gamma_vec:
                
                model = Pipeline([
                    ("pre", pre),
                    ("svm", SVC(kernel=kernel, C=C, gamma=gamma))
                ])
                mean_acc = cv_accuracy(model)
                if mean_acc > best_acc:
                    best_acc = mean_acc
                    best_kernel = kernel
                    best_params = {"C": C, "gamma": gamma}
                    
        # ------------------
        
        else:
            print("INVALID KERNEL!\n")
        
        
print("Best CV accuracy:", best_acc)
print("Best kernel:", best_kernel)
print("Best params:", best_params)

del kernel, C, degree, gamma, model



#%% === TRAIN FINAL MODEL  ====================================================

# Select best pipline settings
final_model = Pipeline([
    ("pre", pre),
    ("svm", SVC(kernel=best_kernel, **best_params))
])

# Fit the model parameters, i.e., train the model
final_model.fit(X_T, y_T)


#%% === PREDICT WITH FINAL MODEL  ====================================================

# Predict evaluation set and write one label per line (submission format)
pred_eval = final_model.predict(data_E)
with open("predicted_labels.txt", "w", encoding="utf-8") as f:
    for label in pred_eval:
        f.write(str(label) + "\n")

print("Wrote predictions to predicted_labels.txt")