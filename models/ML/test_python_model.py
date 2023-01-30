import numpy as np
import pandas as pd
# import matplotlib.pyplot as plt
# import seaborn as sns

# from datetime import datetime, date
# from dateutil.relativedelta import relativedelta

# from sklearn.preprocessing import StandardScaler

# from math import ceil

# from keras.callbacks import LambdaCallback
# from keras.models import Sequential
# from keras.layers import Dense, Activation
# from keras.layers import LSTM
# from keras.optimizers import RMSprop

def model(dbt,session):
    dbt.config(
        submission_method="cluster",
        dataproc_cluster_name="my-favorite-cluster",
        dataproc_region = "EU",
        materialized="table",
        packages = ["pandas","numpy"]
    )
    df = pd.DataFrame(columns = ['X','Y'])

    return df