# Replace the keys below with your own.
api_key=cGy4vxWFNofolvOzNDuEAIJZNKQyXXXXXX
app_key=H2CCg5YhpUPKQsc20hUmoAEc2mwXXXXXX

# Create the Datadog/AWS integration and store the result.
RESULT=$(curl -X POST -H "Content-type: application/json" \
-d '{
      "account_id": "${AWS_ACCOUNT_ID}",
      "filter_tags": ["env:staging"],
      "host_tags": ["account:new-team"],
      "role_name": "DatadogAWSIntegrationRole",
      "account_specific_namespace_rules": {
        "auto_scaling": false,
        "lambda": false
      }
   }' \
"https://app.datadoghq.com/api/v1/integration/aws?api_key=${api_key}&application_key=${app_key}")
