include("../AWSServices.jl")
using .AWSServices: forecast

"""
    CreateDatasetImportJob()

Imports your training data to an Amazon Forecast dataset. You provide the location of your training data in an Amazon Simple Storage Service (Amazon S3) bucket and the Amazon Resource Name (ARN) of the dataset that you want to import the data to. You must specify a DataSource object that includes an AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the data. For more information, see aws-forecast-iam-roles. The training data must be in CSV format. The delimiter must be a comma (,). You can specify the path to a specific CSV file, the S3 bucket, or to a folder in the S3 bucket. For the latter two cases, Amazon Forecast imports all files up to the limit of 10,000 files. To get a list of all your dataset import jobs, filtered by specified criteria, use the ListDatasetImportJobs operation.

Required Parameters
{
  "DatasetArn": "The Amazon Resource Name (ARN) of the Amazon Forecast dataset that you want to import data to.",
  "DatasetImportJobName": "The name for the dataset import job. We recommend including the current timestamp in the name, for example, 20190721DatasetImport. This can help you avoid getting a ResourceAlreadyExistsException exception.",
  "DataSource": "The location of the training data to import and an AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the data. The training data must be stored in an Amazon S3 bucket. If encryption is used, DataSource must include an AWS Key Management Service (KMS) key and the IAM role must allow Amazon Forecast permission to access the key. The KMS key and IAM role must match those specified in the EncryptionConfig parameter of the CreateDataset operation."
}

Optional Parameters
{
  "TimestampFormat": "The format of timestamps in the dataset. The format that you specify depends on the DataFrequency specified when the dataset was created. The following formats are supported   \"yyyy-MM-dd\" For the following data frequencies: Y, M, W, and D   \"yyyy-MM-dd HH:mm:ss\" For the following data frequencies: H, 30min, 15min, and 1min; and optionally, for: Y, M, W, and D   If the format isn't specified, Amazon Forecast expects the format to be \"yyyy-MM-dd HH:mm:ss\"."
}
"""
CreateDatasetImportJob(args) = forecast("CreateDatasetImportJob", args)

"""
    DescribeDataset()

Describes an Amazon Forecast dataset created using the CreateDataset operation. In addition to listing the parameters specified in the CreateDataset request, this operation includes the following dataset properties:    CreationTime     LastModificationTime     Status   

Required Parameters
{
  "DatasetArn": "The Amazon Resource Name (ARN) of the dataset."
}
"""
DescribeDataset(args) = forecast("DescribeDataset", args)

"""
    DescribePredictor()

Describes a predictor created using the CreatePredictor operation. In addition to listing the properties provided in the CreatePredictor request, this operation lists the following properties:    DatasetImportJobArns - The dataset import jobs used to import training data.    AutoMLAlgorithmArns - If AutoML is performed, the algorithms that were evaluated.    CreationTime     LastModificationTime     Status     Message - If an error occurred, information about the error.  

Required Parameters
{
  "PredictorArn": "The Amazon Resource Name (ARN) of the predictor that you want information about."
}
"""
DescribePredictor(args) = forecast("DescribePredictor", args)

"""
    DeleteForecast()

Deletes a forecast created using the CreateForecast operation. You can delete only forecasts that have a status of ACTIVE or CREATE_FAILED. To get the status, use the DescribeForecast operation. You can't delete a forecast while it is being exported. After a forecast is deleted, you can no longer query the forecast.

Required Parameters
{
  "ForecastArn": "The Amazon Resource Name (ARN) of the forecast to delete."
}
"""
DeleteForecast(args) = forecast("DeleteForecast", args)

"""
    DeleteForecastExportJob()

Deletes a forecast export job created using the CreateForecastExportJob operation. You can delete only export jobs that have a status of ACTIVE or CREATE_FAILED. To get the status, use the DescribeForecastExportJob operation.

Required Parameters
{
  "ForecastExportJobArn": "The Amazon Resource Name (ARN) of the forecast export job to delete."
}
"""
DeleteForecastExportJob(args) = forecast("DeleteForecastExportJob", args)

