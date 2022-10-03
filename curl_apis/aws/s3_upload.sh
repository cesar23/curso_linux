#Date: 21/7/2017
#Author: Mohan
#Purpose: To upload files to AWS S3 via Curl
#Uploads file at the top level folder by default


#S3 parameters
S3KEY="AKIATVYF7BF4T2AHLJML"
S3SECRET="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"
S3BUCKET="canvas-upload-files"
S3STORAGETYPE="STANDARD" #REDUCED_REDUNDANCY or STANDARD etc.
#AWSREGION="s3-us-west-1"
AWSREGION="s3-us-west-1"

function putS3
{

  file_path=$1
  aws_path=$2
  bucket="${S3BUCKET}"
  date=$(date -R)
  acl="x-amz-acl:private"
  content_type="application/x-compressed-tar"
  storage_type="x-amz-storage-class:${S3STORAGETYPE}"
  string="PUT\n\n$content_type\n$date\n$acl\n$storage_type\n/$bucket$aws_path${file_path##/*/}"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "${S3SECRET}" -binary | base64)
  curl -s --retry 3 --retry-delay 10 -X PUT -T "$file_path" \
       -H "Host: $bucket.${AWSREGION}.amazonaws.com" \
       -H "Date: $date" \
       -H "Content-Type: $content_type" \
       -H "$storage_type" \
       -H "$acl" \
       -H "Authorization: AWS ${S3KEY}:$signature" \
       "https://$bucket.${AWSREGION}.amazonaws.com$aws_path${file_path##/*/}"
}

function usage
{
  echo "Usage: $0 <absolutepath_to_file> <s3_folder_path>"
  echo "$0 "${HOME}/sampleArchive.tar" '/' "
#  tar -cvf "${HOME}/sampleArchive.tar" "${HOME}/Result_14.csv"
}

#validate positional parameters are present
if [ $# -ne 2 ]; then
  usage
  echo "Exiting .."
  exit 2
fi

putS3 $1 $2
