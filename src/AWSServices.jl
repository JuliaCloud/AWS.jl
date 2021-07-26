# This file is auto-generated by AWSMetadata.jl

module AWSServices

using AWS
using OrderedCollections: LittleDict

const accessanalyzer = AWS.RestJSONService("access-analyzer", "2019-11-01")
const acm = AWS.JSONService("acm", "2015-12-08", "1.1", "CertificateManager")
const acm_pca = AWS.JSONService("acm-pca", "2017-08-22", "1.1", "ACMPrivateCA")
const alexa_for_business = AWS.JSONService("a4b", "2017-11-09", "1.1", "AlexaForBusiness")
const amp = AWS.RestJSONService("aps", "2020-08-01")
const amplify = AWS.RestJSONService("amplify", "2017-07-25")
const amplifybackend = AWS.RestJSONService("amplifybackend", "2020-08-11")
const api_gateway = AWS.RestJSONService("apigateway", "2015-07-09")
const apigatewaymanagementapi = AWS.RestJSONService("execute-api", "2018-11-29")
const apigatewayv2 = AWS.RestJSONService("apigateway", "2018-11-29")
const app_mesh = AWS.RestJSONService("appmesh", "2019-01-25")
const appconfig = AWS.RestJSONService("appconfig", "2019-10-09")
const appflow = AWS.RestJSONService("appflow", "2020-08-23")
const appintegrations = AWS.RestJSONService("app-integrations", "2020-07-29")
const application_auto_scaling = AWS.JSONService("application-autoscaling", "2016-02-06", "1.1", "AnyScaleFrontendService")
const application_discovery_service = AWS.JSONService("discovery", "2015-11-01", "1.1", "AWSPoseidonService_V2015_11_01")
const application_insights = AWS.JSONService("applicationinsights", "2018-11-25", "1.1", "EC2WindowsBarleyService")
const applicationcostprofiler = AWS.RestJSONService("application-cost-profiler", "2020-09-10")
const apprunner = AWS.JSONService("apprunner", "2020-05-15", "1.0", "AppRunner")
const appstream = AWS.JSONService("appstream", "2016-12-01", "1.1", "PhotonAdminProxyService")
const appsync = AWS.RestJSONService("appsync", "2017-07-25")
const athena = AWS.JSONService("athena", "2017-05-18", "1.1", "AmazonAthena")
const auditmanager = AWS.RestJSONService("auditmanager", "2017-07-25")
const auto_scaling = AWS.QueryService("autoscaling", "2011-01-01")
const auto_scaling_plans = AWS.JSONService("autoscaling-plans", "2018-01-06", "1.1", "AnyScaleScalingPlannerFrontendService")
const backup = AWS.RestJSONService("backup", "2018-11-15")
const batch = AWS.RestJSONService("batch", "2016-08-10")
const braket = AWS.RestJSONService("braket", "2019-09-01")
const budgets = AWS.JSONService("budgets", "2016-10-20", "1.1", "AWSBudgetServiceGateway")
const chime = AWS.RestJSONService("chime", "2018-05-01")
const cloud9 = AWS.JSONService("cloud9", "2017-09-23", "1.1", "AWSCloud9WorkspaceManagementService")
const clouddirectory = AWS.RestJSONService("clouddirectory", "2017-01-11")
const cloudformation = AWS.QueryService("cloudformation", "2010-05-15")
const cloudfront = AWS.RestXMLService("cloudfront", "2020-05-31")
const cloudhsm = AWS.JSONService("cloudhsm", "2014-05-30", "1.1", "CloudHsmFrontendService")
const cloudhsm_v2 = AWS.JSONService("cloudhsm", "2017-04-28", "1.1", "BaldrApiService")
const cloudsearch = AWS.QueryService("cloudsearch", "2013-01-01")
const cloudsearch_domain = AWS.RestJSONService("cloudsearch", "2013-01-01")
const cloudtrail = AWS.JSONService("cloudtrail", "2013-11-01", "1.1", "com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101")
const cloudwatch = AWS.QueryService("monitoring", "2010-08-01")
const cloudwatch_events = AWS.JSONService("events", "2015-10-07", "1.1", "AWSEvents")
const cloudwatch_logs = AWS.JSONService("logs", "2014-03-28", "1.1", "Logs_20140328")
const codeartifact = AWS.RestJSONService("codeartifact", "2018-09-22")
const codebuild = AWS.JSONService("codebuild", "2016-10-06", "1.1", "CodeBuild_20161006")
const codecommit = AWS.JSONService("codecommit", "2015-04-13", "1.1", "CodeCommit_20150413")
const codedeploy = AWS.JSONService("codedeploy", "2014-10-06", "1.1", "CodeDeploy_20141006")
const codeguru_reviewer = AWS.RestJSONService("codeguru-reviewer", "2019-09-19")
const codeguruprofiler = AWS.RestJSONService("codeguru-profiler", "2019-07-18")
const codepipeline = AWS.JSONService("codepipeline", "2015-07-09", "1.1", "CodePipeline_20150709")
const codestar = AWS.JSONService("codestar", "2017-04-19", "1.1", "CodeStar_20170419")
const codestar_connections = AWS.JSONService("codestar-connections", "2019-12-01", "1.0", "com.amazonaws.codestar.connections.CodeStar_connections_20191201")
const codestar_notifications = AWS.RestJSONService("codestar-notifications", "2019-10-15")
const cognito_identity = AWS.JSONService("cognito-identity", "2014-06-30", "1.1", "AWSCognitoIdentityService")
const cognito_identity_provider = AWS.JSONService("cognito-idp", "2016-04-18", "1.1", "AWSCognitoIdentityProviderService")
const cognito_sync = AWS.RestJSONService("cognito-sync", "2014-06-30")
const comprehend = AWS.JSONService("comprehend", "2017-11-27", "1.1", "Comprehend_20171127")
const comprehendmedical = AWS.JSONService("comprehendmedical", "2018-10-30", "1.1", "ComprehendMedical_20181030")
const compute_optimizer = AWS.JSONService("compute-optimizer", "2019-11-01", "1.0", "ComputeOptimizerService")
const config_service = AWS.JSONService("config", "2014-11-12", "1.1", "StarlingDoveService")
const connect = AWS.RestJSONService("connect", "2017-08-08")
const connect_contact_lens = AWS.RestJSONService("connect", "2020-08-21")
const connectparticipant = AWS.RestJSONService("execute-api", "2018-09-07")
const cost_and_usage_report_service = AWS.JSONService("cur", "2017-01-06", "1.1", "AWSOrigamiServiceGatewayService")
const cost_explorer = AWS.JSONService("ce", "2017-10-25", "1.1", "AWSInsightsIndexService")
const customer_profiles = AWS.RestJSONService("profile", "2020-08-15")
const data_pipeline = AWS.JSONService("datapipeline", "2012-10-29", "1.1", "DataPipeline")
const database_migration_service = AWS.JSONService("dms", "2016-01-01", "1.1", "AmazonDMSv20160101")
const databrew = AWS.RestJSONService("databrew", "2017-07-25")
const dataexchange = AWS.RestJSONService("dataexchange", "2017-07-25")
const datasync = AWS.JSONService("datasync", "2018-11-09", "1.1", "FmrsService")
const dax = AWS.JSONService("dax", "2017-04-19", "1.1", "AmazonDAXV3")
const detective = AWS.RestJSONService("detective", "2018-10-26")
const device_farm = AWS.JSONService("devicefarm", "2015-06-23", "1.1", "DeviceFarm_20150623")
const devops_guru = AWS.RestJSONService("devops-guru", "2020-12-01")
const direct_connect = AWS.JSONService("directconnect", "2012-10-25", "1.1", "OvertureService")
const directory_service = AWS.JSONService("ds", "2015-04-16", "1.1", "DirectoryService_20150416")
const dlm = AWS.RestJSONService("dlm", "2018-01-12")
const docdb = AWS.QueryService("rds", "2014-10-31")
const dynamodb = AWS.JSONService("dynamodb", "2012-08-10", "1.0", "DynamoDB_20120810")
const dynamodb_streams = AWS.JSONService("dynamodb", "2012-08-10", "1.0", "DynamoDBStreams_20120810")
const ebs = AWS.RestJSONService("ebs", "2019-11-02")
const ec2 = AWS.QueryService("ec2", "2016-11-15")
const ec2_instance_connect = AWS.JSONService("ec2-instance-connect", "2018-04-02", "1.1", "AWSEC2InstanceConnectService")
const ecr = AWS.JSONService("ecr", "2015-09-21", "1.1", "AmazonEC2ContainerRegistry_V20150921")
const ecr_public = AWS.JSONService("ecr-public", "2020-10-30", "1.1", "SpencerFrontendService")
const ecs = AWS.JSONService("ecs", "2014-11-13", "1.1", "AmazonEC2ContainerServiceV20141113")
const efs = AWS.RestJSONService("elasticfilesystem", "2015-02-01")
const eks = AWS.RestJSONService("eks", "2017-11-01")
const elastic_beanstalk = AWS.QueryService("elasticbeanstalk", "2010-12-01")
const elastic_inference = AWS.RestJSONService("elastic-inference", "2017-07-25")
const elastic_load_balancing = AWS.QueryService("elasticloadbalancing", "2012-06-01")
const elastic_load_balancing_v2 = AWS.QueryService("elasticloadbalancing", "2015-12-01")
const elastic_transcoder = AWS.RestJSONService("elastictranscoder", "2012-09-25")
const elasticache = AWS.QueryService("elasticache", "2015-02-02")
const elasticsearch_service = AWS.RestJSONService("es", "2015-01-01")
const emr = AWS.JSONService("elasticmapreduce", "2009-03-31", "1.1", "ElasticMapReduce")
const emr_containers = AWS.RestJSONService("emr-containers", "2020-10-01")
const eventbridge = AWS.JSONService("events", "2015-10-07", "1.1", "AWSEvents")
const finspace = AWS.RestJSONService("finspace", "2021-03-12")
const finspace_data = AWS.RestJSONService("finspace-api", "2020-07-13")
const firehose = AWS.JSONService("firehose", "2015-08-04", "1.1", "Firehose_20150804")
const fis = AWS.RestJSONService("fis", "2020-12-01")
const fms = AWS.JSONService("fms", "2018-01-01", "1.1", "AWSFMS_20180101")
const forecast = AWS.JSONService("forecast", "2018-06-26", "1.1", "AmazonForecast")
const forecastquery = AWS.JSONService("forecast", "2018-06-26", "1.1", "AmazonForecastRuntime")
const frauddetector = AWS.JSONService("frauddetector", "2019-11-15", "1.1", "AWSHawksNestServiceFacade")
const fsx = AWS.JSONService("fsx", "2018-03-01", "1.1", "AWSSimbaAPIService_v20180301")
const gamelift = AWS.JSONService("gamelift", "2015-10-01", "1.1", "GameLift")
const glacier = AWS.RestJSONService("glacier", "2012-06-01", LittleDict("x-amz-glacier-version" => "2012-06-01"))
const global_accelerator = AWS.JSONService("globalaccelerator", "2018-08-08", "1.1", "GlobalAccelerator_V20180706")
const glue = AWS.JSONService("glue", "2017-03-31", "1.1", "AWSGlue")
const greengrass = AWS.RestJSONService("greengrass", "2017-06-07")
const greengrassv2 = AWS.RestJSONService("greengrass", "2020-11-30")
const groundstation = AWS.RestJSONService("groundstation", "2019-05-23")
const guardduty = AWS.RestJSONService("guardduty", "2017-11-28")
const health = AWS.JSONService("health", "2016-08-04", "1.1", "AWSHealth_20160804")
const healthlake = AWS.JSONService("healthlake", "2017-07-01", "1.0", "HealthLake")
const honeycode = AWS.RestJSONService("honeycode", "2020-03-01")
const iam = AWS.QueryService("iam", "2010-05-08")
const identitystore = AWS.JSONService("identitystore", "2020-06-15", "1.1", "AWSIdentityStore")
const imagebuilder = AWS.RestJSONService("imagebuilder", "2019-12-02")
const importexport = AWS.QueryService("importexport", "2010-06-01")
const inspector = AWS.JSONService("inspector", "2016-02-16", "1.1", "InspectorService")
const iot = AWS.RestJSONService("execute-api", "2015-05-28")
const iot_1click_devices_service = AWS.RestJSONService("iot1click", "2018-05-14")
const iot_1click_projects = AWS.RestJSONService("iot1click", "2018-05-14")
const iot_data_plane = AWS.RestJSONService("iotdata", "2015-05-28")
const iot_events = AWS.RestJSONService("iotevents", "2018-07-27")
const iot_events_data = AWS.RestJSONService("ioteventsdata", "2018-10-23")
const iot_jobs_data_plane = AWS.RestJSONService("iot-jobs-data", "2017-09-29")
const iot_wireless = AWS.RestJSONService("iotwireless", "2020-11-22")
const iotanalytics = AWS.RestJSONService("iotanalytics", "2017-11-27")
const iotdeviceadvisor = AWS.RestJSONService("iotdeviceadvisor", "2020-09-18")
const iotfleethub = AWS.RestJSONService("iotfleethub", "2020-11-03")
const iotsecuretunneling = AWS.JSONService("IoTSecuredTunneling", "2018-10-05", "1.1", "IoTSecuredTunneling")
const iotsitewise = AWS.RestJSONService("iotsitewise", "2019-12-02")
const iotthingsgraph = AWS.JSONService("iotthingsgraph", "2018-09-06", "1.1", "IotThingsGraphFrontEndService")
const ivs = AWS.RestJSONService("ivs", "2020-07-14")
const kafka = AWS.RestJSONService("kafka", "2018-11-14")
const kendra = AWS.JSONService("kendra", "2019-02-03", "1.1", "AWSKendraFrontendService")
const kinesis = AWS.JSONService("kinesis", "2013-12-02", "1.1", "Kinesis_20131202")
const kinesis_analytics = AWS.JSONService("kinesisanalytics", "2015-08-14", "1.1", "KinesisAnalytics_20150814")
const kinesis_analytics_v2 = AWS.JSONService("kinesisanalytics", "2018-05-23", "1.1", "KinesisAnalytics_20180523")
const kinesis_video = AWS.RestJSONService("kinesisvideo", "2017-09-30")
const kinesis_video_archived_media = AWS.RestJSONService("kinesisvideo", "2017-09-30")
const kinesis_video_media = AWS.RestJSONService("kinesisvideo", "2017-09-30")
const kinesis_video_signaling = AWS.RestJSONService("kinesisvideo", "2019-12-04")
const kms = AWS.JSONService("kms", "2014-11-01", "1.1", "TrentService")
const lakeformation = AWS.JSONService("lakeformation", "2017-03-31", "1.1", "AWSLakeFormation")
const lambda = AWS.RestJSONService("lambda", "2015-03-31")
const lex_model_building_service = AWS.RestJSONService("lex", "2017-04-19")
const lex_models_v2 = AWS.RestJSONService("lex", "2020-08-07")
const lex_runtime_service = AWS.RestJSONService("lex", "2016-11-28")
const lex_runtime_v2 = AWS.RestJSONService("lex", "2020-08-07")
const license_manager = AWS.JSONService("license-manager", "2018-08-01", "1.1", "AWSLicenseManager")
const lightsail = AWS.JSONService("lightsail", "2016-11-28", "1.1", "Lightsail_20161128")
const location = AWS.RestJSONService("geo", "2020-11-19")
const lookoutequipment = AWS.JSONService("lookoutequipment", "2020-12-15", "1.0", "AWSLookoutEquipmentFrontendService")
const lookoutmetrics = AWS.RestJSONService("lookoutmetrics", "2017-07-25")
const lookoutvision = AWS.RestJSONService("lookoutvision", "2020-11-20")
const machine_learning = AWS.JSONService("machinelearning", "2014-12-12", "1.1", "AmazonML_20141212")
const macie = AWS.JSONService("macie", "2017-12-19", "1.1", "MacieService")
const macie2 = AWS.RestJSONService("macie2", "2020-01-01")
const managedblockchain = AWS.RestJSONService("managedblockchain", "2018-09-24")
const marketplace_catalog = AWS.RestJSONService("aws-marketplace", "2018-09-17")
const marketplace_commerce_analytics = AWS.JSONService("marketplacecommerceanalytics", "2015-07-01", "1.1", "MarketplaceCommerceAnalytics20150701")
const marketplace_entitlement_service = AWS.JSONService("aws-marketplace", "2017-01-11", "1.1", "AWSMPEntitlementService")
const marketplace_metering = AWS.JSONService("aws-marketplace", "2016-01-14", "1.1", "AWSMPMeteringService")
const mediaconnect = AWS.RestJSONService("mediaconnect", "2018-11-14")
const mediaconvert = AWS.RestJSONService("mediaconvert", "2017-08-29")
const medialive = AWS.RestJSONService("medialive", "2017-10-14")
const mediapackage = AWS.RestJSONService("mediapackage", "2017-10-12")
const mediapackage_vod = AWS.RestJSONService("mediapackage-vod", "2018-11-07")
const mediastore = AWS.JSONService("mediastore", "2017-09-01", "1.1", "MediaStore_20170901")
const mediastore_data = AWS.RestJSONService("mediastore", "2017-09-01")
const mediatailor = AWS.RestJSONService("mediatailor", "2018-04-23")
const mgn = AWS.RestJSONService("mgn", "2020-02-26")
const migration_hub = AWS.JSONService("mgh", "2017-05-31", "1.1", "AWSMigrationHub")
const migrationhub_config = AWS.JSONService("mgh", "2019-06-30", "1.1", "AWSMigrationHubMultiAccountService")
const mobile = AWS.RestJSONService("AWSMobileHubService", "2017-07-01")
const mobile_analytics = AWS.RestJSONService("mobileanalytics", "2014-06-05")
const mq = AWS.RestJSONService("mq", "2017-11-27")
const mturk = AWS.JSONService("mturk-requester", "2017-01-17", "1.1", "MTurkRequesterServiceV20170117")
const mwaa = AWS.RestJSONService("airflow", "2020-07-01")
const neptune = AWS.QueryService("rds", "2014-10-31")
const network_firewall = AWS.JSONService("network-firewall", "2020-11-12", "1.0", "NetworkFirewall_20201112")
const networkmanager = AWS.RestJSONService("networkmanager", "2019-07-05")
const nimble = AWS.RestJSONService("nimble", "2020-08-01")
const opsworks = AWS.JSONService("opsworks", "2013-02-18", "1.1", "OpsWorks_20130218")
const opsworkscm = AWS.JSONService("opsworks-cm", "2016-11-01", "1.1", "OpsWorksCM_V2016_11_01")
const organizations = AWS.JSONService("organizations", "2016-11-28", "1.1", "AWSOrganizationsV20161128")
const outposts = AWS.RestJSONService("outposts", "2019-12-03")
const personalize = AWS.JSONService("personalize", "2018-05-22", "1.1", "AmazonPersonalize")
const personalize_events = AWS.RestJSONService("personalize", "2018-03-22")
const personalize_runtime = AWS.RestJSONService("personalize", "2018-05-22")
const pi = AWS.JSONService("pi", "2018-02-27", "1.1", "PerformanceInsightsv20180227")
const pinpoint = AWS.RestJSONService("mobiletargeting", "2016-12-01")
const pinpoint_email = AWS.RestJSONService("ses", "2018-07-26")
const pinpoint_sms_voice = AWS.RestJSONService("sms-voice", "2018-09-05")
const polly = AWS.RestJSONService("polly", "2016-06-10")
const pricing = AWS.JSONService("pricing", "2017-10-15", "1.1", "AWSPriceListService")
const proton = AWS.JSONService("proton", "2020-07-20", "1.0", "AwsProton20200720")
const qldb = AWS.RestJSONService("qldb", "2019-01-02")
const qldb_session = AWS.JSONService("qldb", "2019-07-11", "1.0", "QLDBSession")
const quicksight = AWS.RestJSONService("quicksight", "2018-04-01")
const ram = AWS.RestJSONService("ram", "2018-01-04")
const rds = AWS.QueryService("rds", "2014-10-31")
const rds_data = AWS.RestJSONService("rds-data", "2018-08-01")
const redshift = AWS.QueryService("redshift", "2012-12-01")
const redshift_data = AWS.JSONService("redshift-data", "2019-12-20", "1.1", "RedshiftData")
const rekognition = AWS.JSONService("rekognition", "2016-06-27", "1.1", "RekognitionService")
const resource_groups = AWS.RestJSONService("resource-groups", "2017-11-27")
const resource_groups_tagging_api = AWS.JSONService("tagging", "2017-01-26", "1.1", "ResourceGroupsTaggingAPI_20170126")
const robomaker = AWS.RestJSONService("robomaker", "2018-06-29")
const route53resolver = AWS.JSONService("route53resolver", "2018-04-01", "1.1", "Route53Resolver")
const route_53 = AWS.RestXMLService("route53", "2013-04-01")
const route_53_domains = AWS.JSONService("route53domains", "2014-05-15", "1.1", "Route53Domains_v20140515")
const s3 = AWS.RestXMLService("s3", "2006-03-01")
const s3_control = AWS.RestXMLService("s3", "2018-08-20")
const s3outposts = AWS.RestJSONService("s3-outposts", "2017-07-25")
const sagemaker = AWS.JSONService("sagemaker", "2017-07-24", "1.1", "SageMaker")
const sagemaker_a2i_runtime = AWS.RestJSONService("sagemaker", "2019-11-07")
const sagemaker_edge = AWS.RestJSONService("sagemaker", "2020-09-23")
const sagemaker_featurestore_runtime = AWS.RestJSONService("sagemaker", "2020-07-01")
const sagemaker_runtime = AWS.RestJSONService("sagemaker", "2017-05-13")
const savingsplans = AWS.RestJSONService("savingsplans", "2019-06-28")
const schemas = AWS.RestJSONService("schemas", "2019-12-02")
const secrets_manager = AWS.JSONService("secretsmanager", "2017-10-17", "1.1", "secretsmanager")
const securityhub = AWS.RestJSONService("securityhub", "2018-10-26")
const serverlessapplicationrepository = AWS.RestJSONService("serverlessrepo", "2017-09-08")
const service_catalog = AWS.JSONService("servicecatalog", "2015-12-10", "1.1", "AWS242ServiceCatalogService")
const service_catalog_appregistry = AWS.RestJSONService("servicecatalog", "2020-06-24")
const service_quotas = AWS.JSONService("servicequotas", "2019-06-24", "1.1", "ServiceQuotasV20190624")
const servicediscovery = AWS.JSONService("servicediscovery", "2017-03-14", "1.1", "Route53AutoNaming_v20170314")
const ses = AWS.QueryService("ses", "2010-12-01")
const sesv2 = AWS.RestJSONService("email", "2019-09-27")
const sfn = AWS.JSONService("states", "2016-11-23", "1.0", "AWSStepFunctions")
const shield = AWS.JSONService("shield", "2016-06-02", "1.1", "AWSShield_20160616")
const signer = AWS.RestJSONService("signer", "2017-08-25")
const simpledb = AWS.QueryService("sdb", "2009-04-15")
const sms = AWS.JSONService("sms", "2016-10-24", "1.1", "AWSServerMigrationService_V2016_10_24")
const snowball = AWS.JSONService("snowball", "2016-06-30", "1.1", "AWSIESnowballJobManagementService")
const sns = AWS.QueryService("sns", "2010-03-31")
const sqs = AWS.QueryService("sqs", "2012-11-05")
const ssm = AWS.JSONService("ssm", "2014-11-06", "1.1", "AmazonSSM")
const ssm_contacts = AWS.JSONService("ssm-contacts", "2021-05-03", "1.1", "SSMContacts")
const ssm_incidents = AWS.RestJSONService("ssm-incidents", "2018-05-10")
const sso = AWS.RestJSONService("awsssoportal", "2019-06-10")
const sso_admin = AWS.JSONService("sso", "2020-07-20", "1.1", "SWBExternalService")
const sso_oidc = AWS.RestJSONService("awsssooidc", "2019-06-10")
const storage_gateway = AWS.JSONService("storagegateway", "2013-06-30", "1.1", "StorageGateway_20130630")
const sts = AWS.QueryService("sts", "2011-06-15")
const support = AWS.JSONService("support", "2013-04-15", "1.1", "AWSSupport_20130415")
const swf = AWS.JSONService("swf", "2012-01-25", "1.0", "SimpleWorkflowService")
const synthetics = AWS.RestJSONService("synthetics", "2017-10-11")
const textract = AWS.JSONService("textract", "2018-06-27", "1.1", "Textract")
const timestream_query = AWS.JSONService("timestream", "2018-11-01", "1.0", "Timestream_20181101")
const timestream_write = AWS.JSONService("timestream", "2018-11-01", "1.0", "Timestream_20181101")
const transcribe = AWS.JSONService("transcribe", "2017-10-26", "1.1", "Transcribe")
const transfer = AWS.JSONService("transfer", "2018-11-05", "1.1", "TransferService")
const translate = AWS.JSONService("translate", "2017-07-01", "1.1", "AWSShineFrontendService_20170701")
const waf = AWS.JSONService("waf", "2015-08-24", "1.1", "AWSWAF_20150824")
const waf_regional = AWS.JSONService("waf-regional", "2016-11-28", "1.1", "AWSWAF_Regional_20161128")
const wafv2 = AWS.JSONService("wafv2", "2019-07-29", "1.1", "AWSWAF_20190729")
const wellarchitected = AWS.RestJSONService("wellarchitected", "2020-03-31")
const workdocs = AWS.RestJSONService("workdocs", "2016-05-01")
const worklink = AWS.RestJSONService("worklink", "2018-09-25")
const workmail = AWS.JSONService("workmail", "2017-10-01", "1.1", "WorkMailService")
const workmailmessageflow = AWS.RestJSONService("workmailmessageflow", "2019-05-01")
const workspaces = AWS.JSONService("workspaces", "2015-04-08", "1.1", "WorkspacesService")
const xray = AWS.RestJSONService("xray", "2016-04-12")

end