"""
    CreateDatasetGroup()

Creates a dataset group, which holds a collection of related datasets. You can add datasets to the dataset group when you create the dataset group, or later by using the UpdateDatasetGroup operation. After creating a dataset group and adding datasets, you use the dataset group when you create a predictor. For more information, see howitworks-datasets-groups. To get a list of all your datasets groups, use the ListDatasetGroups operation.  The Status of a dataset group must be ACTIVE before you can create use the dataset group to create a predictor. To get the status, use the DescribeDatasetGroup operation. 

Required Parameters
{
  "DatasetGroupName": "A name for the dataset group.",
  "Domain": "The domain associated with the dataset group. When you add a dataset to a dataset group, this value and the value specified for the Domain parameter of the CreateDataset operation must match. The Domain and DatasetType that you choose determine the fields that must be present in training data that you import to a dataset. For example, if you choose the RETAIL domain and TARGET_TIME_SERIES as the DatasetType, Amazon Forecast requires that item_id, timestamp, and demand fields are present in your data. For more information, see howitworks-datasets-groups."
}

Optional Parameters
{
  "DatasetArns": "An array of Amazon Resource Names (ARNs) of the datasets that you want to include in the dataset group."
}
"""
CreateDatasetGroup(args) = forecast("CreateDatasetGroup", args)

"""
    DeletePredictor()

Deletes a predictor created using the CreatePredictor operation. You can delete only predictor that have a status of ACTIVE or CREATE_FAILED. To get the status, use the DescribePredictor operation.

Required Parameters
{
  "PredictorArn": "The Amazon Resource Name (ARN) of the predictor to delete."
}
"""
DeletePredictor(args) = forecast("DeletePredictor", args)

"""
    ListDatasetImportJobs()

Returns a list of dataset import jobs created using the CreateDatasetImportJob operation. For each import job, this operation returns a summary of its properties, including its Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the ARN with the DescribeDatasetImportJob operation. You can filter the list by providing an array of Filter objects.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours.",
  "Filters": "An array of filters. For each filter, you provide a condition and a match statement. The condition is either IS or IS_NOT, which specifies whether to include or exclude the datasets that match the statement from the list, respectively. The match statement consists of a key and a value.  Filter properties     Condition - The condition to apply. Valid values are IS and IS_NOT. To include the datasets that match the statement, specify IS. To exclude matching datasets, specify IS_NOT.    Key - The name of the parameter to filter on. Valid values are DatasetArn and Status.    Value - The value to match.   For example, to list all dataset import jobs whose status is ACTIVE, you specify the following filter:  \"Filters\": [ { \"Condition\": \"IS\", \"Key\": \"Status\", \"Value\": \"ACTIVE\" } ] "
}
"""
ListDatasetImportJobs() = forecast("ListDatasetImportJobs")
ListDatasetImportJobs(args) = forecast("ListDatasetImportJobs", args)

"""
    ListPredictors()

Returns a list of predictors created using the CreatePredictor operation. For each predictor, this operation returns a summary of its properties, including its Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the ARN with the DescribePredictor operation. You can filter the list using an array of Filter objects.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours.",
  "Filters": "An array of filters. For each filter, you provide a condition and a match statement. The condition is either IS or IS_NOT, which specifies whether to include or exclude the predictors that match the statement from the list, respectively. The match statement consists of a key and a value.  Filter properties     Condition - The condition to apply. Valid values are IS and IS_NOT. To include the predictors that match the statement, specify IS. To exclude matching predictors, specify IS_NOT.    Key - The name of the parameter to filter on. Valid values are DatasetGroupArn and Status.    Value - The value to match.   For example, to list all predictors whose status is ACTIVE, you would specify:  \"Filters\": [ { \"Condition\": \"IS\", \"Key\": \"Status\", \"Value\": \"ACTIVE\" } ] "
}
"""
ListPredictors() = forecast("ListPredictors")
ListPredictors(args) = forecast("ListPredictors", args)

"""
    ListForecastExportJobs()

Returns a list of forecast export jobs created using the CreateForecastExportJob operation. For each forecast export job, this operation returns a summary of its properties, including its Amazon Resource Name (ARN). To retrieve the complete set of properties, use the ARN with the DescribeForecastExportJob operation. You can filter the list using an array of Filter objects.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours.",
  "Filters": "An array of filters. For each filter, you provide a condition and a match statement. The condition is either IS or IS_NOT, which specifies whether to include or exclude the forecast export jobs that match the statement from the list, respectively. The match statement consists of a key and a value.  Filter properties     Condition - The condition to apply. Valid values are IS and IS_NOT. To include the forecast export jobs that match the statement, specify IS. To exclude matching forecast export jobs, specify IS_NOT.    Key - The name of the parameter to filter on. Valid values are ForecastArn and Status.    Value - The value to match.   For example, to list all jobs that export a forecast named electricityforecast, specify the following filter:  \"Filters\": [ { \"Condition\": \"IS\", \"Key\": \"ForecastArn\", \"Value\": \"arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityforecast\" } ] "
}
"""
ListForecastExportJobs() = forecast("ListForecastExportJobs")
ListForecastExportJobs(args) = forecast("ListForecastExportJobs", args)

