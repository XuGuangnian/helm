#! /bin/bash

# 转换milvus chart 为milvus-5.0.0 chart

# 错误处理
set -e

# WORK_DIR=/root/addons/milvus-5.0.0
WORK_DIR=/home/gengen/workspace/helm/milvus

cp $WORK_DIR/values.yaml $WORK_DIR/ds-milvus-values.yaml

# 去除repository 的 ""
sed -i 's/^\(\s*repository:\) "\([^"]*\)"/\1 \2/' $WORK_DIR/ds-milvus-values.yaml

# namespace: default 改为 namespace: milvus
sed -i 's/^\(\s*namespace:\) default/\1 milvus/' $WORK_DIR/ds-milvus-values.yaml

# registry: docker.io 改为 registry:
find $WORK_DIR/ -name "*.yaml" -type f | xargs sed -i 's/^\(\s*registry:\) docker.io/\1/'

# repository：xx 改为 repository：REGIP/xx
sed -i 's/^\(\s*repository:\) \([^"]*\)/\1 REGIP\/\2/' $WORK_DIR/ds-milvus-values.yaml

echo "转换完成"
