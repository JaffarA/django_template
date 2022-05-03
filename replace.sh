#!/bin/bash

valid=0
PROJECT_NAME=$1
PROJECT_DESCRIPTION="${@:2}"

for i in $PROJECT_NAME $PROJECT_DESCRIPTION
do
    if [ -n $"$i" ]
    then
        valid=$((valid+1))
    fi
done

if [ $valid -lt 2 ]
then
    echo "Usage: ./replace.sh $PROJECT_NAME ...$PROJECT_DESCRIPTION..."
    exit 1
fi

if [ ! -n $"$PROJECT_PASSWORD" ]
then
    PYTHON_COMMAND="python -c 'import secrets; print(secrets.token_urlsafe(16))'"
    PROJECT_PASSWORD=$(eval $PYTHON_COMMAND)
fi

if [ ! -n $"$PROJECT_SECRET" ]
then
    PYTHON_COMMAND="python -c 'import secrets; print(secrets.token_urlsafe(64))'"
    PROJECT_SECRET=$(eval $PYTHON_COMMAND)
fi

echo "PROJECT_NAME: $PROJECT_NAME"
echo "PROJECT_DESCRIPTION: $PROJECT_DESCRIPTION"
echo "PROJECT_PASSWORD: $PROJECT_PASSWORD"
echo "PROJECT_SECRET: $PROJECT_SECRET"

# replace search strings with new values
PROJECT_DIR=$PROJECT_NAME
find ./ -type f \( ! -iname "replace.sh" \) -not -path '*/\.git/*' -exec sed -i '' -e "s/\<\<project\_name\>\>/$PROJECT_NAME/g" {} \;
find ./ -type f \( ! -iname "replace.sh" \) -not -path '*/\.git/*' -exec sed -i '' -e "s/\<\<project\_description\>\>/$PROJECT_DESCRIPTION/g" {} \;
find ./ -type f \( ! -iname "replace.sh" \) -not -path '*/\.git/*' -exec sed -i '' -e "s/\<\<project\_password\>\>/$PROJECT_PASSWORD/g" {} \;
find ./ -type f \( ! -iname "replace.sh" \) -not -path '*/\.git/*' -exec sed -i '' -e "s/\<\<project\_secret\>\>/$PROJECT_SECRET/g" {} \;
mv "<<project_name>>" "$PROJECT_NAME"
