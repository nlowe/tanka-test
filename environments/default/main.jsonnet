local tk = import "tk";

(import "minio-gateway-azure-libsonnet/minio-azure-gateway.libsonnet") +
{
    _config+:: {
        namespace: tk.env.spec.namespace,

        storage_account: 'foo',
        storage_account_key: 'supersecret'
    },
}