"""
    CreateForecastExportJob()

Exports a forecast created by the CreateForecast operation to your Amazon Simple Storage Service (Amazon S3) bucket. The forecast file name will match the following conventions: &lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PageNumber&gt; where the &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat (yyyy-MM-ddTHH-mm-ssZ). You must specify a DataDestination object that includes an AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the Amazon S3 bucket. For more information, see aws-forecast-iam-roles. For more information, see howitworks-forecast. To get a list of all your forecast export jobs, use the ListForecastExportJobs operation.  The Status of the forecast export job must be ACTIVE before you can access the forecast in your Amazon S3 bucket. To get the status, use the DescribeForecastExportJob operation. 

Required Parameters
{
  "ForecastArn": "The Amazon Resource Name (ARN) of the forecast that you want to export.",
  "Destination": "The location where you want to save the forecast and an AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the location. The forecast must be exported to an Amazon S3 bucket. If encryption is used, Destination must include an AWS Key Management Service (KMS) key. The IAM role must allow Amazon Forecast permission to access the key.",
  "ForecastExportJobName": "The name for the forecast export job."
}
"""
CreateForecastExportJob(args) = forecast("CreateForecastExportJob", args)

"""
    DeleteDatasetImportJob()

Deletes a dataset import job created using the CreateDatasetImportJob operation. You can delete only dataset import jobs that have a status of ACTIVE or CREATE_FAILED. To get the status, use the DescribeDatasetImportJob operation.

Required Parameters
{
  "DatasetImportJobArn": "The Amazon Resource Name (ARN) of the dataset import job to delete."
}
"""
DeleteDatasetImportJob(args) = forecast("DeleteDatasetImportJob", args)

"""
    DescribeForecast()

Describes a forecast created using the CreateForecast operation. In addition to listing the properties provided in the CreateForecast request, this operation lists the following properties:    DatasetGroupArn - The dataset group that provided the training data.    CreationTime     LastModificationTime     Status     Message - If an error occurred, information about the error.  

Required Parameters
{
  "ForecastArn": "The Amazon Resource Name (ARN) of the forecast."
}
"""
DescribeForecast(args) = forecast("DescribeForecast", args)

"""
    ListDatasets()

Returns a list of datasets created using the CreateDataset operation. For each dataset, a summary of its properties, including its Amazon Resource Name (ARN), is returned. To retrieve the complete set of properties, use the ARN with the DescribeDataset operation.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours."
}
"""
ListDatasets() = forecast("ListDatasets")
ListDatasets(args) = forecast("ListDatasets", args)

