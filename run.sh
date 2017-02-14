set +e
response=`curl -sSL -d "project_id=$FLOW_PROJECT_ID" $FLOW_QINIU_UPLOAD_URL`
token=$(echo $response | jq .token)
key=$(echo $response | jq .key)
upload_url=$(echo $response | jq .upload_url)
download_url=$(echo $response | jq .download_url | sed 's/\"//g')
token=$(echo $token | sed 's/\"//g')
upload_url=$(echo $upload_url | sed 's/\"//g')
key=$(echo $key | sed 's/\"//g')
echo $token
echo $upload_url
curl -sSL https://github.com/FIRHQ/flow_format_render_rubocop/archive/master.zip > /tmp/rubocop_details.zip
cd /tmp
unzip rubocop_details.zip > /dev/null
cd flow_format_render_rubocop-master
npm install
node bin/render.js

file_path="./dist/index.html"
curl -# -F file=@${file_path} -F "key=$key" -F "token=$token" $upload_url
FLOW_RUBOCOP_RENDER_URL=$download_url
echo "details: $FLOW_RUBOCOP_RENDER_URL"
