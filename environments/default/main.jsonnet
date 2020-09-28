(import "etcd-operator.libsonnet") +
(import "minio-gateway-azure-libsonnet/minio-azure-gateway.libsonnet") +
{
    _config+:: {
        namespace: 'example',
        etcd_operator_namespace: 'etcd-operator',

        storage_account: 'foo',
        storage_account_key: 'supersecret'
    },
}