"""
    CreatePredictor()

Creates an Amazon Forecast predictor. In the request, you provide a dataset group and either specify an algorithm or let Amazon Forecast choose the algorithm for you using AutoML. If you specify an algorithm, you also can override algorithm-specific hyperparameters. Amazon Forecast uses the chosen algorithm to train a model using the latest version of the datasets in the specified dataset group. The result is called a predictor. You then generate a forecast using the CreateForecast operation. After training a model, the CreatePredictor operation also evaluates it. To see the evaluation metrics, use the GetAccuracyMetrics operation. Always review the evaluation metrics before deciding to use the predictor to generate a forecast. Optionally, you can specify a featurization configuration to fill and aggregate the data fields in the TARGET_TIME_SERIES dataset to improve model training. For more information, see FeaturizationConfig. For RELATED_TIME_SERIES datasets, CreatePredictor verifies that the DataFrequency specified when the dataset was created matches the ForecastFrequency. TARGET_TIME_SERIES datasets don't have this restriction. Amazon Forecast also verifies the delimiter and timestamp format. For more information, see howitworks-datasets-groups.  AutoML  If you want Amazon Forecast to evaluate each algorithm and choose the one that minimizes the objective function, set PerformAutoML to true. The objective function is defined as the mean of the weighted p10, p50, and p90 quantile losses. For more information, see EvaluationResult. When AutoML is enabled, the following properties are disallowed:    AlgorithmArn     HPOConfig     PerformHPO     TrainingParameters    To get a list of all of your predictors, use the ListPredictors operation.  Before you can use the predictor to create a forecast, the Status of the predictor must be ACTIVE, signifying that training has completed. To get the status, use the DescribePredictor operation. 

Required Parameters
{
  "InputDataConfig": "Describes the dataset group that contains the data to use to train the predictor.",
  "ForecastHorizon": "Specifies the number of time-steps that the model is trained to predict. The forecast horizon is also called the prediction length. For example, if you configure a dataset for daily data collection (using the DataFrequency parameter of the CreateDataset operation) and set the forecast horizon to 10, the model returns predictions for 10 days. The maximum forecast horizon is the lesser of 500 time-steps or 1/3 of the TARGET_TIME_SERIES dataset length.",
  "PredictorName": "A name for the predictor.",
  "FeaturizationConfig": "The featurization configuration."
}

Optional Parameters
{
  "AlgorithmArn": "The Amazon Resource Name (ARN) of the algorithm to use for model training. Required if PerformAutoML is not set to true.  Supported algorithms:     arn:aws:forecast:::algorithm/ARIMA     arn:aws:forecast:::algorithm/Deep_AR_Plus  Supports hyperparameter optimization (HPO)    arn:aws:forecast:::algorithm/ETS     arn:aws:forecast:::algorithm/NPTS     arn:aws:forecast:::algorithm/Prophet   ",
  "TrainingParameters": "The hyperparameters to override for model training. The hyperparameters that you can override are listed in the individual algorithms. For the list of supported algorithms, see aws-forecast-choosing-recipes.",
  "HPOConfig": "Provides hyperparameter override values for the algorithm. If you don't provide this parameter, Amazon Forecast uses default values. The individual algorithms specify which hyperparameters support hyperparameter optimization (HPO). For more information, see aws-forecast-choosing-recipes. If you included the HPOConfig object, you must set PerformHPO to true.",
  "EncryptionConfig": "An AWS Key Management Service (KMS) key and the AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the key.",
  "EvaluationParameters": "Used to override the default evaluation parameters of the specified algorithm. Amazon Forecast evaluates a predictor by splitting a dataset into training data and testing data. The evaluation parameters define how to perform the split and the number of iterations.",
  "PerformAutoML": "Whether to perform AutoML. When Amazon Forecast performs AutoML, it evaluates the algorithms it provides and chooses the best algorithm and configuration for your training dataset. The default value is false. In this case, you are required to specify an algorithm. Set PerformAutoML to true to have Amazon Forecast perform AutoML. This is a good option if you aren't sure which algorithm is suitable for your training data. In this case, PerformHPO must be false.",
  "PerformHPO": "Whether to perform hyperparameter optimization (HPO). HPO finds optimal hyperparameter values for your training data. The process of performing HPO is known as running a hyperparameter tuning job. The default value is false. In this case, Amazon Forecast uses default hyperparameter values from the chosen algorithm. To override the default values, set PerformHPO to true and, optionally, supply the HyperParameterTuningJobConfig object. The tuning job specifies a metric to optimize, which hyperparameters participate in tuning, and the valid range for each tunable hyperparameter. In this case, you are required to specify an algorithm and PerformAutoML must be false. The following algorithm supports HPO:   DeepAR+  "
}
"""
CreatePredictor(args) = forecast("CreatePredictor", args)

"""
    DeleteDatasetGroup()

Deletes a dataset group created using the CreateDatasetGroup operation. You can only delete dataset groups that have a status of ACTIVE, CREATE_FAILED, or UPDATE_FAILED. To get the status, use the DescribeDatasetGroup operation. This operation deletes only the dataset group, not the datasets in the group.

Required Parameters
{
  "DatasetGroupArn": "The Amazon Resource Name (ARN) of the dataset group to delete."
}
"""
DeleteDatasetGroup(args) = forecast("DeleteDatasetGroup", args)

"""
    DeleteDataset()

Deletes an Amazon Forecast dataset that was created using the CreateDataset operation. You can only delete datasets that have a status of ACTIVE or CREATE_FAILED. To get the status use the DescribeDataset operation.

Required Parameters
{
  "DatasetArn": "The Amazon Resource Name (ARN) of the dataset to delete."
}
"""
DeleteDataset(args) = forecast("DeleteDataset", args)

