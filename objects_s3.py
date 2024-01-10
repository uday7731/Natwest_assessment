import boto3

# Create an S3 client
s3 = boto3.client('s3')

# Specify the bucket name
bucket_name = 'natwestassessment'

# Get the total number of objects in the bucket
response = s3.list_objects_v2(Bucket=bucket_name)
total_objects = response['KeyCount']

print(f"Total number of objects in '{bucket_name}': {total_objects}")
