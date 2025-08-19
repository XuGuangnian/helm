## 说明
`convert.sh` 是将官方的milvus 转换为 k8s template 可用的版本

1. 修改user.yaml，启用认证添加如下配置，默认用户密码：root/Milvus
```yaml
common:
  security:
    authorizationEnabled: true
```
2. 执行`convert.sh`