"""
    ListForecasts()

Returns a list of forecasts created using the CreateForecast operation. For each forecast, this operation returns a summary of its properties, including its Amazon Resource Name (ARN). To retrieve the complete set of properties, specify the ARN with the DescribeForecast operation. You can filter the list using an array of Filter objects.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours.",
  "Filters": "An array of filters. For each filter, you provide a condition and a match statement. The condition is either IS or IS_NOT, which specifies whether to include or exclude the forecasts that match the statement from the list, respectively. The match statement consists of a key and a value.  Filter properties     Condition - The condition to apply. Valid values are IS and IS_NOT. To include the forecasts that match the statement, specify IS. To exclude matching forecasts, specify IS_NOT.    Key - The name of the parameter to filter on. Valid values are DatasetGroupArn, PredictorArn, and Status.    Value - The value to match.   For example, to list all forecasts whose status is not ACTIVE, you would specify:  \"Filters\": [ { \"Condition\": \"IS_NOT\", \"Key\": \"Status\", \"Value\": \"ACTIVE\" } ] "
}
"""
ListForecasts() = forecast("ListForecasts")
ListForecasts(args) = forecast("ListForecasts", args)

"""
    UpdateDatasetGroup()

Replaces the datasets in a dataset group with the specified datasets.  The Status of the dataset group must be ACTIVE before you can use the dataset group to create a predictor. Use the DescribeDatasetGroup operation to get the status. 

Required Parameters
{
  "DatasetGroupArn": "The ARN of the dataset group.",
  "DatasetArns": "An array of the Amazon Resource Names (ARNs) of the datasets to add to the dataset group."
}
"""
UpdateDatasetGroup(args) = forecast("UpdateDatasetGroup", args)

"""
    DescribeForecastExportJob()

Describes a forecast export job created using the CreateForecastExportJob operation. In addition to listing the properties provided by the user in the CreateForecastExportJob request, this operation lists the following properties:    CreationTime     LastModificationTime     Status     Message - If an error occurred, information about the error.  

Required Parameters
{
  "ForecastExportJobArn": "The Amazon Resource Name (ARN) of the forecast export job."
}
"""
DescribeForecastExportJob(args) = forecast("DescribeForecastExportJob", args)

"""
    DescribeDatasetImportJob()

Describes a dataset import job created using the CreateDatasetImportJob operation. In addition to listing the parameters provided in the CreateDatasetImportJob request, this operation includes the following properties:    CreationTime     LastModificationTime     DataSize     FieldStatistics     Status     Message - If an error occurred, information about the error.  

Required Parameters
{
  "DatasetImportJobArn": "The Amazon Resource Name (ARN) of the dataset import job."
}
"""
DescribeDatasetImportJob(args) = forecast("DescribeDatasetImportJob", args)

"""
    ListDatasetGroups()

Returns a list of dataset groups created using the CreateDatasetGroup operation. For each dataset group, this operation returns a summary of its properties, including its Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the dataset group ARN with the DescribeDatasetGroup operation.

Optional Parameters
{
  "MaxResults": "The number of items to return in the response.",
  "NextToken": "If the result of the previous request was truncated, the response includes a NextToken. To retrieve the next set of results, use the token in the next request. Tokens expire after 24 hours."
}
"""
ListDatasetGroups() = forecast("ListDatasetGroups")
ListDatasetGroups(args) = forecast("ListDatasetGroups", args)

"""
    DescribeDatasetGroup()

Describes a dataset group created using the CreateDatasetGroup operation. In addition to listing the parameters provided in the CreateDatasetGroup request, this operation includes the following properties:    DatasetArns - The datasets belonging to the group.    CreationTime     LastModificationTime     Status   

Required Parameters
{
  "DatasetGroupArn": "The Amazon Resource Name (ARN) of the dataset group."
}
"""
DescribeDatasetGroup(args) = forecast("DescribeDatasetGroup", args)

