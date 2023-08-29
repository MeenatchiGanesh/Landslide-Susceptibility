# -*- coding: utf-8 -*-
"""
Created on Mon Nov 14 23:27:37 2022

@author: Mano
"""

import pandas as pd
from matplotlib import pyplot as plt
import numpy as np

df = pd.read_csv("test1.csv")
#print(df.head())

#drop_irrelevant_columns
df.drop(['FID'],axis=1,inplace=True)
df.drop(['OBJECTID'],axis=1,inplace=True)

#define dependent variable
Y = df['outcome'].values

#define independant variables
X = df.drop(labels=['outcome'], axis=1)
print(X)

 #split data into training and testing set
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X,Y, test_size = 0.3, random_state=20)

print(X_train)
print(X_test)

from sklearn.ensemble import RandomForestClassifier

model = RandomForestClassifier(n_estimators = 100, random_state = 30)

model.fit(X_train, Y_train)

prediction_test = model.predict(X_test)
print(prediction_test)

from sklearn import metrics
print("Accuracy = ", metrics.accuracy_score(Y_test, prediction_test))
                            
  