"""
    CreateForecast()

Creates a forecast for each item in the TARGET_TIME_SERIES dataset that was used to train the predictor. This is known as inference. To retrieve the forecast for a single item at low latency, use the operation. To export the complete forecast into your Amazon Simple Storage Service (Amazon S3) bucket, use the CreateForecastExportJob operation. The range of the forecast is determined by the ForecastHorizon value, which you specify in the CreatePredictor request, multiplied by the DataFrequency value, which you specify in the CreateDataset request. When you query a forecast, you can request a specific date range within the forecast. To get a list of all your forecasts, use the ListForecasts operation.  The forecasts generated by Amazon Forecast are in the same time zone as the dataset that was used to create the predictor.  For more information, see howitworks-forecast.  The Status of the forecast must be ACTIVE before you can query or export the forecast. Use the DescribeForecast operation to get the status. 

Required Parameters
{
  "ForecastName": "A name for the forecast.",
  "PredictorArn": "The Amazon Resource Name (ARN) of the predictor to use to generate the forecast."
}

Optional Parameters
{
  "ForecastTypes": "The quantiles at which probabilistic forecasts are generated. You can specify up to 5 quantiles per forecast. Accepted values include 0.01 to 0.99 (increments of .01 only) and mean. The mean forecast is different from the median (0.50) when the distribution is not symmetric (e.g. Beta, Negative Binomial). The default value is [\"0.1\", \"0.5\", \"0.9\"]."
}
"""
CreateForecast(args) = forecast("CreateForecast", args)

"""
    CreateDataset()

Creates an Amazon Forecast dataset. The information about the dataset that you provide helps Forecast understand how to consume the data for model training. This includes the following:     DataFrequency  - How frequently your historical time-series data is collected.     Domain  and  DatasetType  - Each dataset has an associated dataset domain and a type within the domain. Amazon Forecast provides a list of predefined domains and types within each domain. For each unique dataset domain and type within the domain, Amazon Forecast requires your data to include a minimum set of predefined fields.     Schema  - A schema specifies the fields in the dataset, including the field name and data type.   After creating a dataset, you import your training data into it and add the dataset to a dataset group. You use the dataset group to create a predictor. For more information, see howitworks-datasets-groups. To get a list of all your datasets, use the ListDatasets operation. For example Forecast datasets, see the Amazon Forecast Sample GitHub repository.  The Status of a dataset must be ACTIVE before you can import training data. Use the DescribeDataset operation to get the status. 

Required Parameters
{
  "Schema": "The schema for the dataset. The schema attributes and their order must match the fields in your data. The dataset Domain and DatasetType that you choose determine the minimum required fields in your training data. For information about the required fields for a specific dataset domain and type, see howitworks-domains-ds-types.",
  "DatasetName": "A name for the dataset.",
  "Domain": "The domain associated with the dataset. When you add a dataset to a dataset group, this value and the value specified for the Domain parameter of the CreateDatasetGroup operation must match. The Domain and DatasetType that you choose determine the fields that must be present in the training data that you import to the dataset. For example, if you choose the RETAIL domain and TARGET_TIME_SERIES as the DatasetType, Amazon Forecast requires item_id, timestamp, and demand fields to be present in your data. For more information, see howitworks-datasets-groups.",
  "DatasetType": "The dataset type. Valid values depend on the chosen Domain."
}

Optional Parameters
{
  "EncryptionConfig": "An AWS Key Management Service (KMS) key and the AWS Identity and Access Management (IAM) role that Amazon Forecast can assume to access the key.",
  "DataFrequency": "The frequency of data collection. This parameter is required for RELATED_TIME_SERIES datasets. Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and 1min (1 minute). For example, \"D\" indicates every day and \"15min\" indicates every 15 minutes."
}
"""
CreateDataset(args) = forecast("CreateDataset", args)

"""
    GetAccuracyMetrics()

Provides metrics on the accuracy of the models that were trained by the CreatePredictor operation. Use metrics to see how well the model performed and to decide whether to use the predictor to generate a forecast. For more information, see metrics. This operation generates metrics for each backtest window that was evaluated. The number of backtest windows (NumberOfBacktestWindows) is specified using the EvaluationParameters object, which is optionally included in the CreatePredictor request. If NumberOfBacktestWindows isn't specified, the number defaults to one. The parameters of the filling method determine which items contribute to the metrics. If you want all items to contribute, specify zero. If you want only those items that have complete data in the range being evaluated to contribute, specify nan. For more information, see FeaturizationMethod.  Before you can get accuracy metrics, the Status of the predictor must be ACTIVE, signifying that training has completed. To get the status, use the DescribePredictor operation. 

Required Parameters
{
  "PredictorArn": "The Amazon Resource Name (ARN) of the predictor to get metrics for."
}
"""
GetAccuracyMetrics(args) = forecast("GetAccuracyMetrics", args)
